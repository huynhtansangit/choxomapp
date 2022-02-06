<?php
	session_start();
	include('config.php');
?>
<!DOCTYPE HTML>
<!--
/*
 * jQuery File Upload Plugin Demo 6.9.6
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */
-->
<html lang="en">
<head>
<!-- Force latest IE rendering engine or ChromeFrame if installed -->
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<meta charset="utf-8">
<title>Elife Upload</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">
<!-- Bootstrap CSS Toolkit styles -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Bootstrap styles for responsive website layout, supporting different screen sizes -->
<link rel="stylesheet" href="css/bootstrap-responsive.min.css?v=<?php echo FILE_VERSION ?>">
<!-- Bootstrap CSS fixes for IE6 -->
<!--[if lt IE 7]><link rel="stylesheet" href="css/bootstrap-ie6.min.css?v=<?php echo FILE_VERSION ?>"><![endif]-->
<!-- Bootstrap Image Gallery styles -->
<link rel="stylesheet" href="css/bootstrap-image-gallery.min.css?v=<?php echo FILE_VERSION ?>">
<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet" href="css/jquery.fileupload-ui.css?v=<?php echo FILE_VERSION ?>">
<!-- Shim to make HTML5 elements usable in older Internet Explorer versions -->
<!--[if lt IE 9]><script src="js/html5.js?v=<?php echo FILE_VERSION ?>"></script><![endif]-->
<!-- Generic page styles -->
<link rel="stylesheet" href="css/style.css?v=<?php echo FILE_VERSION ?>">
</head>
<body>
<div id="index" class="container1">

    <!-- config cross domain -->
    <input type="hidden" id="smartupload_cross_domain" value="<?php echo CROS_DOMAIN ?>" />
    <input id="smartupload_select_files" value="" style="display: none" />
	<!-- The file upload form used as target for the file upload widget -->
    <form id="fileupload" action="<?php echo DIR_FILE ?>" method="POST" enctype="multipart/form-data">
    	<!--<input type="text" name="returnvalue" id="returnvalue" value="abcd" />-->
        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
        <div class="fileupload-buttonbar">
            <div class="span7">
                <a class="btn btn-success btn-sm" onClick="toggleuploadpanel()">
                	<i class="icon-plus icon-white"></i>
                    <span>Add new file</span>
                </a>

                <button id="smartupload-select-button" type="button" class="btn btn-primary btn-sm select pull-right"
                        style="width:150px; margin-left:10px; display: <?php echo CROS_DOMAIN ? 'block' : 'none' ?>">
                    <i class="icon-ok-sign icon-white"></i>
                    <span>Select</span>
                </button>

                <button type="button" class="btn btn-danger btn-sm delete pull-right">
                    <i class="icon-trash icon-white"></i>
                    <span>Delete</span>
                </button>
                
                <input type="checkbox" class="toggle pull-right hide">

            </div>

            <div class="uploadpanel hide">
                <!-- The fileinput-button span is used to style the file input field as button -->
                <a class="btn btn-success btn-sm fileinput-button">
                    <i class="icon-plus icon-white"></i>
                    <span>Upload new files</span>
                    <input type="file" name="files[]" multiple>
                </a>

                <button type="submit" class="btn btn-primary btn-sm start">
                    <i class="icon-upload icon-white"></i>
                    <span>Upload</span>
                </button>

                <button type="reset" class="btn btn-warning btn-sm cancel">
                    <i class="icon-ban-circle icon-white"></i>
                    <span>Cancel</span>
                </button>
            </div>

            <!-- The global progress information -->
            <!--
            <div class="span5 fileupload-progress fade hide">
                <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                    <div class="bar" style="width:0%;"></div>
                </div>
                <div class="progress-extended">&nbsp;</div>
            </div>
            -->
        </div>
        <!-- The loading indicator is shown during file processing -->
        <div class="fileupload-loading"></div>

        <!-- The table listing the files available for upload/download -->
        <div class="uploadfiles">
        <table role="presentation" class="table table-striped"><tbody class="files" data-toggle="modal-gallery" data-target="#modal-gallery"></tbody></table>
        </div>
    </form>
