# -*- coding: utf-8 -*-
"""
Created on Sat Mar 14 17:31:14 2020

@author: gao
"""


import json
with open('D:\Python\image\\via_export_json.json','r',encoding='utf8')as fp:
    json_data = json.load(fp)
    family = json_data['10.1.1.1.2018-4.png1021424']['regions']

for i in family:
    a=i['shape_attributes']
    print('x:'+str(list(a.values())[list(a.keys()).index('x')]))
    print('y:'+str(list(a.values())[list(a.keys()).index('y')]))
    print('height:'+str(list(a.values())[list(a.keys()).index('height')]))
    print('width:'+str(list(a.values())[list(a.keys()).index('width')]))
    print("   ")
    # print(json_data['10.1.1.1.2018-4.png1021424']['regions'])


    # print('这是文件中的json数据：',json_data)
    # print('这是读取到文件数据的数据类型：', type(json_data))
