#!/usr/bin/python3
# 这是一行注释

# 解释器输出下关键字列表
import keyword
keyword.kwlist
# 关键字列表结束输出

'''
第三行注释
第四行注释
'''

"""
第五行注释
第六行注释
"""

print("Hello World2") # 第二个注释


if True:
    print ("Answer")
    print ("True")
else:
    print ("Answer")
    print ("False")    # 缩进不一致，会导致运行错误


if True:
    str1 = '12233232'
    str2 = "123213"
    str3 = '''dsddsdds sdsds sds
    dsdsdsfv
    vfvfvf
    vfvf
    vf
    vf
    xds'''
    str4 = '12323\
    am\
    sdsds\
    '
    print(str1)
    print(str2)
    print(str3)
    print(str4)


input("\n\n按下 enter 键后退出。")

import sys; x = 'runoob'; sys.stdout.write(x + '\n')


sys.stdout.write(" hi " + '\n')


print('Hello World!')
print('what youra name?') # ask for your name
myName = input()
print('It is good to meet you, ' + myName)
print('The length of your name is: ')
print(len(myName))
print('What your age is?') #ask their age
myAge = input()
print('You will be ' + str(int(myAge) + 1) + ' in a year ') 

print('We need test your first name\n: ')
str = input()
if 'youfucai' == str :
    print ('you are real, ' + str + '.')
else : 
    print ('you are not raal, ' + str + '.')

if input () == 'youfucai' :
    print ('you are youfucai!')
elif input () > 2000 :
    print ('you are old boy')
else :
    print ('it is nor anything')

name = ''
while name != 'youfucai':
    print (' please enter your name.')
    name = input ()
print ('Thank you very much.')
