<?php
	require_once('../config.php');

	loginCheck::checkLogin();

	if(isset($_POST) and $_SERVER['REQUEST_METHOD'] == "POST") {
		# Handle upload of image

		# Set a maximum allowed size for the uploaded image
		define("MAX_SIZE", "20000");

		# Valid file-endings for images
		$valid_formats = array("jpg", "png", "gif", "bmp","jpeg");
		$uploadDir = "uploaded_images/";
		$real_path = "/hsphere/local/home/koffan80/simpleupload.mystic.se/uploaded_images/";

		foreach ($_FILES['images']['name'] as $name => $value) {
			$filename 	= 	stripslashes($_FILES['images']['name'][$name]);
			#$size 		=	$image['size'];
			$size = 1; # Allow any size for debug purposes

			# Get file ending and then convert to lowercase in order to
			# make things easier - and look prettier... on tuesdays.
			$ext = images::getExtension($filename);
			$ext = strtolower($ext);

			# Check if uploaded image is of a valid format
			if(in_array($ext,$valid_formats)) {
				# Check if size is within the size restriction
				if ($size < (MAX_SIZE*1024)) { 
					$image_name=time().$filename; 
					
					$newname = $real_path.$image_name; 

					# So far so good - now move the file from temp dir to where it is supposed to be
					if (move_uploaded_file($_FILES['images']['tmp_name'][$name], $newname)) {
						$time = time();

						# File has moved - insert the information into the database
						$insert_id = images::insertImage($filename, $image_name, $_SESSION['current_user']);
					#	$result = images::linkImageToUser($insert_id, $_SESSION['current_user']);


						# Let's resize image to something nicer and more usable
						# Also need to create a thumbnail for the image
						$imageHandle = new SimpleImage();
						$imageHandle->load($newname);
						$imageHandle->fitInsideArea(800,800);
						$imageHandle->save($newname);

						# Create thumbnail
						$imageHandle = new SimpleImage();
						$imageHandle->load($newname);
						$imageHandle->fitInsideArea(150,150);

						$thumbnailName = $real_path . "thumbnail_" . $image_name;
						$imageHandle->save($thumbnailName);


						echo "<img src='".$uploadDir.$image_name."' class='thumbnail'>"; 
					}
					else {
						# Error when moving file
						echo 'An error occured when attempting to move the file'; 
					}
				}
				else {
					echo 'Image too large. Limit is at 20mb'; 
				}
			}
			else {
				$message = "Filetype not allowed: " .$filename. " ending " . $ext;
			}
		}
		exit($message);
	}

	if($_GET['action'] == "" || !isset($_GET['action']) || empty($_GET['action']) || $_GET['action'] == 'listAll'){
		# Check which part of the images page we want to view, on first entry then list all images
		$images = images::getAllImages($_SESSION['current_user']);
		$smarty->assign('images', $images);
		$smarty->assign('action', 'listAll');
	}

	if($_GET['action'] == "upload") {
		$smarty->assign('action', 'upload');
	}
	
	$smarty->assign('logged_in', '1');
	$smarty->display('../views/images.tpl');
?>