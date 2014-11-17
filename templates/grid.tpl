<html>
  <head>
    <title>Grid Images Demo</title>
    <link rel="stylesheet" type="text/css" href="/static/css/grid.css" />
    <link href='http://fonts.googleapis.com/css?family=Limelight' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
    {% block javascript %}
      <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript">
$(document).ready(function () {
    // rows/columns of images.
    var imageGrid = [
	[
	    {on: '/static/images/photos/b&w kissing.jpg',
	     off: '/static/images/photos/modified/b&w kissing sepia.jpg'},
	    {on: '/static/images/photos/b&w smiling.jpg',
	     off: '/static/images/photos/modified/b&w smiling sepia.jpg'},
	    {on: '/static/images/photos/cute and smiling in front of structure.jpg',
	     off: '/static/images/photos/modified/cute and smiling in front of structure sepia.jpg'},
	    {on: '/static/images/photos/emillie in front of blue-lit structure.jpg',
	     off: '/static/images/photos/modified/emillie in front of blue-lit structure sepia.jpg'}
	],
	[
	    {on: '/static/images/photos/emillie is dipped.jpg',
	     off: '/static/images/photos/modified/emillie is dipped sepia.jpg'},
	    {on: '/static/images/photos/emillie looks blissful.jpg',
	     off: '/static/images/photos/modified/emillie looks blissful sepia.jpg'},
	    {on: '/static/images/photos/in street kissing.jpg',
	     off: '/static/images/photos/modified/in street kissing sepia.jpg'},
	    {on: '/static/images/photos/kiss.jpg',
	     off: '/static/images/photos/modified/kiss sepia.jpg'}
	]
    ];

    // Preload all images and give background images to divs.
    $('div.grid-image').each(function(index) {
	var col = index % 4;
	var row = index > 3? 1 : 0;
        var imagePair = imageGrid[row][col];
	$(this).css('background-image', 'url("' + imagePair.off + '")');

        // Load 'off' image as well.
        $('<img />').src = imagePair.off;

	// Attach hover handlers.
	$(this).hover(
	    // hover enter
	    function() {
		var index = parseInt($(this).data('index'));
		var col = index % 4;
		var row = index > 3? 1 : 0;
		var imageObj = imageGrid[row][col];
		$(this).css('background-image', 'url("' + imageObj.on + '")');
	    },
	    // hover exit
	    function() {
		var index = parseInt($(this).data('index'));
		var col = index % 4;
		var row = index > 3? 1 : 0;
		var imageObj = imageGrid[row][col];
		$(this).css('background-image', 'url("' + imageObj.off + '")');
	    }
	);
    });
});
      </script>
    {% endblock javascript %}

  </head>
  <body>
    <div id="grid-wrap">
      <div class="grid-image row0 col0" data-index="0">
      </div>
      <div class="grid-image row0 col1" data-index="1">
      </div>
      <div class="grid-image row0 col2" data-index="2">
      </div>
      <div class="grid-image row0 col3" data-index="3">
      </div>

      <div class="grid-image row1 col0" data-index="4">
      </div>
      <div class="grid-image row1 col1" data-index="5">
      </div>
      <div class="grid-image row1 col2" data-index="6">
      </div>
      <div class="grid-image row1 col3" data-index="7">
      </div>
    </div>

    <!-- center medallion -->
    <div id="center-medallion">

      <div id="date-div">
	  <h1>6.12.2015</h1>
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
