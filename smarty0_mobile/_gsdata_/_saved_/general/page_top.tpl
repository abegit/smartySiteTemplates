{strip}
{** Loading the static path variables from the config File **}
{if isset($root.page.trial)}{config_load file='static.trial.conf' scope="global"}
{else}{config_load file='static.conf' scope="global"}{/if}
{** End Adding **}
{** Path to Image Directory **}
{foreach from=$root.page.languages.language item="l" key="k"}
{if $l.Id[0] == $root.page.languages_attr[$k].id && !isset($imagefolder)}
{assign var="imgfolder" value=$l.ImageFolder[0]}
{/if}
{/foreach}




{** Here is some code to determine whether or not the this site should show other site links **}

{** Check if the current site allows the link showing **}
{assign var="showallaccesslinks" value=1}

{if $root.page.subsite.LimitToSite[0] == 1}
  {assign var="showallaccesslinks" value=0}
{/if}

{global put="showallaccesslinks" value=$showallaccesslinks}

{global put="mediatype_vids" value="vids"}
{global put="mediatype_pics" value="highres"}
{global put="mediatype_caps" value="caps"}


{** End Check **}
{/strip}<!DOCTYPE html>
<html>
<head>

{** If SEO optimized URLs are enabled, use a base href **}

{strip}
{** Code that overwrites the areaurl **}
{assign var="areaurl" value=#areaurl#}

{if isset($root.page.subsite)}
   {if isset($root.page.trial)}
     {assign var="areaurl" value=$root.page.subsite.TrialURL[0]}
   {else}
     {assign var="areaurl" value=$root.page.subsite.URL[0]}
   {/if}
{/if}

{assign var="areaurl" value=$areaurl|@full_url}
{global put="areaurl" value=$areaurl}

{assign var="rssurl" value=#rssurl#}
{assign var="rssurl" value=$rssurl|@full_url}


{** End Adding **}
{/strip}

{if $root.seo_urls == "1"}
<base href="{$areaurl}" />
{/if}
{** End SEO optimized URL test **}



<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8" />
<meta name="RATING" content="RTA-5042-1996-1400-1577-RTA" />
<title>{$title}</title>
<meta name="viewport" content="width=320px; initial-scale=1.0; maximum-scale=1.0; user-scalable=true;" />
<meta http-equiv="Cache-Control" content="no-transform" /> 

<link href="mobilestyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/NEWTEMPS/members/commons/style.css"></link>
<link rel="stylesheet" type="text/css" href="/NEWTEMPS/members/mobi.css"></link>





<!-- include new jplayer plugin -->
﻿<link rel="stylesheet" href="jpl/skin/circle.skin/circle.player.css">
<script type="text/javascript" src="jpl/js/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="jpl/js/jquery.transform2d.js"></script>
<script type="text/javascript" src="jpl/js/jquery.grab.js"></script>
<script type="text/javascript" src="jpl/js/mod.csstransforms.min.js"></script>
<script type="text/javascript" src="jpl/js/circle.player.js"></script>




{strip}
{** Code that overwrites the image folder if language is selected **}
{assign var="image_folder" value=#imagedir#}
{if isset($root.page.languages_attr[0].id)}
 {assign var="languageid" value=$root.page.languages_attr[0].id}
 {foreach from=$root.page.languages.language item=language}
 {if ($language.Id[0] == $languageid) && ($language.ImageFolder[0] != "")}
 {assign var="image_folder" value=$language.ImageFolder[0]}
 {/if}
 {/foreach}
{/if}
{global put="image_folder" value=$image_folder}

{** End Adding **}
{/strip}

<script type='text/javascript' src="js/jquery.min.js"></script>
<script type='text/javascript' src="js/mobileinclude.js"></script>
<script>
{literal}
try
{
	// starting the script on page load
	$(document).ready(function(){

		$(window).resize(function() {
			ResizeHeight(".element", ".info");
		});

		try { ResizeHeight(".element", ".info"); }
		catch(e) { alert(e); }
	});
}
catch(e)
{
  alert("Warning: File js/jquery.min.js not found.");
}
{/literal}
</script>

</head>
<body>

<div class="wrapper">

<div class="header"> 

{include file="general/header.tpl"}
      

{if isset($root.page.sites.site[0])}
	<form method="POST" action="siteredirect.php">

	{$templateconf.txtnetworksites}&nbsp;



	<select name="site">
		{foreach from=$root.page.sites.site item="site"}
			<option value='{$site.MobileURL[0]}' {if $root.page.sites_attr[0].id == $site.Id[0]}selected='selected'{/if}>{$site.Name[0]}</option>
		{/foreach}
	</select>

	<input type="submit" value="{$templateconf.txtgo}" />

	</form>


{/if}



</div>


	
