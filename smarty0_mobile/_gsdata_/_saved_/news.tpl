{include file='general/page_top.tpl' title=$templateconf.titletxtnews}

{include file="general/topnav.tpl" item="blog"}
	
<div id="section_title">
{$templateconf.txtreadblog}
</div>






<!--*****This displays the Page Navigation table-->
{if sizeof($root.page.pages.page)>1}
	{include file="news/pagenav.tpl" }
{/if}

	<div  class="content_wrapper">

<!--Start News Item table-->

	{** Check if there is only one item and display them **}
	{if isset($root.page.content.item[0])}
	{foreach from=$root.page.content.item item="item" name="newItems"}
	
<div id="news">
<br />
	
				<a class="news-title" href="{include file="$spath/general/pg_news.tpl" id=$item.Id[0] item=$item}">{$item.Title[0]}</a>
		

	<br />{$templateconf.txtpostedon}&nbsp;
		<!--This displays the release date for the News/Blog entry-->
		{if sizeof($item.DateDisplay[0])}{$item.DateDisplay[0]}{/if}

		

<br />
<br />	
		
		<!--This displays the body content for the News/Blog entry-->
			{$item.Body[0]}
</div>
		{if $smarty.foreach.newsItems.last}
			<br /><br /><hr class="hr-news" />
		{/if}


	{/foreach}
	{/if}


</div>

<br>

<!--*****This displays the Page Navigation table-->
{if sizeof($root.page.pages.page)>1}
{include file="news/pagenav.tpl" }
{/if}


	


{include file='general/page_bottom.tpl' item="blog"}
