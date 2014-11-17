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


@route('/test/images')
def test_images():
    return template('base.tpl')


@route('/test/grid')
def test_grid():
    # TODO: Use this template for the main page, and make sub-pages
    # use Bootstrap's modal feature.
    return template('grid.tpl')


@route('/photos')
def photos():
    all_photos = db.photos.find()
    return template('photos.tpl', photos=list(all_photos))


@route('/travel-info')
def travel_info():
    return template('travel-info.tpl')


@route('/')
def main_page():
    return template('grid.tpl')


@route('/photos/upload', method='POST')
def submit_photo():
    # TODO: hook into imgur upload.
    return redirect('/photos')


@route('/photos/upload', method='GET')
def submit_photo_form():
    # TODO: provide some kind of template containing a form for image
    # upload to imgur. This may be the same view as the gallery.
    return redirect('/')


def main():
    run(host='0.0.0.0', port=int(os.environ.get('PORT', 8080)), debug=True)


if __name__ == '__main__':
    main()
