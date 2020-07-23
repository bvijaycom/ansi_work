import json

with open('jino.json') as data_file:    
    data = json.load(data_file)
    for v in data:
        print v
