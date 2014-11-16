{% extends "base.tpl" %}
{% block title %}Photos{% endblock %}
{% block content %}

<input type="file" id="file" onchange="s3_upload();"/>

<p id="status">Please select a file</p>

<div id="preview"><img src="/static/default.png"  /></div>

<form method="POST" action="/submit_photo">
    <input type="hidden" id="photo_url" name="photo_url" />
    <input type="submit" value="Update photo" />
</form>

{% endblock %}
