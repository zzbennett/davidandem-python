<html>
  <head>
    <title>{% block title %}D & E{% endblock %}</title>
    <link rel="stylesheet" type="text/css" href="/static/css/base.css" />
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
            <li><a href="#">Home</a></li>
            <li><a href="#">Photos</a></li>
            <li><a href="#">Registry</a></li>
            <li><a href="#">Travel Information</a></li>
            <li><a href="#">Schedule</a></li>
	  </ul>
	</div>
	<div id="content">{% block content %}Hi!{% endblock %}</div>
      </div>
    </div>
  </body>
</html>
