<?php
//cho phép tạo folder theo ý muốn (căn cứ vào đường link url)
//ví dụ: http://localhost/masterfile/filemng/upload/?folder=addon/adbanner/W5bcd55e27baa0&token=38be5418a8e2601443030c8cba989324
//hệ thống sẽ tự động tạo thư mục addon/adbanner/W5bcd55e27baa trong upload
define('ALLOW_CREATE_NEW_FOLDER', true);

//xóa file gốc tìm những file liên quan trong cache xóa luôn
define('ALLOW_ALSO_REMOVE_CACHE', true);