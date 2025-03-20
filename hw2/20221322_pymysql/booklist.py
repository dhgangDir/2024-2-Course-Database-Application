import pymysql

host = "localhost"
port = 3306
database = "madangdb"
username = "GangDonghwan"
password = "ak#!wp4811"

# 접속 상태 확인
conflag = True

try:
    print('데이터베이스 연결 준비...')
    conn = pymysql.connect(host=host, user=username, passwd=password, db= database,
                           port=port, charset='utf8')
    print('데이터베이스 연결 성공')
except Exception as e:
    print('데이터베이스 연결 실패')
    conflag=False

# 접속에 성공하면 실행
if conflag == True:
    cursor = conn.cursor()
    
    sqlstring = 'select * from book;'
    
    res = cursor.execute(sqlstring)
    
    data = cursor.fetchall()
    
    # 화면에 출력
    print('{0}\t{1:<} \t{2:<} \t{3:>}'.format('BOOK NO', 'BOOK NAME',
            'PUBLISHER', 'PRICE'))
    for rowdata in data:
        print('{0}\t{1:<} \t{2:<} \t{3:>}'.format(rowdata[0], rowdata[1],
            rowdata[2], rowdata[3]))
cursor.close()

conn.close()