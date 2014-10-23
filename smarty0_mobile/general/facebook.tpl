<div class="facebook_wrapper">
	
	<div class="column_background_facebook">

		{** Loop through all the Facebook accounts wanted on the front page **}
		{foreach from=$root.page.facebook item=facebook_account}
		
		<img src="images/facebooklogo.gif" border="0">
		
		{strip}
			{** Username / Description comes from Facebook's site **}
			<div id="facebook_account">
		
			{if $facebook_account.info.PageId}
			<a href="http://www.facebook.com/{$facebook_account.info.PageId}" target="_blank">{$facebook_account.info.Title}</a><br />
			{else}
			<a href="http://www.facebook.com/{$facebook_account.info.UID}" target="_blank">{$facebook_account.info.Title}</a><br />
			{/if}
		
			{$facebook_account.info.Description}<br />
			</div>
		
		{foreach from=$facebook_account.posts item=post} 
		<div id="facebook"> 
		
		  {if $post.PostText|@strlen < 200}
			{$post.PostText}
		  {else}
			{$post.PostText|@truncate:200}...
		  {/if}
		
		  <BR><a href="http://www.facebook.com/{$post.PostId}">{$templateconf.txtreadmore}</a>
		</div>
		{/foreach}
		
			
		
		
		{/strip}
		
		
		{/foreach}

	</div>