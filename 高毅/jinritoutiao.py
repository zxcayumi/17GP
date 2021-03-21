# -*- coding: utf-8 -*-
"""
Created on Fri Feb 26 20:14:46 2021

@author: 秃头披风侠
"""
import json
import requests
if __name__=='__main__':
    url="https://www.toutiao.com/a6933538415501640199/"
    respone = requests.get(url)
    results = respone.text
    resultsdata = json.loads(results)
    print(resultsdata)