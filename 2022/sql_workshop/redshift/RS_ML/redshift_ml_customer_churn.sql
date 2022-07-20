/** Customer Churn Model */
/* Tutorial available here: https://docs.aws.amazon.com/redshift/latest/dg/tutorial_customer_churn.html */

/** Prepare the dataset */
DROP TABLE IF EXISTS eds_sandbox.customer_activity;
CREATE TABLE
    eds_sandbox.customer_activity
    (
        state VARCHAR(2),
        account_length INT,
        area_code INT,
        phone VARCHAR(8),
        intl_plan VARCHAR(3),
        vMail_plan VARCHAR(3),
        vMail_message INT,
        day_mins FLOAT,
        day_calls INT,
        day_charge FLOAT,
        total_charge FLOAT,
        eve_mins FLOAT,
        eve_calls INT,
        eve_charge FLOAT,
        night_mins FLOAT,
        night_calls INT,
        night_charge FLOAT,
        intl_mins FLOAT,
        intl_calls INT,
        intl_charge FLOAT,
        cust_serv_calls INT,
        churn VARCHAR(6),
        record_date DATE
    ) ;

/** Using the publicly available customer churn prediction dataset from the University of California Irvine Repository of Machine Learning Datasets. */
/** Mobile operators have historical records on which customers ultimately ended up churning and which continued using the service. */
/** Construct a machine learning model of one mobile operator�s churn using a process called training. */
/** After training the model, the profile information of an arbitrary customer is used to train the model.*/
/** Then Redshift passes this information to the model and uses the model to predict whether this customer is going to churn. */
CREATE MODEL customer_churn_auto_model FROM (
    SELECT 
        state,
        account_length,
        area_code,
        total_charge/account_length AS average_daily_spend, 
        cust_serv_calls/account_length AS average_daily_cases,
        churn 
      FROM eds_sandbox.customer_activity
      WHERE  record_date < '2020-01-01' 
  )
  TARGET churn 
  FUNCTION ml_fn_customer_churn_auto
  IAM_ROLE 'arn:aws:iam::123456789012:role/Redshift-ML'
  SETTINGS (S3_BUCKET 'redshift-ml-123456789012');

/** Copy data from file to the table */
COPY eds_sandbox.customer_activity
FROM 's3://bucket.landing/redshift_ml/customer_activity.csv'
REGION 'eu-west-1' 
CREDENTIALS 'aws_access_key_id=xxxx;aws_secret_access_key=xxxxx'
DELIMITER ',' IGNOREHEADER 1;

/** Predict whether customers who signed-up after 01/01/2020 go through churn or not */
SELECT
    phone,
    ml_fn_customer_churn_auto (state, 
                               account_length,
                               area_code,
                               total_charge / account_length,
                               cust_serv_calls / account_length) AS active
FROM
    eds_sandbox.customer_activity
WHERE
    record_date > '2020-01-01';

/** Predict the proportion of churners and nonchurners among customers from different states
    where the record date is greater than 2020-01-01 */          
WITH
    inferred AS
    (
     SELECT
            state,
            ml_fn_customer_churn_auto (state, 
                                       account_length,
                                       area_code,
                                       total_charge / account_length,
                                       cust_serv_calls / account_length) AS active
    FROM
        eds_sandbox.customer_activity
    WHERE
        record_date > '2020-01-01'
    )
SELECT
    state,
    SUM(
        CASE
            WHEN active = 'True.'
            THEN 1
            ELSE 0
        END) AS churners,
    SUM(
        CASE
            WHEN active = 'False.'
            THEN 1
            ELSE 0
        END) AS nonchurners,
    COUNT(*) AS total_per_state
FROM
    inferred
GROUP BY state
ORDER BY state;
