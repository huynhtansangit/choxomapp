<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <?php include("master/head.php")?>
    <link rel="stylesheet" href="https://demo.gbotweb.com/golead/golead.css">
    <script defer src="https://demo.gbotweb.com/golead/golead.js"></script>
</head>

<body>
<div class="modalLoading"><!--Loading--></div>
<!-- Header -->
<?php if($device == 'desktop') { ?>
<!-- Header Desktop and Tablet -->
<?php include("master/header.php")?>

<?php } else { ?>
<!-- Header Mobile -->
<?php include("master/header_mobile.php")?>
<?php } ?>
<!-- End Header -->

<!-- Main -->
<?php include($gbeTemplatePath)?>
<!-- End Main -->

<?php include("master/foot.php")?>
</body>

</html>
