{if $logged_in}

	 <!-- Fixed navbar -->
    {include file="nav-bar.tpl" title="About" active_page="about"}
    <div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="panel">
        <h1>About simple image management tool</h1>
        <p>This page is built with the aid of jQuery, bootstrap, 9lessons.info ajax upload (used mainly as inspiration)</p>
      </div>

    </div> <!-- /container -->

	</body>
</html>
{else}
	You are not logged in!
{/if}