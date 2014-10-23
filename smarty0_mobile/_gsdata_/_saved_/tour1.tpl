{assign var="nav" value="tour"}
{if $root.page.template[0] == "comingsoon"}
{assign var="nav" value="comingsoon"}
{/if}

{include file="$tourname/page_top.tpl" item=$root.page.current}
{include file="$tourname/topnav.tpl" item=$nav}


	<div class="content-wrapper margintop3px">


	{if $root.page.template[0] == "comingsoon"}
		<div id="section_title">{$templateconf.navtxtupcomingupdates}</div>
	{elseif $content_attr[0].allsites == "1"}
		<div id="section_title">{$templateconf.txtlatestnetworkupdates}</div>
	{else}

<div id="section_title">{$templateconf.txtlatestupdates}</div>
	{/if}



{if $root.page.template[0] == "comingsoon"}

	{if isset($root.page.futurecontent.item) && $root.page.futurecontent.item|@count > 0}
		<div class="element_wrapper">
		{foreach from=$root.page.futurecontent.item item="item" key="key"} 
		<div class="element">
			{include file="$tourname/comingsoon_item.tpl" item=$item}
		</div>
		{/foreach}
		</div>
	{else}
		<div>No future updates at this time.</div>
	{/if}


{elseif isset($root.page.current)}
	{include file="$tourname/episode.tpl" item=$root.page.current}
{else}

<!--This displays the episode table(s)--> 
	{if isset($root.page.tourcontent.item)}
	<div class="element_wrapper">
	
	{foreach from=$root.page.tourcontent.item item="item" key="key"}
		<div class="element">
			{include file="$tourname/episode_index.tpl" item=$item}
		</div>
	{/foreach}
	{/if}

	{include file="$tourname/episode_undertext.tpl" pos=$root.page.pages_attr[0].onpage}

{/if}




{if !isset($root.page.current)}
	{include file="$spath/tour1/pagenav.tpl"}
{/if}


<br>

{include file="$tourname/page_bottom.tpl" item=$nav}
