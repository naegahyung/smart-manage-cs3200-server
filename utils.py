import mysql.connector as mysql
import re
import json

def post_sql_data(query, body):
    db = mysql.connect(host='localhost',user='root',password='',database='smart_manage')
    _sql_commit(db, query(body))
    db.close()
    result = {}
    for key, value in body.items():
        result[str(key)] = str(value)
    return json.dumps(result)

def _sql_commit(db, query):
    cursor = db.cursor()
    cursor.execute(query)
    db.commit()
    cursor.close()

def get_sql_data(query):
    db = mysql.connect(host='localhost',user='root',password='',database='smart_manage')
    sql_data_with_header = _sql_execute(db, query)
    db.close()
    json_string = _convert_mysql_json_string(sql_data_with_header)
    return json.dumps(json_string)

def get_sql_data_single_value(query):
    db = mysql.connect(host='localhost',user='root',password='',database='smart_manage')
    sql_data_with_header = _sql_execute(db, query)
    db.close()
    data = sql_data_with_header[1]
    print(data[0][0])
    return data[0][0]

def _sql_execute(db, query):
    cursor = db.cursor()
    cursor.execute(query)
    row_headers = [x[0].encode('utf-8') for x in cursor.description]
    data = [[str(item) for item in results] for results in cursor.fetchall()]
    cursor.close()
    return [row_headers, data]

def _convert_mysql_json_string(sql_query_result):
    header = sql_query_result[0]
    data = sql_query_result[1]
    json_data = _jsonify(header, data)
    result = _convert_any_datetime_to_time(str(json_data))
    
    return result

def _jsonify(header, data):
    json_data = []
    for data_point in data:
        json_data.append(dict(zip(header,data_point)))
    return json_data

def _convert_any_datetime_to_time(s):
    pattern = ur"datetime\.datetime\(.[^\)]*\)"
    datetimes = re.findall(pattern, s)
    result = s
    for time in datetimes:
        result = result.replace(time, _replace_datetime_to_time(time))
    return result


def _replace_datetime_to_time(time):
    date_numbers = time.replace('datetime.datetime(', '').replace(')', '')
    arr = date_numbers.split(', ')
    return '%s/%s/%s' % (arr[0], arr[1], arr[2])