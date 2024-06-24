import mysql.connector
import sqlite_utils
import os

# Настройки подключения к MySQL из settings.py
mysql_config = {
    'user': os.environ.get('DB_USER', 'root'),
    'password': os.environ.get('DB_PASSWORD', 'root'),
    'host': os.environ.get('DB_HOST', 'localhost'),
    'database': os.environ.get('DB_NAME', 'bpmflow_db'),
    'port': os.environ.get('DB_PORT', '3306'),
}

# Подключение к MySQL
mysql_conn = mysql.connector.connect(**mysql_config)
mysql_cursor = mysql_conn.cursor()

# Создание и подключение к SQLite
sqlite_db_path = 'bpmflow_db.sqlite3'
if os.path.exists(sqlite_db_path):
    os.remove(sqlite_db_path)
sqlite_conn = sqlite_utils.Database(sqlite_db_path)

# Получение списка таблиц
mysql_cursor.execute("SHOW TABLES")
tables = mysql_cursor.fetchall()

for table in tables:
    table_name = table[0]
    
    # Получение схемы таблицы
    mysql_cursor.execute(f"SHOW CREATE TABLE {table_name}")
    create_table_sql = mysql_cursor.fetchone()[1]
    
    # Замена синтаксиса для SQLite
    create_table_sql = create_table_sql.replace('AUTO_INCREMENT', '')
    create_table_sql = create_table_sql.replace('ENGINE=InnoDB', '')
    create_table_sql = create_table_sql.replace('DEFAULT CHARSET=utf8mb4', '')
    
    # SQLite не поддерживает комментарии в схемах
    create_table_sql = "\n".join([line for line in create_table_sql.split("\n") if not line.startswith('/*') and not line.endswith('*/')])
    
    # Создание таблицы в SQLite
    try:
        sqlite_conn.execute(create_table_sql)
    except Exception as e:
        print(f"Error creating table {table_name}: {e}")
        print(create_table_sql)
    
    # Копирование данных
    mysql_cursor.execute(f"SELECT * FROM {table_name}")
    rows = mysql_cursor.fetchall()
    columns = [col[0] for col in mysql_cursor.description]
    sqlite_conn[table_name].insert_all(
        (dict(zip(columns, row)) for row in rows),
        pk='id',
        replace=True
    )

# Закрытие подключений
mysql_conn.close()
