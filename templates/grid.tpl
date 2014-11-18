<html>
  <head>
    <title>Grid Images Demo</title>
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
	     style="background-image: url('{{ imageObj.off }}');">
	</div>
	<div class="grid-image grid-on grid-on-{{ row }}-{{ col }} row{{ row }} col{{ col }}"
	     data-rollover-id="{{ row }}-{{ col }}"
	     {{#if imageObj.page }}data-page="{{ imageObj.page }}"{{/if}}
	     style="background-image: url('{{ imageObj.on }}'); opacity: 0.0;">
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
	  <span class="modal-title">Travel Info</span>
	  <span class="modal-close"><a href="#">&times;</a></span>
	</div>
	<div class="modal-body">
	  <p>Some awesome information involving maps.</p>
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
