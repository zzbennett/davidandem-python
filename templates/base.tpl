<html>
  <head>
    <title>{% block title %}D & E{% endblock %}</title>
    <link rel="stylesheet" type="text/css" href="/static/css/base.css" />
    {% block stylesheets %}{% endblock %}
    <script type="text/javascript" src="/static/javascript/s3upload.js"></script>
    <script>
	function s3_upload(){
	    var status_elem = document.getElementById("status");
	    var url_elem = document.getElementById("photo_url");
	    var preview_elem = document.getElementById("preview");
	    var s3upload = new S3Upload({
		file_dom_selector: 'file',
		s3_sign_put_url: '/sign_s3',
                s3_object_name: (new Date()).valueOf() + Math.random().toString().replace(/[^a-z]+/g, ''),

                onProgress: function(percent, message) {
                     status_elem.innerHTML = 'Upload progress: ' + percent + '% ' + message;
                },
                onFinishS3Put: function(url) {
                     status_elem.innerHTML = 'Upload completed. Uploaded to: '+ url;
                     url_elem.value = url;
                     preview_elem.innerHTML = '<img src="'+url+'" crossOrigin="*" style="width:300px;" />';
                },
                onError: function(status) {
                    status_elem.innerHTML = 'Upload error: ' + status;
                }
            });
        }
    </script>
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
