import os

from bottle import TEMPLATE_PATH, template, route, run, static_file
from pymongo import MongoClient


# Return a filesystem path relative to the root of the project.
from_here = lambda s: os.path.join(
    os.path.dirname(os.path.abspath(__file__)), os.path.pardir, s)

# Add template directory to where Bottle looks for templates.
TEMPLATE_PATH.append(from_here('templates'))

MONGO_HOST = os.environ.get('MONGO_HOST', 'localhost')
MONGO_PORT = int(os.environ.get('MONGO_PORT', 27017))

db = MongoClient(MONGO_HOST, MONGO_PORT).wedding


@route('/static/<filename:path>')
def static(filename):
    '''Get a static resource by relative path.'''
    return static_file(filename, root=from_here('static'))


@route('/test/images')
def test_images():
    return template('base.tpl')


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
