import os

from bottle import (
    TEMPLATE_PATH, route, run, static_file, redirect,
    jinja2_template as template
)
from pymongo import MongoClient


# Return a filesystem path relative to the root of the project.
from_here = lambda s: os.path.join(
    os.path.dirname(os.path.abspath(__file__)), os.path.pardir, s)

# Add template directory to where Bottle looks for templates.
TEMPLATE_PATH.append(from_here('templates'))

MONGO_URL = os.environ.get('MONGOHQ_URL', "mongodb://localhost:27017")
db = MongoClient(MONGO_URL).wedding


@route('/static/<filename:path>')
def static(filename):
    '''Get a static resource by relative path.'''
    return static_file(filename, root=from_here('static'))


@route('/')
def main_page():
    return template('grid.tpl')


@route('/photo-upload', method='POST')
def submit_photo():
    # TODO: hook into imgur upload.
    return redirect('/photos')


def main():
    run(host='0.0.0.0', port=int(os.environ.get('PORT', 8080)), debug=True)


if __name__ == '__main__':
    main()
