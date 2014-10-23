{**
* Category inside file 
*
**}


<!--*****This displays the Page Navigation table-->
{if count($root.page.pages.page) >1 }
{include file="$spath/category/pagenav.tpl"}
{/if}


<!--Start Category Item-->

<!--This tells the page the number of items to show per row-->
{foreach from=$root.page.content.item item="item" key="k"}


		{include file="$spath/category/category_item.tpl" item=$item itemkey=$k cnt=$root.page.content.item|@count}


{/foreach}
<!--*****This displays the Page Navigation table-->
{if count($root.page.pages.page) >1 }
	{include file="$spath/category/pagenav.tpl"}
{/if}
