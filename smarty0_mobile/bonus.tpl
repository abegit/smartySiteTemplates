{if $root.page.bonuscat[0] == 1 }{assign var="title" value=$templateconf.navtxtbonussites}{assign var="navbar" value="bonussites"}
{elseif $root.page.bonuscat[0] == 2 }{assign var="title" value=$templateconf.navtxtvideofeeds}{assign var="navbar" value="bonusfeeds"}

{else}{assign var="title" value=$templateconf.navtxtextras}{assign var="navbar" value="extras"}
{/if}



{assign var="imagedir" value="images/"}
{include file='general/page_top.tpl' title=$title}

{include file="general/topnav.tpl" item=bonus}



	<div id="section_title">
	{if $root.page.bonuscat[0] == 1 }
		{capture name="text"}{$templateconf.navtxtbonussites}{/capture}
	{elseif $root.page.bonuscat[0] == 2 }
		{capture name="text"}{$templateconf.navtxtvideofeeds}{/capture}

{elseif $root.page.bonuscat[0] == 3 }
	{$templateconf.navtxteroticstories}

{elseif $root.page.bonuscat[0] == 4 }
	{$templateconf.navtxtaudiofiles}

{elseif $root.page.bonuscat[0] == 5 }
	{$templateconf.navtxtlivecamslink}

{elseif $root.page.bonuscat[0] == 6 }
	{$templateconf.navtxtfriends}

{elseif $root.page.bonuscat[0] == 7 && !isset($root.page.Id)}
	{$templateconf.navtxtxmlfeed}

	
		{else}{capture name="text"}{$templateconf.navtxtextras}{/capture}

	{/if}
	{$smarty.capture.text}
	</div>




	{include file="bonus/bonustable.tpl"}






{include file='general/page_bottom.tpl' item=bonus}
