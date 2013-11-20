<?php
	require_once('../config.php');

	loginCheck::checkLogin();


	if($_GET['action'] == "" || !isset($_GET['action']) || empty($_GET['action']) || $_GET['action'] == 'listAll'){
		# Check which part of the images page we want to view, on first entry then list all images
		$images = images::getallImages($_SESSION['current_user']);
		$smarty->assign('images', $images);
		$smarty->assign('action', 'listAll');
	}

	if($_GET['action'] == "upload") {
		$smarty->assign('action', 'upload');
	}
	
	$smarty->assign('logged_in', '1');
	$smarty->display('../views/images.tpl');
?>