{% extends "base.tpl" %}
{% block title %}Photos{% endblock %}
{% block javascript %}
  <script type="text/javascript">
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
{% endblock %}
{% block content %}

  <label id="status" for="s3-upload">Select a Photo</label>
  <input name="s3-upload" type="file" id="file" onchange="s3_upload();"/>

  <div id="preview"><img src="/static/default.png"  /></div>

  <form method="POST" action="/photos/upload">
    <input type="hidden" id="photo_url" name="photo_url" />
    <input type="submit" value="Upload" />
  </form>

{% endblock %}
