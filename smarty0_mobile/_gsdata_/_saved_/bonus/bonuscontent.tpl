<!--This displays the Page Navigation table-->


{if $root.page.pages.page|@count > 1}
{include file="$spath/bonus/pagenav.tpl"}
{/if}

<div class="content_wrapper">

{if count($root.page.content.item)}
	{if $root.page.bonuscat[0] == 3 }
		{include file="$spath/bonus/showstory.tpl"  item=$item}
	{else}

		<div class="element_wrapper">
		{foreach from=$root.page.content.item item="item" name="elLoop" key=k}
			<div class="element" style="border:1px solid black;">
				{include file="$spath/bonus/bonus_item.tpl" item=$item}
			</div>
		{/foreach}
		</div>
	{/if}

	{if (count($root.page.content.item) mod 2) != 0 }
		<br clear="all" />
	{/if}
{else}
	<p class="aligncenter">{$templateconf.txtnobonuscontent}</p>
{/if}

</div>

{if $root.page.pages.page|@count > 1}
{include file="$spath/bonus/pagenav.tpl"}
{/if}
