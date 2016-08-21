#!/usr/local/bin/python

import MySQLdb.cursors

db = MySQLdb.connect(db="directory", host="localhost",
                     port=3306, user="root", passwd="",
                     cursorclass=MySQLdb.cursors.DictCursor)

cur = db.cursor()

cur.execute("UPDATE dircounts SET count=count/2")
db.commit()
db.close()