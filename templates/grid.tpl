<html>
  <head>
    <title>Grid Images Demo</title>
    <link rel="stylesheet" type="text/css" href="/static/css/maps.css" />
    <link rel="stylesheet" type="text/css" href="/static/css/grid.css" />
    <link href='http://fonts.googleapis.com/css?family=Limelight' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css' />
    {% block javascript %}
      <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/2.0.0/handlebars.min.js"></script>
{% raw %}
      <script type="text/x-handlebars-template" id="rollover-template">
        <div class="grid-image grid-off grid-off-{{ row }}-{{ col }} row{{ row }} col{{ col }}"
             data-rollover-id="{{ row }}-{{ col }}"
             {{#if imageObj.page }}data-page="{{ imageObj.page }}"{{/if}}
             style="background-image: url('{{ imageObj.off }}'); background-position: {{ imageObj.position.x }}px {{ imageObj.position.y }}px;">
             {{#if pageTitle }}
             <h2 class="grid-title grid-title-row-{{ row }}">{{ pageTitle }}</h2>
             {{/if}}
        </div>
        <div class="grid-image grid-on grid-on-{{ row }}-{{ col }} row{{ row }} col{{ col }}"
             data-rollover-id="{{ row }}-{{ col }}"
             {{#if imageObj.page }}data-page="{{ imageObj.page }}"{{/if}}
             style="background-image: url('{{ imageObj.on }}'); background-position: {{ imageObj.position.x }}px {{ imageObj.position.y }}px; opacity: 0.0;">
             {{#if pageTitle }}
             <h2 class="grid-title grid-title-row-{{ row }}">{{ pageTitle }}</h2>
             {{/if}}
        </div>
      </script>
{% endraw %}
      <script type="text/javascript" src="/static/js/de-grid.js"> </script>
    {% endblock javascript %}

  </head>
  <body>


    <!-- travel info -->
    <div id="travel-information" class="modal">
      <div class="modal-header">
        <span class="modal-title">Travel Information</span>
        <span class="modal-close"><a href="#">&times;</a></span>
      </div>
      <div class="modal-body">
        <p class="modal-text">The wedding will be held at the Denver Athletic Club, in the heart of Denver, CO! There are ample hotels from which to choose in the area. See the map below for the location of the athletic club and surrounding accommodations.</p>
        <h2>Map</h2>
        <!-- copied from google maps, search for "hotels near denver athletic club" -->
        <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d3067.9083735405816!2d-104.99369000000003!3d39.741709000000014!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1shotels+near+denver+athletic+club!5e0!3m2!1sen!2sus!4v1416094351807"
                class="map" frameborder="0"></iframe>
      </div>
    </div>


    <!-- photos -->
    <div id="photos" class="modal">
      <div class="modal-header">
        <span class="modal-title">Photos</span>
        <span class="modal-close"><a href="#">&times;</a></span>
      </div>
      <div class="modal-body">
        <p class="modal-text">Here are some photos of our favorite most adorable couple!</p>
        <h2>They Look Like Movie Stars</h2>
        <img src="http://shechive.files.wordpress.com/2012/02/a-kitty-cat-7.jpg" class="photo-image" />
      </div>
    </div>


    <!-- wedding day -->
    <div id="wedding-day" class="modal">
      <div class="modal-header">
        <span class="modal-title">Wedding Day</span>
        <span class="modal-close"><a href="#">&times;</a></span>
      </div>
      <div class="modal-body">
        <p class="modal-text">That's what we came here for, isn't it?</p>
        <h2>Useful Information</h2>
        <h3>Schedule of the day</h3>
        <p>Do stuff. More stuff. Drink. Eat. Dance. Talk.</p>
        <h3>Where stuff is happening</h3>
        <p>It's all over the place. Wear your walking shoes. Bring your gym pants.</p>
        <h3>What to bring</h3>
        <p>Remember that no flash photography is allowed, so as not to upset the bride and groom.</p>
      </div>
    </div>


    <!-- rsvp -->
    <div id="RSVP" class="modal">
      <div class="modal-header">
        <span class="modal-title">RSVP</span>
        <span class="modal-close"><a href="#">&times;</a></span>
      </div>
      <div class="modal-body">
        <p class="modal-text">This is going to be <em>the</em> wedding of Spring 2015, and tickets are already selling out! Get yours now!</p>
        <h2>Limit of 2 Tickets Per Customer</h2>
        <img src="http://i270.photobucket.com/albums/jj84/addiewest/gettinheldup.jpg" />
      </div>
    </div>


    <!-- rsvp -->
    <div id="registry" class="modal">
      <div class="modal-header">
        <span class="modal-title">Registry</span>
        <span class="modal-close"><a href="#">&times;</a></span>
      </div>
      <div class="modal-body">
        <p class="modal-text">You gotta pay if you wanna see the love.</p>
        <h2>Limit of 2 Tickets Per Customer</h2>
        <img src="http://dailykitten.com/wp-content/uploads/2007/03/1173796830boris-bela-3.jpg" />
      </div>
    </div>


    <!-- about -->
    <div id="about" class="modal">
      <div class="modal-header">
        <span class="modal-title">About</span>
        <span class="modal-close"><a href="#">&times;</a></span>
      </div>
      <div class="modal-body">
        <p class="modal-text">Learn some stuff about people important to the wedding.</p>
        <h2>David Bennet</h2>
        <p>David is witty, wise, and whimsical.</p>
        <img src="http://lookingtobusiness.com/wp-content/uploads/2010/01/Cat-reading-a-book.jpg" />
        <h2>Emillie Lastname</h2>
        <p>Emillie is giggly, gregarious, and good-humored.</p>
        <h2>Fido Bennett</h2>
        <p>Fido is resentful, ruthless, and ravenous.</p>
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
