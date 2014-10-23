{**
* This is the pagenav fro the Search page 
*
*}

<div align="center">
{if count($root.page.numpages.p) > 1 }
	<br />

{if $root.page.info.page[0] != 1}
 {assign var="ppage" value=$root.page.info.page[0]-1}
 <a class="pagenav" href="{include file="$spath/search/search_item.tpl" page=$ppage}">< Previous</a>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
{/if}

<span class="page_links_current">{$templateconf.txtpage}</span> 


	{foreach from=$root.page.numpages.p item="page" name="pageLoop"}
	{if $page >=($root.page.info.page[0] - 10) && $page <=($root.page.info.page[0]+9)}
{if $page == $root.page.info.page[0]} <b class="big-links" style="color:#000000;">{$page}</b>
{else}
<a class="pagenav" href="{include file="$spath/search/search_item.tpl" page=$page}">{$page}</a>
{/if}
{if $page != $root.page.content.pages.page|@count}|{/if}
	{/if}
	{/foreach}

{if $root.page.info.page[0] != $root.page.numpages.p|@count}
 {assign var="npage" value=$root.page.info.page[0]+1}
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="pagenav" href="{include file="$spath/search/search_item.tpl" page=$npage}">Next ></a>
{/if}

<p>

<span class="page_links_count">{$templateconf.txtviewingpage} {$root.page.info.page[0]} {$templateconf.txtof} {$root.page.numpages.p|@count}</span>


{/if}
</div>


<br />
