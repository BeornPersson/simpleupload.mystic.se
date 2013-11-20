<?php

    if(!isset($_SESSION)) {
        session_start();
    }

    // Database info
    $mysql_user = "koffan8_sil-db";
    $mysql_pass = "sildbpass";
    $mysql_server = "mydb10.surftown.se";
    $mysql_db = "koffan8_simpleupload";

    // The root of the script
    $basedir = "/hsphere/local/home/koffan80/simpleupload.mystic.se/";

    // Classes
    # Load all classes in the classes folder

    $dir = $basedir . 'classes';

    $files = scandir($dir);

    foreach ($files as $file) {
        if(strpos($file, '.class.php') !== false) {
            require_once($dir . '/' . $file);
        }
    }

        # Start smarty template engine
        require_once "classes/smarty/smarty.class.php";

        // Init smarty
        $smarty = new Smarty();
        $smarty->setTemplateDir($basedir.'views/');
        $smarty->setCacheDir($basedir.'cache/');
        $smarty->setCompileDir($basedir.'cache/compile/');
       # $smarty->assign("urlbase",$url_base);

    $db = new Mysql($mysql_user,$mysql_pass,$mysql_server,$mysql_db);


?>