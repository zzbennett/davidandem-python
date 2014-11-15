import os

from bottle import route, run
from pymongo import MongoClient


MONGO_HOST = os.environ.get('MONGO_HOST', 'localhost')
MONGO_PORT = int(os.environ.get('MONGO_PORT', 27017))

db = MongoClient(MONGO_HOST, MONGO_PORT).wedding


@route('/photo/upload', method='POST')
def upload_photo():
    pass


@route('/')
def hello():
    return "Hello World!"


def main():
    run(host='0.0.0.0', port=int(os.environ.get('PORT', 8080)), debug=True)


if __name__ == '__main__':
    main()
