# we will use mean on order to get the average price
from statistics import mean
# generate an iterator for the lines in the file
lines = (line for line in open("resources/airport_log.csv"))

list_line = (s.rstrip().split(",") for s in lines)
cols = next(list_line)
airport_logs_dicts = (dict(zip(cols, data)) for data in list_line)
clj_ams_prices = (
    int(airport_logs_dict["ticket_price"])
    for airport_logs_dict in airport_logs_dicts
    if (airport_logs_dict["departure"] == "CLJ"
        and airport_logs_dict["arrival"] == "AMS")
)

# for testing purposes - check all the prices
while (i := next(clj_ams_prices, False)):
    print(i)

# avg_ticket_price = mean(clj_ams_prices)
# print(f"The average ticket price: ${avg_ticket_price}")
