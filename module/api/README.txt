Folder này để chứa các API chung giao tiếp với hệ thống admin
Mô tả chi tiết:
- getCustomFrameList.php: Giúp GBFrame ở admin đọc các folder customframe để load giao diện khi thực hiện setup
- getImageLibrary.php: Giúp GBCMS ở admin đọc tất cả ảnh ở folder data/fileserver/file/upload
- uploadfolderhtml.php:
- uploadfromgbframe.php: upload các file cần thiết trong 1 template frame để load giao diện của trang được tạo bởi gbframe
- uploadimage.php: Để gọi khi user upload file từ hệ thống admin
- createSeoUrl: tạo file cache Seourl.
- deleteSeoUrl: xóa file cache Seourl.
- cronjobSendPromotionEmail : gửi Promotion Email từ outbox
- cronjobUpdateCartStatus : kiểm tra cart status...

