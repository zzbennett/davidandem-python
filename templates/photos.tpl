{% extends "base.tpl" %}
{% block title %}Photos{% endblock %}
{% block content %}
  {% for photo in photos %}
    <label for="photo-{{ photo._id }}">Uploaded {{ photo.upload_date }}</label>
    <img name="photo-{{ photo._id }}" class="photo-{{ photo._id }}" src="{{ photo.url }}" />
  {% endfor %}
  <a href="/photos/upload">Upload Photo</a>
{% endblock %}
