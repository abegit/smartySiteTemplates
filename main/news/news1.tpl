{global get="image_folder" assign="image_folder"}
{if isset($root.page.content.item[0])}
	{foreach from =$root.page.content.item item="item" name="newItems"}
		<!--<a name="{$item.Id[0]}" id="{$item.Id[0]}"></a>-->
		

<!--Title-->
<a class="news_title_link" href="{include file="$spath/general/pg_news.tpl" id=$item.Id[0] item=$item}">{$item.Title[0]}</a>

<span class="news_info"> 
	
<br>	
<!--Date-->
{if sizeof($item.DateDisplay[0])}{$item.DateDisplay[0]}{/if}



<!--Number of Comments-->
{if in_array('comments',$pluginsdata.plugins)}
<br>
{$item.NumComments[0]} {$templateconf.txtcomments} <a class="news_comment_link" href="{include file="$spath/general/pg_news.tpl" id=$item.Id[0] item=$item}#comment">{$templateconf.txtcomment}</a>{/if}

{if sizeof($item.Tags)}

<br />{$templateconf.txttags}
{strip}
{foreach from=$item.Tags item=tagitem key=kex}
<a class="news_tag_link" href="{include file="$spath/general/pg_news.tpl" tag=$tagitem}">{$tagitem}</a>
{if $kex != sizeof($item.Tags)-1}, {/if}
{/foreach}
{/strip}
{/if}

{if $item.CommentNew == 1 }
<img src="{$image_folder}/icons/new.gif" />
{/if}

</span>

<br /><br />

		<!--News/Blog Entry-->
<span class="news_info">


			{$item.Body[0]}



		{if $smarty.foreach.newsItems.last}
			<br /><br /><hr class="news_hr" /><br />
		{/if}
	{/foreach}
{elseif $root.page.content.item|@count}
	
{assign var="item" value=$root.page.content.item}
<a name="{$item.Id}"></a>

<!--Title-->
<a class="news_title_link" href="{include file="$spath/general/pg_news.tpl" id=$item.Id[0] item=$item}">{$item.Title[0]}</a>
		</span>
		


<span class="news_info"> - 
		
<!--Date-->
{if sizeof($item.DateDisplay[0])}{$item.DateDisplay[0]}{/if}

<!--Number of Comments-->
{if in_array('comments',$pluginsdata.plugins)}- {$templateconf.txtcomments}: {$item.NumComments[0]}{/if}
</span>

{if $item.CommentNew == 1 }
<img src="{$image_folder}/icons/new.gif" />
{/if}
		
	
		<!--News/Blog Entry-->
		{$item.Body[0]}
		{if $smarty.foreach.newsItems.last}
			<br /><br /><hr class="news_hr" /><br />
		{/if}
{else}
  No news.
{/if}
