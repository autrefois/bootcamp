import requests
import pandas as pd
import numpy as np

# f1 all races schedule

f1_races = {
    'season': [],
    'round': [],
    'circuit_id': [],
    'raceName': [],
    'url': [],
    'LAT': [],
    'LONG': [],
    'locality': [],
    'country': [],
    'date': [],
    'time': []
}

for year in list(range(1950, 2023)):

    url = 'https://ergast.com/api/f1/{}.json'
    r = requests.get(url.format(year))
    j = r.json()

    for item in j['MRData']['RaceTable']['Races']:
        try:
            f1_races['season'].append(int(item['season']))
            f1_races['round'].append(int(item['round']))
            f1_races['circuit_id'].append(item['Circuit']['circuitId'])
            f1_races['raceName'].append(item['raceName'])
            f1_races['url'].append(item['url'])
            f1_races['LAT'].append(float(item['Circuit']['Location']['lat']))
            f1_races['LONG'].append(float(item['Circuit']['Location']['long']))
            f1_races['locality'].append(item['Circuit']['Location']['locality'])
            f1_races['country'].append(item['Circuit']['Location']['country'])
            f1_races['date'].append(item['date'])
            f1_races['time'].append(item.get('time'))
        except Exception as e:
            print(f'Error adding item: {item}')
            print(e.with_traceback)
            raise

f1_races = pd.DataFrame(f1_races)

# f1 all time races results

rounds = []
for year in np.array(f1_races.season.unique()):
    rounds.append([year, list(f1_races[f1_races.season == year]['round'])])

f1_results = {
    'season': [],
    'Round': [],
    'date': [],
    'circuit_id': [],
    'driver': [],
    'DATE_of_birth': [],
    'nationality': [],
    'constructor': [],
    'GriD': [],
    'tIME': [],
    'Status': [],
    'points': [],
    'podium': []
}

for n in list(range(len(rounds))):
    for i in rounds[n][1]:

        url = 'http://ergast.com/api/f1/{}/{}/results.json'
        r = requests.get(url.format(rounds[n][0], i))
        json = r.json()

        try:
            for item in json['MRData']['RaceTable']['Races'][0]['Results']:
                try:
                    f1_results['season'].append(int(json['MRData']['RaceTable']['Races'][0]['season']))
                    f1_results['Round'].append(int(json['MRData']['RaceTable']['Races'][0]['round']))
                    f1_results['date'].append(json['MRData']['RaceTable']['Races'][0]['date'])
                    f1_results['circuit_id'].append(json['MRData']['RaceTable']['Races'][0]['Circuit']['circuitId'])
                    f1_results['driver'].append(item['Driver']['driverId'])
                    f1_results['DATE_of_birth'].append(item['Driver']['dateOfBirth'])
                    f1_results['nationality'].append(item['Driver']['nationality'])
                    f1_results['constructor'].append(item['Constructor']['constructorId'])
                    f1_results['GriD'].append(int(item['grid']))
                    f1_results['tIME'].append(int((item.get('Time') or {}).get('millis')) 
                        if bool((item.get('Time') or {}).get('millis')) else None)
                    f1_results['Status'].append(item['status'])
                    f1_results['points'].append(item['points'])
                    f1_results['podium'].append(int(item['position']))
                except Exception as e:
                    print(f'Error adding item: {item}')
                    print(e.with_traceback)
                    raise
        except IndexError:
            print(f'Race has not happened yet... ({rounds[n][0]} Round {i})')
            continue

f1_results = pd.DataFrame(f1_results)

# export the data
f1_races.to_csv('f1_races.csv', mode='a')
f1_results.to_csv('f1_results.csv', mode='a')
