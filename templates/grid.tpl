<html>
  <head>
    <title>Grid Images Demo</title>
    <link rel="stylesheet" type="text/css" href="/static/css/maps.css" />
    <link rel="stylesheet" type="text/css" href="/static/css/grid.css" />
    <link href='http://fonts.googleapis.com/css?family=Limelight' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css' />
    {% block javascript %}
      <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/2.0.0/handlebars.min.js"></script>
{% raw %}
      <script type="text/x-handlebars-template" id="rollover-template">
	<div class="grid-image grid-off grid-off-{{ row }}-{{ col }} row{{ row }} col{{ col }}"
	     data-rollover-id="{{ row }}-{{ col }}"
	     {{#if imageObj.page }}data-page="{{ imageObj.page }}"{{/if}}
	     style="background-image: url('{{ imageObj.off }}'); background-position: {{ imageObj.position.x }}px {{ imageObj.position.y }}px;">
	</div>
	<div class="grid-image grid-on grid-on-{{ row }}-{{ col }} row{{ row }} col{{ col }}"
	     data-rollover-id="{{ row }}-{{ col }}"
	     {{#if imageObj.page }}data-page="{{ imageObj.page }}"{{/if}}
	     style="background-image: url('{{ imageObj.on }}'); background-position: {{ imageObj.position.x }}px {{ imageObj.position.y }}px; opacity: 0.0;">
	</div>
      </script>
{% endraw %}
      <script type="text/javascript" src="/static/js/de-grid.js"> </script>
    {% endblock javascript %}

  </head>
  <body>
    <div id="modal-wrap">


      <!-- travel info -->
      <div id="travel-info" class="modal">
	<div class="modal-header">
	  <span class="modal-title">Travel Information</span>
	  <span class="modal-close"><a href="#">&times;</a></span>
	</div>
	<div class="modal-body">
	  <p>The wedding will be held at the Denver Athletic Club, in the heart of Denver, CO! There are ample hotels from which to choose in the area. See the map below for the location of the athletic club and surrounding accommodations.</p>
	  <h2>Map</h2>
	  <!-- copied from google maps, search for "hotels near denver athletic club" -->
	  <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d3067.9083735405816!2d-104.99369000000003!3d39.741709000000014!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1shotels+near+denver+athletic+club!5e0!3m2!1sen!2sus!4v1416094351807"
		  class="map" frameborder="0"></iframe>
	</div>
      </div>


    </div>

    <div id="grid-wrap">
    </div>

    <!-- center medallion -->
    <div id="center-medallion">

      <div id="date-div">
	  <h1>6.12.2015</h1>
	  <img src="/static/images/underline.png"></img>
      </div>

      <div id="david" class="medallian-name">
	  <h1>David</h1>
      </div>
      <div id="emillie" class="medallian-name">
	  <h1>Emillie</h1>
      </div>
    </div>
  </body>
</html>
