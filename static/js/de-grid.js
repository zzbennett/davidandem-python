$(document).ready(function () {
    // rows/columns of images.
    var imageGrid = [
        [
            {on: '/static/images/photos/kiss.jpg',
             off: '/static/images/photos/modified/kiss sepia.jpg',
             page: "photos"},
            {on: '/static/images/photos/denver.png',
             off: '/static/images/photos/modified/denver-sepia.png',
             page: "travel-information"},
            {on: '/static/images/photos/pretty-dav.png',
             off: '/static/images/photos/modified/pretty-dav-sepia.png',
             page: "wedding-day"},
            {on: '/static/images/photos/modified/b&w smiling sepia.jpg',
             off: '/static/images/photos/modified/b&w smiling sepia.jpg'}
        ],
        [
            {on: '/static/images/photos/modified/cute and smiling in front of structure sepia.jpg',
             off: '/static/images/photos/modified/cute and smiling in front of structure sepia.jpg'},
            {on: '/static/images/photos/Ampersand.png',
             off: '/static/images/photos/modified/Ampersand-sepia.png',
             page: "registry"},
            {on: '/static/images/photos/emillie is dipped.jpg',
             off: '/static/images/photos/modified/emillie is dipped sepia.jpg',
             page: "about"},
            {on: '/static/images/photos/emillie looks blissful.jpg',
             off: '/static/images/photos/modified/emillie looks blissful sepia.jpg',
             page: "RSVP"}
        ]
    ];

    // Load Handlebars template.
    var templateSource = $("#rollover-template").html();
    var template = Handlebars.compile(templateSource);

    var parentDiv = $("#grid-wrap");

    for (var row=0; row<imageGrid.length; row++) {
        for (var col=0; col<imageGrid[row].length; col++) {
            var imageObj = imageGrid[row][col];
            var capitalize = function(s) {
                return s.charAt(0).toUpperCase() + s.slice(1);
            };
            if (imageObj.page) {
                var title = imageObj.page.split("-").map(capitalize).join(" ");
            } else {
                var title = null;
            }
            var gridDiv = $(template({
                row: row,
                col: col,
                imageObj: imageObj,
                pageTitle: title
            }));
            // Hover handlers
            var titleSlideDuration = 400;
            gridDiv.siblings('.grid-on').hover(
                function() {
                    // Fade out the "on" image.
                    $(this).stop().fadeTo(200, 1.0);
                    // Get the title associated with the on image.
                    var myTitle = $(this).children(".grid-title");
                    // Get the title associated with the off image.
                    var offTitle = $(".grid-off-" + $(this).data("rollover-id"))
                        .children(".grid-title");
                    if (myTitle.hasClass("grid-title-row-0")) {
                        // If we're on the top row...
                        // Record where the original top/left coordinates were.
                        if (! myTitle.data("orig-left")) {
                            myTitle.data({
                                "orig-left": myTitle.css("left"),
                                "orig-top": myTitle.css("top")
                            });
                        }
                        // Move both on and off titles to new location.
                        myTitle.animate({left: "30px", top: "30px"}, {duration: titleSlideDuration});
                        offTitle.animate({left: "30px", top: "30px"}, {duration: titleSlideDuration});
                    } else if (myTitle.hasClass("grid-title-row-1")) {
                        // If we're on the bottom row...
                        // Record where the original bottom/right coordinates were.
                        if (! myTitle.data("orig-right")) {
                            myTitle.data({
                                "orig-right": myTitle.css("right"),
                                "orig-bottom": myTitle.css("bottom")
                            });
                        }
                        // Move both on and off title sto new location.
                        myTitle.animate({right: "30px", bottom: "30px"}, {duration: titleSlideDuration});
                        offTitle.animate({right: "30px", bottom: "30px"}, {duration: titleSlideDuration});
                    }
                },
                function() {
                    // Fade out the on image.
                    $(this).stop().fadeTo(2000, 0.0);
                    // Get the title associated with the on image.
                    var onTitle = $(this).children(".grid-title");
                    // Get the title associated with the off image.
                    var offDiv = $(".grid-off-" + $(this).data("rollover-id"));
                    // Get its title.
                    var myTitle = offDiv.children(".grid-title");
                    if (myTitle.hasClass("grid-title-row-0")) {
                        // If we're on the top row...
                        // Get the original top/left coordinates.
                        var leftDest = onTitle.data("orig-left");
                        var topDest = onTitle.data("orig-top");
                        // Move the titles back to their original location.
                        myTitle.animate({left: leftDest, top: topDest}, {duration: titleSlideDuration});
                        onTitle.animate({left: leftDest, top: topDest}, {duration: titleSlideDuration});
                    } else if (myTitle.hasClass("grid-title-row-1")) {
                        // If we're on the bottom row...
                        // Get the original bottom/right coordinates.
                        var rightDest = onTitle.data("orig-right");
                        var bottomDest = onTitle.data("orig-bottom");
                        // Move the titles back to their original position.
                        myTitle.animate({right: rightDest, bottom: bottomDest}, {duration: titleSlideDuration});
                        onTitle.animate({right: rightDest, bottom: bottomDest}, {duration: titleSlideDuration});
                    }
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

    var allModals = $(".modal");
    var closeAllModals = function() { closeModals( allModals ); };
    var openModal = function(page) {
        closeAllModals();
        // Don't open another modal if there are already some open.
        var modalsOpen = allModals.filter(
            function() { return parseFloat($(this).css("opacity")) > 0.0; }
        ).length > 0;
        if (! modalsOpen) {
            $("#" + page)
                .stop()
                .animate({opacity: 1.0}, 200)
                .css("z-index", 101);
        }
    };

    $(".modal-close").click(function() {
        closeModals( $(this).parents(".modal") );
    });

    $("body").click( closeAllModals );
    $(".modal").click(function(event) { event.stopPropagation(); });
});
