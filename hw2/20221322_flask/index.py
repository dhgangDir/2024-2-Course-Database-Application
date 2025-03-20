from flask import Flask, render_template, request
import pymysql

app = Flask(__name__)

import pymysql

host = "localhost"
port = 3306
database = "madangdb"
username = "GangDonghwan"
password = "ak#!wp4811"

try:
    print('데이터베이스 연결 준비...')
    db = pymysql.connect(host=host, user=username, passwd=password, db= database,
                           port=port, charset='utf8')
    print('데이터베이스 연결 성공')
except Exception as e:
    print('데이터베이스 연결 실패')

cur = db.cursor()

@app.route('/')
def index():
    sqlstring = "SELECT * FROM Book"
    cur.execute(sqlstring)
    
    book_list = cur.fetchall()
    return render_template('booklist.html', book_list=book_list)

@app.route('/view')
def getTicket():
    id = request.args.get('id')
    sqlstring = "SELECT * FROM BOOK where bookid= '"+id+"'"
    cur.execute(sqlstring)
    
    book = cur.fetchall()
    return render_template('bookview.html', book=book)

if __name__ == '__main__':
    app.run('127.0.0.1')