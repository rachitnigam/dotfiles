#!/usr/local/bin/python

import MySQLdb.cursors
import os

db = MySQLdb.connect(db="directory", host="localhost",
                     port=3306, user="root", passwd="",
                     cursorclass=MySQLdb.cursors.DictCursor)

cur = db.cursor()
pwd = os.environ['PWD']

cur.execute(
    "INSERT INTO dircounts (path, count) VALUES (%s, 1) ON DUPLICATE KEY UPDATE count = count + 1",
    (pwd)
)

db.commit()
db.close()