{** Assigning the Page Title **}

{assign var="titletxt" value=$templateconf.titletxtindex}
{if $root.page.template_attr[0].value == "comingsoon"}
  {assign var="titletxt" value=$templateconf.navtxtupcomingupdates}
{elseif $root.page.template_attr[0].value == "facebook"}
  {assign var="titletxt" value=$templateconf.navtxtfacebook}
{elseif $root.page.template_attr[0].value == "twitter"}
  {assign var="titletxt" value=$templateconf.navtxttwitter}
{/if}

{include file="general/page_top.tpl" title=$titletxt}



{foreach from=$categories item=cat}
{foreach from=$cat.cats.cat item=cat2 }
{if ($cat2.Title[0] == 'Models') || ($cat2.MainLanguage_Title[0] =='Models' )}
	{assign var="modelsCat" value=$cat2.Id[0]}
	{assign var="modelsNode" value=$cat2}
{/if}
{if ($cat2.Title[0] == 'Photos') || ($cat2.MainLanguage_Title[0] =='Photos' )}
	{assign var="photosCat" value=$cat2.Id[0]}
	{assign var="photosNode" value=$cat2}
{/if}
{if ($cat2.Title[0] == 'Movies') || ($cat2.MainLanguage_Title[0] =='Movies' )}
	{assign var="moviesCat" value=$cat2.Id[0]}
	{assign var="moviesNode" value=$cat2}
{/if}
{/foreach}
{/foreach}

{assign var="nav" value="index"}
{if $root.page.template_attr[0].value == "comingsoon"}
  {assign var="nav" value="comingsoon"}
{elseif $root.page.template_attr[0].value == "facebook"}
  {assign var="nav" value="facebook"}
{elseif $root.page.template_attr[0].value == "twitter"}
  {assign var="nav" value="twitter"}
{/if}


{include file="general/topnav.tpl" item=$nav}

	<div class="content-wrapper" style="margin-top:3px">

	{if $root.page.template_attr[0].value == "comingsoon"}

		<div id="section_title">
		{$templateconf.navtxtupcomingupdates}
		</div>
	
		<div class="element_wrapper">
		{foreach from=$root.page.comingsoon.item item="item" key="k"}
			{include file="$spath/index/comingsoon.tpl" item=$item itemkey=$k cnt=$root.page.comingsoon.item|@count}
		{/foreach}
		</div>


<!-- Facebook Posts-->
	{elseif $root.page.template_attr[0].value == "facebook"}
<div id="section_title">
		{$templateconf.navtxtfacebook}
		</div>
{include file="$spath/general/facebook.tpl"}
		


<!--Twitter Posts-->
	{elseif $root.page.template_attr[0].value == "twitter"}
	<div id="section_title">
		{$templateconf.navtxttwitter}
		</div>
{include file="$spath/general/twitter.tpl"}
	
	
		
	



	{else}
	{if isset($root.page.content[0])}
		{foreach from=$root.page.content_attr item=content_attr key=kex}
	
		{if sizeof($root.page.content[$kex].item)}
		{if $content_attr[0].allsites == "1"}
		<div id="section_title">{$templateconf.txtlatestnetworkupdates}</div>

		{else}
		<div id="section_title">{$templateconf.txtlatestupdates|@strtoupper}</div>
		{/if}

		{if $root.page.content[$kex].pages.page|@count > 1}
		{include file="$spath/index/pagenav.tpl" content=$root.page.content[$kex]}
		{/if}

		
			{foreach from=$root.page.content[$kex].item item="item" key="k"}
				{include file="$spath/index/episode_index.tpl" item=$item itemkey=$k cnt=$root.page.content[$kex].item|@count}
			{/foreach}
		
		
		{if $root.page.content[$kex].pages.page|@count > 1}
		{include file="$spath/index/pagenav.tpl" content=$root.page.content[$kex]}
		{/if}

		<br />
		{/if}
	
		{/foreach}
	{else}

<div id="section_title">{$templateconf.txtlatestnetworkupdates}</div>


		{if $root.page.content.pages.page|@count > 1}
		{include file="$spath/index/pagenav.tpl" content=$root.page.content}
		{/if}

		<div class="element_wrapper">
		{foreach from=$root.page.content.item item="item" key="k"}
			{include file="$spath/index/episode_index.tpl" item=$item itemkey=$k cnt=$root.page.content.item|@count}
		{/foreach}
		</div>
		


		
		{if $root.page.content.pages.page|@count > 1}
		{include file="$spath/index/pagenav.tpl" content=$root.page.content}
		{/if}

	{/if}


	{/if}


	{if $root.page.polls.poll.questions.question|@count > 0}
		{include file="$spath/general/poll.tpl"}
	{/if}


	</div>


{include file="general/page_bottom.tpl" item=$nav}
