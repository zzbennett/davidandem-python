$(document).ready(function () {
    // rows/columns of images.
    var imageGrid = [
	[
	    {on: '/static/images/photos/denver.png',
	     off: '/static/images/photos/modified/denver-sepia.png',
	     position: {x: -20, y: 0},
	     page: "travel-info"},
	    {on: '/static/images/photos/b&w smiling.jpg',
	     off: '/static/images/photos/modified/b&w smiling sepia.jpg',
	     position: {x: -140, y: -85}},
	    {on: '/static/images/photos/cute and smiling in front of structure.jpg',
	     off: '/static/images/photos/modified/cute and smiling in front of structure sepia.jpg'},
	    {on: '/static/images/photos/DAC.png',
	     off: '/static/images/photos/modified/DAC-sepia.png',
	     position: {x: -175, y: -20}}
	],
	[
	    {on: '/static/images/photos/emillie is dipped.jpg',
	     off: '/static/images/photos/modified/emillie is dipped sepia.jpg',
	     position: {x: -280, y: -90}},
	    {on: '/static/images/photos/Ampersand.png',
	     off: '/static/images/photos/modified/Ampersand-sepia.png',
	     position: {x: 0, y: -100}},
	    {on: '/static/images/photos/emillie looks blissful.jpg',
	     off: '/static/images/photos/modified/emillie looks blissful sepia.jpg',
	     position: {x: -60, y: -125}},
	    {on: '/static/images/photos/kiss.jpg',
	     off: '/static/images/photos/modified/kiss sepia.jpg',
	     position: {x: -20, y: -250}}
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
		    select.stop().fadeTo(200, 1.0);
		},
		function() {
		    var onClass = ".grid-on-" + $(this).data("rollover-id");
		    var select = $(onClass);
		    select.stop().fadeTo(2000, 0.0);
		}
	    ).click(function(event) {
		var page = $(this).data("page");
		openModal(page);
		event.stopPropagation();
	    });
	    parentDiv.append(gridDiv);
	}
    }

    var closeModals = function(modals) {
	modals.stop().animate(
	    {opacity: 0.0},
	    {
		duration: 300,
		complete: function() {
		    $(this).css("z-index", 0);
		}
	    }
	);
    };
    var closeAllModals = function() { closeModals( $(".modal") ); };

    var openModal = function(page) {
	closeAllModals();
	$("#" + page)
	    .stop()
	    .animate({opacity: 1.0}, 200)
	    .css("z-index", 101);
    };

    $(".modal-close").click(function() {
	closeModals( $(this).parents(".modal") );
    });

    $("body").click( closeAllModals );
    $(".modal").click(function(event) { event.stopPropagation(); });
});
