<?php
class loginCheck {
	public static function checkLogin(){
		if(isset($_SESSION['is_logged'])){
			# User is logged in, yay keep doing stuff
			return '1';
		} else {
			# No user logged in, bad user, send back to index pls.
			header('Location: http://simpleupload.mystic.se/index.php');
			exit;
		}
	}
}
?>