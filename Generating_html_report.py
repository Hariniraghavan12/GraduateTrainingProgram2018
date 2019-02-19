import HTML
import webbrowser
import sqlite3
from sqlite3 import OperationalError
def db_connection():
    res=()
    
    conn = sqlite3.connect("htmltable.db")
    cursor=conn.cursor()

    fd=open('queries.sql','r')
    sqlfile=fd.read()
    fd.close()

    sqlcommands=sqlfile.split(';')

    for command in sqlcommands:
        try:
            row=cursor.execute(command)
            head=[i[0] for i in cursor.description]
            res=row.fetchall()
            for i in res:
                try:
                    print i
                except:
                    print("exception")
            res.insert(0,head)
            return res
        except:
            print("exception")
            
def write_html(message):
    #db_connection()
    f = open('helloworld.html','w')
    s=f.write(message)
    f = open('helloworld.html','r')
    f.read()
    webbrowser.open_new_tab('helloworld.html')
    f.close()

def tables_html():
    res=db_connection()
    #print(list(res))
    table_data = res
    htmlcode = HTML.table(res)
    print htmlcode
    write_html(htmlcode)
    
tables_html()
