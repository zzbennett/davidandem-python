import base64
import os

import imgurpython

getenv = os.environ.get

ALBUM_ID = None         # Set later upon initialization.
ALBUM_NAME = 'wedding'

CLIENT_USERNAME = getenv('IMGUR_CLIENT_USERNAME')
CLIENT_ID = getenv('IMGUR_CLIENT_ID')
CLIENT_SECRET = getenv('IMGUR_CLIENT_SECRET')

ACCESS_TOKEN = getenv('IMGUR_ACCESS_TOKEN')
REFRESH_TOKEN = getenv('IMGUR_REFRESH_TOKEN')

client = imgurpython.ImgurClient(
    CLIENT_ID, CLIENT_SECRET, ACCESS_TOKEN, REFRESH_TOKEN)


def upload_from_buffer(buff, title=None, description=None):
    """Upload an image stored in a buffer to imgur."""
    assert(ALBUM_ID is not None)

    data = {
        'image': base64.b64encode(buff.read()),
        'type': 'base64',
        'album': ALBUM_ID
    }
    if title:
        data['title'] = title
    if description:
        data['description'] = description
    # Last argument: whether to post anonymously (False)
    return client.make_request('POST', 'upload', data, False)


def all_photos():
    """Get all photos in the wedding album."""
    return client.get_album_images(ALBUM_ID)


def get_wedding_album_id():
    """Get the id for the wedding album.
    This needs to be called before anything else in this module.
    """
    albums = client.get_account_albums(CLIENT_USERNAME)
    for album in albums:
        if album.title == 'wedding':
            wedding_album = album
            break
    else:
        response = client.create_album({
            'title': 'wedding',
            'privacy': 'private'
        })
        wedding_album = client.get_album(response['id'])
    global ALBUM_ID
    ALBUM_ID = wedding_album.id
