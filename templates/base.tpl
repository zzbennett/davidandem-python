<html>
  <head>
    <title>{% block title %}D & E{% endblock %}</title>
    <link rel="stylesheet" type="text/css" href="/static/css/base.css" />
    <!-- webfonts -->
    <link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css' />
  </head>
  <body>
    <div id="wrap">
      <div id="left-side">
	<img src="/static/images/kiss.jpg" class="kissing-image" />
      </div>
      <div id="right-side">
	<div id="header"><h1>David and Emillie's Joyous Matrimonial Celebration</h1></div>
	<div id="menu-bar">stuff goes here</div>
	<div id="content">{% block content %}Hi!{% endblock %}</div>
      </div>
    </div>
  </body>
</html>
