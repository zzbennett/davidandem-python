{% extends "base.tpl" %}

{% block title %}Travel Information{% endblock %}

{% block stylesheets %}
  <link rel="stylesheet" type="text/css" href="/static/css/maps.css" />
{% endblock stylesheets %}

{% block content %}
  <p>The wedding will be held at the Denver Athletic Club, in the heart of Denver, CO! There are ample hotels from which to choose in the area. See the map below for the location of the athletic club and surrounding accommodations.</p>

  <h2>Map</h2>
  <!-- copied from google maps, search for "hotels near denver athletic club" -->
  <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d3067.9083735405816!2d-104.99369000000003!3d39.741709000000014!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1shotels+near+denver+athletic+club!5e0!3m2!1sen!2sus!4v1416094351807"
	  class="map" frameborder="0"></iframe>
{% endblock %}
