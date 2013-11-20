{if $logged_in}

	 <!-- Fixed navbar -->
        {include file="nav-bar.tpl" title="Main page" active_page='main'}

    <div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Welcome</h1>
        <p>This is a simple image upload and management tool. With this you should be able to upload images and then order them into albums to enjoy or even share with others.</p>
      </div>

    </div> <!-- /container -->
	</body>
</html>
{else}
	You are not logged in!
{/if}