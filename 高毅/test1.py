# -*- coding: utf-8 -*-
"""
Created on Tue Apr 27 23:27:45 2021

@author: 秃头披风侠
"""
from PIL import Image
import tesserocr, requests
import os
# 图片下载链接
image_url = 'https://uap.sdwu.edu.cn/lyuapServer/captcha.jsp?time0.22287520514266546'
# 图片保存路径
image_path = 'C:/Users/gao/Desktop/img/1.jpg'
rootdir = 'C:/Users/gao/Desktop/img/'
img_list = os.listdir(rootdir) #列出文件夹下所有的目录与文件
    
print(list)
headers = {
    'Users-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36'
}


image_url = 'https://uap.sdwu.edu.cn/lyuapServer/captcha.jsp?time0.22287520514266546'
headers = {
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36'
}
a = 1
for i in range(1,100):
    r = requests.get(image_url, headers = headers,verify=False)
    r.encoding = 'utf-8'
    print(r.status_code)
    dir = 'C:/Users/gao/Desktop/img/'+ str(a) + '.jpg'
    fn = open(dir,'wb')
    fn.write(r.content)
    fn.close()
    a+=1

#def image_download():
   # response = requests.get(image_url)
    #with open(image_path, 'wb') as f:
      #  f.write(response.content)
        
def get_image(image_path):
    image = Image.open(image_path)
    return image

def image_grayscale_deal(image):
    image = image.convert('L')
    #取消注释后可以看到处理后的图片效果
    #image.show()
    return image

def image_thresholding_method(image):
    # 阈值
    threshold = 160
    table = []
    for i in range(256):
        if i < threshold:
            table.append(0)
        else:
            table.append(1)
            # 图片二值化，此处第二个参数为数字一
            #image = image.point(table, '1')
            #取消注释后可以看到处理后的图片效果
            #image.show()
    return image


def captcha_tesserocr_crack(image):
    result = tesserocr.image_to_text(image)
    return result


if __name__ == '__main__':
    #image_download()
    for img in img_list:
        image = get_image(rootdir+'/'+img)
        img1 = image_grayscale_deal(image)
        img2 = image_thresholding_method(img1)
        print(captcha_tesserocr_crack(img2))