{strip}
{capture name="title"}{$templateconf.txtdvdtitle}{/capture}

{if isset($root.page.results.selected)}
	{assign var="seokey"  value=$root.page.dvd[0].SEOkey[0]}
	{assign var="seodesc" value=$root.page.dvd[0].SEOdesc[0]}
{/if}
{/strip}

{include file='general/page_top.tpl' pagename="dvds" title = $smarty.capture.title seokey=$seokey seodesc=$seodesc}

{include file="general/topnav.tpl" item=dvds}


<div class="aligncenter">

{if isset($root.page.results.selected)}
{include file="$spath/dvds/dvd1.tpl"}
{else}
{include file="$spath/dvds/dvd_index.tpl"}
{/if}


</div>


{include file="general/page_bottom.tpl" item=dvds}

