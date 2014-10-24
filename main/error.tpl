{strip}
{assign var="title" value=$templateconf.titletxtindex}

{if isset($root.page.sites.site)}
{foreach from=$root.page.sites.site item=site}
{if $site.Id[0] == $root.page.sites_attr[0].id}
{assign var=title value=$site.Name[0]}
{/if}
{/foreach}
{/if}

{/strip}
{include file="$spath/general/page_top.tpl" pagename="index" title=$title}

<div class="wrapper" align="center">

<!--Header-->
{include file="$spath/general/header.tpl"}


<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl" item='home'}</div>


<p style="font-weight: bold" align="center">{$root.page.errormess[0]}.<br /><br />
<a class="contentnavlink" href="javascript:history.go(-1);">Click here to go back.</a></p>

{include file="$spath/general/page_bottom.tpl"}
