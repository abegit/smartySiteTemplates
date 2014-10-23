<div align="center">
{if count($root.page.pages.page) > 1 }
	<br />

{if $root.page.pages_attr[0].onpage != 1}
 {assign var="ppage" value=$root.page.pages_attr[0].onpage-1}
 <a class="big-links" href="{include file="$spath/general/pg_bonus.tpl" fc=$root.page.bonuscat[0] page=$ppage}">< {$templateconf.txtprevious}</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
{/if}

	<span class="plain_text">{$templateconf.txtseemore}</span>


	{foreach from=$root.page.pages.page item="page" name="pageLoop"}
	{if $page >=($root.page.pages_attr[0].onpage - 10) && $page <=($root.page.pages_attr[0].onpage+9)}
{if $page == $root.page.pages_attr[0].onpage} <b class="big-links" style="color:#000000;">{$page}</b>
{else}
<a class="big-links" href="{include file="$spath/general/pg_bonus.tpl" fc=$root.page.bonuscat[0] page=$page}">{$page}</a>
{/if}
{if $page != $root.page.pages.page|@count}|{/if}
	{/if}
	{/foreach}

{if $root.page.pages_attr[0].onpage != $root.page.pages.page|@count}
 {assign var="npage" value=$root.page.pages_attr[0].onpage+1}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a class="big-links" href="{include file="$spath/general/pg_bonus.tpl" fc=$root.page.bonuscat[0] page=$npage}">{$templateconf.txtnext} ></a>
{/if}

<p>

<span class="page_links_count">{$templateconf.txtviewingpage} {$root.page.pages_attr[0].onpage} {$templateconf.txtof} {$root.page.pages.page|@count}</span>

{/if}
</div>
