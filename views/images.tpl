{if $logged_in}
	 <!-- Fixed navbar -->
    {include file="nav-bar.tpl" title="Images" active_page="images" extra_style="offcanvas"}
    <div class="container">

    
      <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
            <h1>Images</h1>
          <div class="row">
            
            {if $action eq 'listAll'}
              <div class="col-sm-6 col-md-3">
                <div class="panel panel-primary">
                  <div class="panel-heading">
                    <h3 class="panel-title">Image</h3>
                  </div>
                  <div class="panel-body">
                    <a href="#" class="thumbnail"> 
                      <img src="#" />
                    </a>
                    <p>img description</p>
                    <p><a class="btn btn-success" href="#" role="button">View details &raquo;</a></p>
                  </div>
                </div>
              </div>
            {/if}

            {if $action eq 'upload'}
              {literal}
              <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
                <script type="text/javascript" src="js/jquery.wallform.js"></script>
                <script type="text/javascript">
                $(document).ready(function() 
                { 

                $('#uploadInput').live('change', function() 
                 {
                var A=$("#imageloadstatus");
                var B=$("#imageloadbutton");

                $("#uploadForm").ajaxForm({target: '#preview', 
                  beforeSubmit:function(){
                  A.show();
                  B.hide();
                  }, 
                  success:function(){
                  A.hide();
                  B.show();
                  }, 
                  error:function(){
                  A.hide();
                  B.show();
                  } }).submit();
                });

                }); 
                </script>
                {/literal}
                <div id="preview">
                </div>
              <form id="uploadForm" action="" method="POST" role="form">
                <div class="form-group" id="imageloadbutton">
                  <label for="uploadInput">Upload new images</label>
                  <input type="file" id="uploadInput" name="images[]" multiple="true" />
                  <p class="help-block">Choose one or more images to upload.</p>
                </div>
                <div id="imageloadstatus" style="display:none">
                  <div class="progress progress-striped active">
                    <div class="progress-bar"  role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                      <span class="sr-only">Upload in progress</span>
                    </div>
                  </div>
                </div>
              </form>
            {/if}

          </div><!--/row-->
        </div><!--/span-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="list-group">
            <a href="http://simpleupload.mystic.se/images.php" class="list-group-item active">List all images</a>
            <a href="http://simpleupload.mystic.se/images.php?action=upload" class="list-group-item">Upload new image</a>
          </div>
        </div><!--/span-->
      </div><!--/row-->

    </div> <!-- /container -->

	</body>
</html>
{else}
	You are not logged in!
{/if}