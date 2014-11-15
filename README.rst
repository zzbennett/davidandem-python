David and Emily are Getting Married
===================================

And we're building the website!


Setup
~~~~~

::

    pip install -r requirements.txt
    export PYTHONPATH=.
    python wedding/app.py


Assets
^^^^^^

*Static* assets should be placed in the 'static' directory at the root of the repository. All static resources will be served from the ``/static`` path. For example, if you had an image ``<repository root>/static/images/kiss.png``, you could reference this in HTML from ``/static/images/kiss.png``.

*Templates* can be rendered just by calling the ``template()`` function from the ``bottle`` module.
