
{if $root.page.bonuscat[0] == 1 }
	{include file="$spath/bonus/bonuscontent.tpl" }
{elseif $root.page.bonuscat[0] == 2 }
	{include file="$spath/bonus/bonuscontent.tpl" }

{elseif $root.page.bonuscat[0] == 3 }
	{include file="$spath/bonus/bonuscontent.tpl" }

{elseif $root.page.bonuscat[0] == 4 }
	{include file="$spath/bonus/bonuscontent.tpl" }

{elseif $root.page.bonuscat[0] == 5 }
	{include file="$spath/bonus/bonuscontent.tpl" }

{elseif $root.page.bonuscat[0] == 6 }
	{include file="$spath/bonus/bonuscontent.tpl" }

{elseif $root.page.bonuscat[0] == 7 && !isset($root.page.Id)}
	{include file="$spath/bonus/bonuscontent.tpl" }

{elseif $root.page.bonuscat[0] == 7 && isset($root.page.Id)}
	{include file="$spath/bonus/xmlfeed.tpl" }
{else}
	{include file="$spath/bonus/bonusindex.tpl" }
{/if}