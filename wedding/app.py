import datetime
import os
import time
import base64
import hmac
import urllib
import json

from hashlib import sha1

from bottle import (
    TEMPLATE_PATH, route, run, static_file, redirect, request,
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


@route('/photos')
def photos():
    all_photos = db.photos.find()
    return template('photos.tpl', photos=list(all_photos))


@route('/travel-info')
def travel_info():
    return template('travel-info.tpl')


@route('/')
def main_page():
    return template('base.tpl')


@route('/sign_s3')
def sign_s3():
    AWS_ACCESS_KEY = os.environ.get('AWS_ACCESS_KEY')
    AWS_SECRET_KEY = os.environ.get('AWS_SECRET_KEY')
    S3_BUCKET = os.environ.get('S3_BUCKET')

    object_name = request.GET.get('s3_object_name')
    mime_type = request.GET.get('s3_object_type')

    expires = long(time.time()+10)
    amz_headers = "x-amz-acl:public-read"

    put_request = "PUT\n\n%s\n%d\n%s\n/%s/%s" % (mime_type, expires, amz_headers, S3_BUCKET, object_name)

    signature = base64.encodestring(hmac.new(AWS_SECRET_KEY, put_request, sha1).digest())
    signature = urllib.quote_plus(signature.strip())

    url = 'https://%s.s3.amazonaws.com/%s' % (S3_BUCKET, object_name)

    return json.dumps({
        'signed_request': '%s?AWSAccessKeyId=%s&Expires=%d&Signature=%s' % (url, AWS_ACCESS_KEY, expires, signature),
        'url': url
    })


@route('/photos/upload', method='POST')
def submit_photo():
    photo_url = request.forms.get("photo_url")
    store_photo(photo_url)
    return redirect('/photos')


@route('/photos/upload', method='GET')
def submit_photo_form():
    return template('upload_photo.tpl')


def store_photo(photo_url):
    '''Store photo url in MongoDB.'''
    # XXX: Other information to store here?
    doc = {'url': photo_url, 'upload_date': datetime.datetime.now()}
    db.photos.save(doc)


def main():
    run(host='0.0.0.0', port=int(os.environ.get('PORT', 8080)), debug=True)


if __name__ == '__main__':
    main()
