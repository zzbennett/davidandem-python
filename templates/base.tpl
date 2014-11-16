<html>
  <head>
    <!-- Bootstrap stuff -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <!-------------------->

    <title>{% block title %}D & E{% endblock %}</title>
    <link rel="stylesheet" type="text/css" href="/static/css/base.css" />
    {% block stylesheets %}{% endblock %}
    <script type="text/javascript" src="/static/javascript/s3upload.js"></script>
    {% block javascript %}{% endblock %}
    <!-- webfonts -->
    <link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Vollkorn:400,700' rel='stylesheet' type='text/css' />
  </head>
  <body>
    <div id="wrap">
      <div id="left-side">
        <img src="/static/images/kiss.jpg" class="kissing-image" />
      </div>
      <div id="right-side">
        <div id="header"><h1>David and Emillie's Joyous Matrimonial Celebration</h1></div>
        <div id="menu-bar">
          <ul class="menu-items">
            <li><a href="/">Home</a></li>
            <li><a href="/photos">Photos</a></li>
            <li><a href="#">Registry</a></li>
            <li><a href="/travel-info">Travel Information</a></li>
            <li><a href="#">Schedule</a></li>
	  </ul>
	</div>
	<div id="content">{% block content %}Hi!{% endblock %}</div>
      </div>
    </div>
  </body>
</html>
