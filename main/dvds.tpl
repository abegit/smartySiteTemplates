{strip}
{capture name="title"}{$templateconf.txtdvdtitle}{/capture}

{if isset($root.page.results.selected)}
	{assign var="seokey"  value=$root.page.dvd[0].SEOkey[0]}
	{assign var="seodesc" value=$root.page.dvd[0].SEOdesc[0]}
{/if}
{/strip}{include file='general/page_top.tpl' pagename="dvds" title = $smarty.capture.title seokey=$seokey seodesc=$seodesc}

<div class="wrapper" align="center">

<!--Header-->
{include file="$spath/general/header.tpl"}


<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl" item='dvds'}</div>



{if isset($root.page.results.selected)}
{include file="$spath/dvds/dvd1.tpl"}
{else}
{include file="$spath/dvds/dvd_index.tpl"}
{/if}


</div>

<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl"}</div>

