{**
* This is the news template 
 -- no parameters are passed 
**}

{assign var="cdir" value=#contentdir#}


<!--Start News content-->
<table width="100%" cellspacing="2" cellpadding="2" border="0">
<tr>
<td align="left" class="news_body_small">
<!--The following choose and if statements tell the page to display News only if entries are present. If no entries are present, the page will choose to display a static News entry instead-->
{if (count($root.page.news)) }	
	{foreach item="item" from=$root.page.news.item }
		<p>

		<!--This displays the title of the News entry-->
		<span class="news_title">{$item.Title[0]}</span><br />
		{if $item.DateDisplay[0]!=""}
		<span class="date">
		{$templateconf.txtpostedon}&nbsp;<!--This displays the release date for the News entry-->{$item.DateDisplay[0]}</span>
		<br/>
		{/if}
		
		{if $item.thumb_attr[0].available == 1}<a href="{include file="$spath/general/pg_news.tpl" id=$item.Id[0] item=$item}" class="content-link1"><img src="{$cdir}/contentthumbs/{$item.thumb[0]}"/></a>{/if}<br />{$item.Body[0]}
		{if $item.BodyLength[0] > $item.MaxLength[0] }...{/if}<a href="{include file="$spath/general/pg_news.tpl" id=$item.Id[0] item=$item}" class="news_link">{$templateconf.txtreadmore}...</a>
		</p>
	{/foreach}	
{else}
	<!--This embeds a Template Field in case there are no news entries. A news message can be edited from within the admin panel under Plug-Ins/Template Fields-->
	{$templateconf.newsmessage}
{/if}
</td>
</tr>
</table>
<!--End News content-->