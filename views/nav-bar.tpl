<!DOCTYPE html>
<html>
  <head>
    <title>{$title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="styles/bootstrap.min.css" />
    {if $extra_style eq 'offcanvas'}
    <link rel="stylesheet" type="text/css" href="styles/offcanvas.css">
    {/if}
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
      body { padding-top: 70px; }
    </style>
  </head>

  <body>
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="http://simpleupload.mystic.se/main.php">Simple image management tool</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li {if $active_page eq 'profile'}class="active"{/if}><a href="http://simpleupload.mystic.se/profile.php">Profile</a></li>
            <li {if $active_page eq 'images'}class="active"{/if}><a href="http://simpleupload.mystic.se/images.php">Images</a></li>
            <li {if $active_page eq 'albums'}class="active"{/if}><a href="http://simpleupload.mystic.se/albums.php">Albums</a></li>
            <li {if $active_page eq 'about'}class="active"{/if}><a href="http://simpleupload.mystic.se/about.php">About</a></li>
            {*<li class="Albums">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li> *}
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="http://simpleupload.mystic.se/index.php?action=logout">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>