</div>
<!-- modal-gallery is the modal dialog used for the image gallery -->
<div id="modal-gallery" class="modal modal-gallery hide fade" data-filter=":odd" tabindex="-1">
    <div class="modal-header">
        <a class="close" data-dismiss="modal">&times;</a>
        <h3 class="modal-title"></h3>
    </div>
    <div class="modal-body"><div class="modal-image"></div></div>
    <div class="modal-footer">
        <a class="btn modal-download" target="_blank">
            <i class="icon-download"></i>
            <span>Download</span>
        </a>
        <a class="btn btn-success modal-play modal-slideshow" data-slideshow="5000">
            <i class="icon-play icon-white"></i>
            <span>Slideshow</span>
        </a>
        <a class="btn btn-info modal-prev">
            <i class="icon-arrow-left icon-white"></i>
            <span>Previous</span>
        </a>
        <a class="btn btn-primary modal-next">
            <span>Next</span>
            <i class="icon-arrow-right icon-white"></i>
        </a>
    </div>
</div>
<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
		<td class="checkselect"></td>
        <td class="preview"><span class="fade"></span></td>
        <td class="name">
            <div style="marign-bottom: 5px;">{%=file.name%}</div>
            {% if (o.files.valid && !i) { %}
            <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="bar" style="width:0%;"></div></div>
            {% } %}
        </td>
        {% if (file.error) { %}
            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
        {% } else if (o.files.valid && !i) { %}
            <td class="start" width="10%">{% if (!o.options.autoUpload) { %}
                <button class="btn btn-primary">
                    <i class="icon-upload icon-white"></i>
                    <span>Start&nbsp;</span>
                </button>
            {% } %}
            </td>
        {% } else { %}
            <td colspan="2"></td>
        {% } %}
        <td class="cancel" width="10%">{% if (!i) { %}
            <button class="btn btn-warning">
                <i class="icon-ban-circle icon-white"></i>
                <span>Cancel</span>
            </button>
        {% } %}</td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        {% if (file.error) { %}
			<td class="checkselect"></td>
            <td></td>
            <td class="name"><span>{%=file.name%}</span></td>
            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
        {% } else { %}
			<td class="checkselect"><input type="checkbox" name="delete" data-url="<?php echo !empty($folder) ? 'upload/' . $folder : 'upload' ?>/{%=file.name%}" value="1"></td>
            <td class="preview">{% if (file.thumbnail_url) { %}
                <a href="{%=file.url%}" title="{%=file.name%}" rel="gallery" download="{%=file.name%}"><img src="{%=file.thumbnail_url%}"></a>
            {% } %}</td>
            <td class="name hidden-xs">
                <a href="{%=file.url%}" title="{%=file.name%}" rel="{%=file.thumbnail_url&&'gallery'%}" download="{%=file.name%}">{%=file.name%}</a>
            </td>
        {% } %}
        <td class="delete text-right" colspan="2" width="20%">
            <button class="btn btn-danger btn-sm" data-type="{%=file.delete_type%}" data-url="{%=file.delete_url%}"  data-name="{%=file.name%}">
                <i class="icon-trash icon-white"></i>
                <!--<span>Xóa</span>-->
            </button>
        </td>
    </tr>
{% } %}
</script>
<!--<script src="js/jquery.min.js"></script>-->
<script type="text/javascript" src="js/jquery.min.js?v=<?php echo FILE_VERSION ?>"></script>

<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="js/vendor/jquery.ui.widget.js?v=<?php echo FILE_VERSION ?>"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="js/tmpl.min.js?v=<?php echo FILE_VERSION ?>"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="js/load-image.min.js?v=<?php echo FILE_VERSION ?>"></script>
<!--<script src="js/load-image.js"></script>-->
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="js/canvas-to-blob.min.js?v=<?php echo FILE_VERSION ?>"></script>
<!-- Bootstrap JS and Bootstrap Image Gallery are not required, but included for the demo -->
<script src="js/bootstrap.min.js?v=<?php echo FILE_VERSION ?>"></script>
<script src="js/bootstrap-image-gallery.min.js?v=<?php echo FILE_VERSION ?>"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="js/jquery.iframe-transport.js?v=<?php echo FILE_VERSION ?>"></script>
<!-- The basic File Upload plugin -->
<script src="js/jquery.fileupload.js?v=<?php echo FILE_VERSION ?>"></script>
<!-- The File Upload file processing plugin -->
<script src="js/jquery.fileupload-fp.js?v=<?php echo FILE_VERSION ?>"></script>
<!-- The File Upload user interface plugin -->
<script src="js/jquery.fileupload-ui.js?v=<?php echo FILE_VERSION ?>"></script>
<!-- The main application script -->
<script src="js/main.js?v=<?php echo FILE_VERSION ?>"></script>
<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE8+ -->
<!--[if gte IE 8]><script src="js/cors/jquery.xdr-transport.js?v=<?php echo FILE_VERSION ?>"></script><![endif]-->
</body> 
</html>