<?php
	require_once('../config.php');

	loginCheck::checkLogin();

	$smarty->assign('logged_in', '1');
	$smarty->display('../views/about.tpl');
?>