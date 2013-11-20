{if $logged_in}

	 <!-- Fixed navbar -->
    {include file="nav-bar.tpl" title="Albums" active_page="albums"}
    <div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Albums</h1>
        <p>Here you will be able to see your current image-albums and edit them or create new ones. Much joy!</p>
      </div>

    </div> <!-- /container -->

	</body>
</html>
{else}
	You are not logged in!
{/if}