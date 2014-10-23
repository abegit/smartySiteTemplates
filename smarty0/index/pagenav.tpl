<div align="center">
{if count($content.pages.page) > 1 }
	<br />

{if $root.page.onpage[0] != 1}
 {assign var="ppage" value=$root.page.onpage[0]-1}
 <a class="pagenav prv" href="{include file="$spath/general/pg_index.tpl" page=$ppage}">< {$templateconf.txtprevious}</a>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
{/if}

<span class="page_links_current">{$templateconf.txtpage}</span> 


	{foreach from=$content.pages.page item="page" name="pageLoop"}
	{if $page >=($root.page.onpage[0] - 10) && $page <=($root.page.onpage[0]+9)}
{if $page == $root.page.onpage[0]} <b class="big-links" style="color:#000000;">{$page}</b>
{else}
<a class="pagenav" href={include file="$spath/general/pg_index.tpl" page=$page}>{$page}</a>
{/if}
<!-- {if $page != $content.pages.page|@count}|{/if} -->
	{/if}
	{/foreach}

{if $root.page.onpage[0] != $content.pages.page|@count}
 {assign var="npage" value=$root.page.onpage[0]+1}
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="pagenav nxt" href="{include file="$spath/general/pg_index.tpl" page=$npage}">{$templateconf.txtnext} ></a>
{/if}

<p>

<span class="page_links_count">{$templateconf.txtviewingpage} {$root.page.onpage[0]} {$templateconf.txtof} {$content.pages.page|@count}</span>

{/if}
</div>
