<?php
	require_once('../config.php');
	loginCheck::checkLogin();

	$uid = $_SESSION['current_user'];

	#Fetch profile information
	$profile_data = profile::getProfile($uid);

	if($profile_data) {
		$smarty->assign('profile_data', $profile_data);
	} else {
		$smarty->assign('no_data', '1');
	}
	
	$smarty->assign('logged_in', '1');
	$smarty->display('../views/profile.tpl');
?>