<?php
	/**
	* Class handling images and its functions
	*/
	class images {
		
		public function getAllImages($user_id) {
			global $db;

			$sql = "SELECT * FROM images WHERE uid=" . $user_id;

			return $db->fetch_array($sql);
		}

		public function uploadNewImage($user_id, $file_handle) {
			# Ajax for this instead perhaps?
		}
	}

?>