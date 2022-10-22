from sqlite3 import Connection, IntegrityError
from os.path import dirname, join

sql_dir = join(dirname(__file__), '../sql')


def init_db(connection: Connection):
    execute_sqlscript(connection, 'create_db.sql')
    try:
        execute_sqlscript(connection, 'insert_data.sql')
    except IntegrityError:
        return


def execute_sqlscript(connection: Connection, filename: str):
    cursor = connection.cursor()
    file = open(join(sql_dir, filename), 'r')
    sql = file.read()
    file.close()

    cursor.executescript(sql)

    connection.commit()


def execute_sqlfile(connection: Connection, filename: str,
                    options={}):
    cursor = connection.cursor()
    file = open(join(sql_dir, filename), 'r')
    sql = file.read()
    file.close()

    return cursor.execute(sql, options)
