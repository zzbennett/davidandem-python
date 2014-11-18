<html>
  <head>
    <title>Grid Images Demo</title>
    <link rel="stylesheet" type="text/css" href="/static/css/grid.css" />
    <link href='http://fonts.googleapis.com/css?family=Limelight' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
    {% block javascript %}
      <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/2.0.0/handlebars.min.js"></script>
{% raw %}
      <script type="text/x-handlebars-template" id="rollover-template">
	<div class="grid-image grid-off grid-off-{{ row }}-{{ col }} row{{ row }} col{{ col }}"
	     data-rollover-id="{{ row }}-{{ col }}"
	     style="background-image: url('{{ imageObj.off }}');">
	</div>
	<div class="grid-image grid-on grid-on-{{ row }}-{{ col }} row{{ row }} col{{ col }}"
	     data-rollover-id="{{ row }}-{{ col }}"
	     style="background-image: url('{{ imageObj.on }}'); opacity: 0.0;">
	</div>
      </script>
{% endraw %}
      <script type="text/javascript">
$(document).ready(function () {
    // rows/columns of images.
    var imageGrid = [
	[
	    {on: '/static/images/photos/b&w kissing.jpg',
	     off: '/static/images/photos/modified/b&w kissing sepia.jpg',
	     position: {x: -200, y: 0}},
	    {on: '/static/images/photos/b&w smiling.jpg',
	     off: '/static/images/photos/modified/b&w smiling sepia.jpg'},
	    {on: '/static/images/photos/cute and smiling in front of structure.jpg',
	     off: '/static/images/photos/modified/cute and smiling in front of structure sepia.jpg'},
	    {on: '/static/images/photos/emillie in front of blue-lit structure.jpg',
	     off: '/static/images/photos/modified/emillie in front of blue-lit structure sepia.jpg'}
	],
	[
	    {on: '/static/images/photos/emillie is dipped.jpg',
	     off: '/static/images/photos/modified/emillie is dipped sepia.jpg',
	     position: {x: -280, y: -100}},
	    {on: '/static/images/photos/emillie looks blissful.jpg',
	     off: '/static/images/photos/modified/emillie looks blissful sepia.jpg',
	     position: {x: -60, y: -125}},
	    {on: '/static/images/photos/in street kissing.jpg',
	     off: '/static/images/photos/modified/in street kissing sepia.jpg',
	     position: {x: 0, y: -100}},
	    {on: '/static/images/photos/kiss.jpg',
	     off: '/static/images/photos/modified/kiss sepia.jpg'}
	]
    ];

    // Load Handlebars template.
    var templateSource = $("#rollover-template").html();
    var template = Handlebars.compile(templateSource);

    var parentDiv = $("#grid-wrap");

    for (var row=0; row<imageGrid.length; row++) {
	for (var col=0; col<imageGrid[row].length; col++) {
	    var gridDiv = $(template({
		row: row,
		col: col,
		imageObj: imageGrid[row][col]
	    }));
	    // Hover handlers
	    gridDiv.siblings('.grid-on').hover(
		function() {
		    var onClass = ".grid-on-" + $(this).data("rollover-id");
		    var select = $(onClass);
		    select.stop();
		    select.fadeTo(200, 1.0);
		    console.log("hovered over!");
		},
		function() {
		    var onClass = ".grid-on-" + $(this).data("rollover-id");
		    var select = $(onClass);
		    select.stop();
		    select.fadeTo(2000, 0.0);
		    console.log("hovered out!!!");
		}
	    );
	    parentDiv.append(gridDiv);
	}
    }
});
      </script>
    {% endblock javascript %}

  </head>
  <body>
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
