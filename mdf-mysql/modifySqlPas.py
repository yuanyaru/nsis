# -*- coding: utf-8 -*-
"""
@CreateTime ： 2022/5/7 14:06
@Author： yuanyaru
@FileName: modifySqlPas.py
@desc:用于修改 mysql 初始密码
"""

import os
import pymysql
import configparser


def change_mysql_password():
    # os.system('chcp 65001')
    #
    # path = "D:/install_file/mysql/mysql-5.7.16-winx64/bin"
    # os.chdir(path)
    # print(os.getcwd())
    #
    # cmd = 'mysql -u root -p; ;show databases;'
    # os.system(cmd)

    exe_dir = os.getcwd()  # 取得绝对路径
    path = os.path.join(exe_dir, r"config\config.ini")  # 拼接上配置文件名称目录
    config = configparser.ConfigParser()  # 类实例化
    config.read(path)
    host = config['mysql']['host']
    user = config['mysql']['user']
    password = config['mysql']['password']
    newpassword = config['mysql']['newpassword']

    db = pymysql.connect(host, user, password)
    cursor = db.cursor()
    cursor.execute('flush privileges;')
    cursor.execute('set password for root@localhost = %s;', newpassword)
    db.close()


if __name__ == '__main__':
    change_mysql_password()
