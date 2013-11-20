<?php

/**
* Class handling profiles and their actions
*/
class profile
{
	
	public function getProfile($profile_id) {
		global $db;
		return $db->fetch("SELECT * FROM users WHERE uid=".$profile_id);
	}

}

?>