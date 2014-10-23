<div class="twitter_wrapper">

	
		<div class="column_background_twitter">
		
		{** Loop through all the Twitter accounts wanted on the front page **}
		{foreach from=$root.page.twitter item=twitter_account}
		
		<img src="images/twitterlogo.gif" border="0">
		
		{strip}
			{** Username / Description comes from Twitter's site **}
			<div id="twitter_account"><a href="http://twitter.com/{$twitter_account.info.Username}" target="_blank">{$twitter_account.info.Username}</a><br />
			{$twitter_account.info.Description}<br />
			</div>
		
		
		
		
		{foreach from=$twitter_account.tweets item=tweet} 
		<div id="tweets"> 
			{$tweet.Tweet}
		</div>
		{/foreach}
		
		
		
		
		
		
		{/strip}
		
		
		{/foreach}

	</div>