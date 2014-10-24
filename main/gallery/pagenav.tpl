{**
* The Category page Navigation/Pagination 
* --no parameters are passed 
*}
<!--Start Nav -->
<div align="center">
{if count($root.page.pages.page) > 1 }
	<br />

{if $root.page.onpage[0] != 1}
 {assign var="ppage" value=$root.page.onpage[0]-1}

	<a class="pagenav"
	{if ($root.page.trial.AccessPages.page[0] == $root.page.onpage[0] - 1) || ($root.page.trial.AccessPages.page[0] == 0) || in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id) || !isset($root.page.trial)}
		href="{include file="$spath/general/pg_gallery.tpl" id=$root.page.contentgroup.Id[0] type=$root.page.settype[0] page=$ppage seoname=$root.page.contentgroup.SEOname[0] item=$root.page.contentgroup mt=$root.page.mediatype_attr[0].value}"	
	{elseif $root.page.settype[0] == 'highres'}
 	
	 href="{$root.page.trial.PhotoURL[0]}"
	{else}
		 href="{$root.page.trial.VideoURL[0]}"
	
	{/if}>

< Previous</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
{/if}

</span> <span class="page_links_current">{$templateconf.txtpage}</span> 


	{foreach from=$root.page.pages.page item="page" name="pageLoop"}
	{if $page >=($root.page.onpage[0] - 10) && $page <=($root.page.onpage[0]+9)}
{if $page == $root.page.onpage[0]} <b class="big-links" style="color:#000000;">{$page}</b>
{else}


	<a class="pagenav"
	{if ($root.page.trial.AccessPages.page[0] == $root.page.onpage[0] - 1) || ($root.page.trial.AccessPages.page[0] == 0) || in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id) || !isset($root.page.trial)}
		href="{include file="$spath/general/pg_gallery.tpl" id=$root.page.contentgroup.Id[0] type=$root.page.settype[0] page=$page seoname=$root.page.contentgroup.SEOname[0] item=$root.page.contentgroup mt=$root.page.mediatype_attr[0].value}"	
	{elseif $root.page.settype[0] == 'highres'}
 	
	 href="{$root.page.trial.PhotoURL[0]}"
	{else}
		 href="{$root.page.trial.VideoURL[0]}"
	
	{/if}>{$page}</a>

{/if}
{if $page != $root.page.pages.page|@count}|{/if}
	{/if}
	{/foreach}

{if $root.page.onpage[0] != $root.page.pages.page|@count}
 {assign var="npage" value=$root.page.onpage[0]+1}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a class="pagenav"
	{if ($root.page.trial.AccessPages.page[0] == $root.page.onpage[0] - 1) || ($root.page.trial.AccessPages.page[0] == 0) || in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id) || !isset($root.page.trial)}
		href="{include file="$spath/general/pg_gallery.tpl" id=$root.page.contentgroup.Id[0] type=$root.page.settype[0] page=$npage seoname=$root.page.contentgroup.SEOname[0] item=$root.page.contentgroup mt=$root.page.mediatype_attr[0].value}"	
	{elseif $root.page.settype[0] == 'highres'}
 	
	 href="{$root.page.trial.PhotoURL[0]}"
	{else}
		 href="{$root.page.trial.VideoURL[0]}"
	
	{/if}>

	Next ></a>
{/if}

<p>

<span class="page_links_count">{$templateconf.txtviewingpage} {$root.page.onpage[0]} {$templateconf.txtof} {$root.page.pages.page|@count}</span>

{/if}
</div>
<!--End Nav -->