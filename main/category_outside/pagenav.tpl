<div align="center">
{if count($root.page.pages.page) > 1 }
	<br />

{if $root.page.pages_attr[0].onpage != 1}
 {assign var="ppage" value=$root.page.pages_attr[0].onpage-1}
 <a class="pagenav" href="{include file="$spath/general/pg_category.tpl" id=$root.page.category.Id[0] page=$ppage s=$root.page.sort[0] sw=$root.page.letter[0] seoname=$root.page.category.SEOname[0] item=$root.page.category}">< {$templateconf.txtprevious}</a>
{/if}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span> 


	{foreach from=$root.page.pages.page item="page" name="pageLoop"}
	{if $page >=($root.page.pages_attr[0].onpage - 10) && $page <=($root.page.pages_attr[0].onpage+9)}
{if $page == $root.page.pages_attr[0].onpage} <b class="big-links" >{$page}</b>
{else}
<a class="pagenav" href="{include file="$spath/general/pg_category.tpl" id=$root.page.category.Id[0] page=$page s=$root.page.sort[0] sw=$root.page.letter[0] seoname=$root.page.category.SEOname[0] item=$root.page.category}">{$page}</a>
{/if}
{if $page != $root.page.pages.page|@count}|{/if}
	{/if}
	{/foreach}

{if $root.page.pages_attr[0].onpage != $root.page.pages.page|@count}
 {assign var="npage" value=$root.page.pages_attr[0].onpage+1}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a class="pagenav" href="{include file="$spath/general/pg_category.tpl" id=$root.page.category.Id[0] page=$npage s=$root.page.sort[0] sw=$root.page.letter[0] seoname=$root.page.category.SEOname[0] item=$root.page.category}">{$templateconf.txtnext} ></a>
{/if}

<p>

<span class="page_links_count">{$templateconf.txtviewingpage} {$root.page.pages_attr[0].onpage} {$templateconf.txtof} {$root.page.pages.page|@count}</span>

{/if}
</div>
