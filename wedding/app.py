import json
import logging
import os
import sys

from bottle import (
    TEMPLATE_PATH, route, run, static_file, redirect, request,
    jinja2_template as template
)

from wedding import imgur_helper

LOG = logging.getLogger(__name__)
LOG.addHandler(logging.StreamHandler(sys.stderr))
LOG.setLevel(logging.DEBUG)

# Return a filesystem path relative to the root of the project.
from_here = lambda s: os.path.join(
    os.path.dirname(os.path.abspath(__file__)), os.path.pardir, s)

# Add template directory to where Bottle looks for templates.
TEMPLATE_PATH.append(from_here('templates'))

@route('/favicon.ico')
def favicon():
    return static_file("favicon.ico", root=from_here('static'))

@route('/static/<filename:path>')
def static(filename):
    '''Get a static resource by relative path.'''
    return static_file(filename, root=from_here('static'))


def _photo_info(photo):
    return {
        'width': photo.width,
        'height': photo.height,
        'href': photo.link
    }


@route('/')
def main_page():
    # Refresh photos on page reload.
    photo_links = map(_photo_info, imgur_helper.all_photos())
    photos_json = json.dumps(photo_links)
    LOG.debug('photo_links = %s' % photos_json)
    return template('grid.tpl', photo_links=photos_json)

@route('/photo-upload', method='POST')
def submit_photo():
    # Could also include title/description here with kwargs.
    result = imgur_helper.upload_from_buffer(request.files.photo_file.file)
    LOG.debug('uploaded photo, result was: %r' % result)
    photo_links = map(_photo_info, imgur_helper.all_photos())
    photos_json = json.dumps(photo_links)
    LOG.debug('returning all photos after upload: %s' % photos_json)
    # Return all current images.
    return photos_json


def main():
    run(host='0.0.0.0', port=int(os.environ.get('PORT', 8080)), debug=True)


if __name__ == '__main__':
    main()
