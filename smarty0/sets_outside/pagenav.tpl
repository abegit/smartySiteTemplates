{assign var="item" value=$root.page.models.model}

<div align="center">
{if count($root.page.pages.page) > 1 }
	<br />

{if $root.page.onpage[0] != 1}
 {assign var="ppage" value=$root.page.onpage[0]-1}
 <a class="pagenav" href="{include file="$spath/general/pg_sets.tpl" id=$item.Id[0] page=$ppage seoname=$item.SEOname[0] item=$item}">< Previous</a>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
{/if}

<span class="page_links_current">{$templateconf.txtpage}</span> 


	{foreach from=$root.page.pages.page item="page" name="pageLoop"}
	{if $page >=($root.page.onpage[0] - 10) && $page <=($root.page.onpage[0]+9)}
{if $page == $root.page.onpage[0]} <b class="big-links" style="color:#000000;">{$page}</b>
{else}
<a class="pagenav" href="{include file="$spath/general/pg_sets.tpl" id=$item.Id[0] page=$page seoname=$item.SEOname[0] item=$item}">{$page}</a>
{/if}
{if $page != $root.page.pages.page|@count}|{/if}
	{/if}
	{/foreach}

{if $root.page.onpage[0] != $root.page.pages.page|@count}
 {assign var="npage" value=$root.page.onpage[0]+1}
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="pagenav" href="{include file="$spath/general/pg_sets.tpl" id=$item.Id[0] page=$npage seoname=$item.SEOname[0] item=$item}">Next ></a>
{/if}

<p>

<span class="page_links_count">{$templateconf.txtviewingpage} {$root.page.onpage[0]} {$templateconf.txtof} {$root.page.pages.page|@count}</span>

{/if}
</div>