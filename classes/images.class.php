<?php
	/**
	* Class handling images and its functions
	*/
	class images {
		
		public function getAllImages($user_id){
			global $db;

			$sql = "SELECT * FROM images WHERE uid=" . $user_id;

			return $db->fetch_array($sql);
		}

		public function insertImage($up_name, $filename, $user_id){
			global $db;

			$uploaded_date = date('Y-m-d H:i:s');

			$sql = sprintf("INSERT INTO `images`(`uploaded_name`, `user_set_name`, `comment`, `filename`, `uploaded_date`, `uid`) VALUES ('%s','%s','Comment','%s','%s', '%s' )",$up_name, $up_name,$filename,$uploaded_date,$user_id);	

			return $db->query($sql);
		}

		public function linkImageToUser($image_id, $user_id){
			global $db;

			$sql = "INSERT INTO users_to_images (iid, owner, uid) VALUES ('".$image_id."', '". $user_id."', '".$user_id."'')";
			return $db->query($sql);
		}

		public function getExtension($str){

			$bits = explode('.', $str);
			$ext = end($bits);

			return $ext;
		}

		public function updateImageMeta($image_id, $user_set_name, $description){
			global $db;

			$sql = "UPDATE images SET user_set_name='" . $user_set_name . "', description='" . $description . "' WHERE iid=".$image_id;

			return $db->query($sql);
		}
	}
?>