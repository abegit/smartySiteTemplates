{strip}
{capture name="title"}{$templateconf.txtdvdtitle}{/capture}

{if isset($root.page.results.selected)}
	{assign var="seokey"  value=$root.page.dvd[0].SEOkey[0]}
	{assign var="seodesc" value=$root.page.dvd[0].SEOdesc[0]}
{/if}
{/strip}

{include file="$tourname/page_top.tpl" pagename="dvds" title = $smarty.capture.title seokey=$seokey seodesc=$seodesc}

{include file="$tourname/topnav.tpl" item=dvds}


<div class="aligncenter">

{if isset($root.page.results.selected)}
{include file="$spath/dvds_outside/dvd1.tpl"}
{else}
{include file="$spath/dvds_outside/dvd_index.tpl"}
{/if}


</div>


{include file="$tourname/page_bottom.tpl" item=dvds}

