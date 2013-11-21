<?php
require_once('config.php');

if($_SERVER['REQUEST_METHOD'] == 'GET'){
	if($_GET['action'] == "logout") {
		if(isset($_SESSION['is_logged'])) {
			unset($_SESSION['is_logged']);
			unset($_SESSION['current_user']);
			unset($_SESSION['user_data']);
			$smarty->assign('errorMsg', 'You have successfully been logged out');
		}
	}
}

if (isset($_SESSION['is_logged'])) {
	header('Location: http://simpleupload.mystic.se/main.php');
	exit;
}

if($_SERVER['REQUEST_METHOD'] === 'POST') {
	if(empty($_POST['username'])){
		$smarty->assign('errorMsg','Empty username');
		$smarty->display('views/index.tpl');
	}
	else if(empty($_POST['password'])){
		$smarty->assign('errorMsg', 'Empty password');
		$smarty->display('views/index.tpl');
	}
	else {
		# username and password was not empty, start loginprocess then
		global $db;
		$username = $db->escape($_POST['username']);
		$password = $db->escape($_POST['password']);

		$hashed_pass = sha1($password);

		$sql = sprintf("SELECT * FROM users WHERE username='%s' AND password='%s'", $username, $hashed_pass );

		$result = $db->fetch($sql);

		if($result){
			# If user found then $result is true
			$_SESSION['current_user'] 	= $result['uid'];
			$_SESSION['user_data']		= $result;
			$_SESSION['is_logged']		= true;

			header('Location: http://simpleupload.mystic.se/main.php');
			exit;
		#	$smarty->assign('logged_in', '1');
		#	$smarty->display('views/main.tpl');
		} else {
			# If no user found, then $result is false
			$smarty->assign('errorMsg', 'Username or password is incorrect');
			$smarty->display('views/index.tpl');
		}
	}
} else {
	# Nothing requested - show index file
	$smarty->display('views/index.tpl');
}
?>