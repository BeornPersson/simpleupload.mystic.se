{if $logged_in}
	 <!-- Fixed navbar -->
    {include file="nav-bar.tpl" title="Profile" active_page="profile"}
    <div class="container">
      {if $no_data eq 1}
        <div class="alert alert-warning"><strong>Warning! </strong>Profile has no data</div>
      {/if}
      {if $profile_data}
        <div>
          <h1>Profile information</h1>
          <div>Your username: {$profile_data.username}</div>
          <div></div>
          <form action="" method="POST" role="form">
            <fieldset>
              <div class="form-group">
                <label for="email">Email: </label>
                 <input name="email" value="{$profile_data.email}" type="text" class="form-control" />
               </div>
               <div>Want to change your password? Type in the fields below then!</div>
                <div class="form-group">
                <label for="new_password">New password </label>
                 <input name="new_password" value="" type="password" class="form-control" />
               </div>
               <div class="form-group">
                <label for="repeat_password">Repeat password: </label>
                 <input name="repeat_password" value="" type="text" class="form-control" >
               </div>
               <div class="form-group">
                <input type="submit" class="btn btn-submit" value="Submit">
              </div>
            </fieldset>
          </form>
        </div>
      {/if}
      </div> <!-- /container -->
	</body>
</html>
{else}[]
	You are not logged in!
{/if}