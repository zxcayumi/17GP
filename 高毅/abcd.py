# # -*- coding: utf-8 -*-
# """
# Created on Sat Mar  7 20:44:28 2020

# @author: gao
# """
import json
with open('D:\Python\image\\via_export_json.json','r',encoding='utf8')as fp:
    json_data = json.load(fp)
    print('这是文件中的json数据：',json_data)
    print('这是读取到文件数据的数据类型：', type(json_data))

