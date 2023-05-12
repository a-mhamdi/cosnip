import os

url = os.environ['URL']
api_key = os.environ['API_KEY']

import urllib.request as request

import json 

data =  {

        "Inputs": {

                "input1":
                {
                    "ColumnNames": ["sepal-length", "sepal-width", "petal-length", "petal-width"],
                    "Values": [ [ "6", "3", "4.8", "1.8" ], # 1
                                [ "5.1", "3.5", "1.4", ".3" ], # 0
                               ]
                },        },
            "GlobalParameters": {
}
    }

body = str.encode(json.dumps(data))

headers = {'Content-Type':'application/json', 'Authorization':('Bearer '+ api_key)}

req = request.Request(url, body, headers) 

try:
    response = request.urlopen(req)

    result = response.read()
    print(result) 
except request.HTTPError as error:
    print("The request failed with status code: " + str(error.code))

    # Print the headers - they include the request ID and the timestamp, which are useful for debugging the failure
    print(error.info())

    print(json.loads(error.read()))                 