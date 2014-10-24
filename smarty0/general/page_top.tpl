{strip}

{** Here is some code to determine whether or not the this site should show other site links **}

{** Check if the current site allows the link showing **}
{assign var="showallaccesslinks" value=1}
{if isset($root.page.sites_attr) && isset($root.page.sites_attr[0].id) }
	{assign var="currsite" value=$root.page.sites_attr[0].id}
	{foreach from=$root.page.sites.site item="s" } 
		{if $s.Id[0] == $currsite && $s.LimitToSite[0] == 1}
			{assign var="showallaccesslinks" value=0}
		{/if}
	{/foreach}	
{/if}

{global put="showallaccesslinks" value=$showallaccesslinks}

{** End Check **}

{** Loading the static path variables from the config File **}


	{if $root.publicarea == "1"}
		{config_load file="static.publicarea.conf" scope="global"}	
	{elseif isset($root.page.trial)}
		{if (isset($root.page.trial_attr[0].type) && $root.page.trial_attr[0].type == 'promo' )}
			{config_load file="static.promo.conf" scope="global"}
		{else}
			{config_load file="static.trial.conf" scope="global"}
		{/if}
	{else}{config_load file="static.conf" scope="global"}{/if}

{** End load **}
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="RATING" content="RTA-5042-1996-1400-1577-RTA" />


{** If SEO optimized URLs are enabled, use a base href **}

{strip}
{** Code that overwrites the areaurl **}
{assign var="areaurl" value=#areaurl#}

{if isset($root.page.sites_attr[0].id)}
 {assign var="siteid" value=$root.page.sites_attr[0].id}
 {foreach from=$root.page.sites.site item=site}
 {if ($site.Id[0] == $siteid)}
   {if isset($root.page.trial)}
     {assign var="areaurl" value=$site.TrialURL[0]}
   {else}
     {assign var="areaurl" value=$site.URL[0]}
   {/if}
 {/if}
 {/foreach}
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

<title>{$title}</title>

<link rel="alternate" type="application/rss+xml" title="RSS 0.91" href="{$rssurl}" />
<!--new and improved canvas html5 slider-->
<link rel="stylesheet" type="text/css" href="/galleries/styles.css" />
<link rel="stylesheet" type="text/css" href="../main/style.css"></link>

{if $seokey}
	<meta name="keywords" content="{$seokey}" />
{elseif $templateconf.defaultmetakeywords}
	<meta name="keywords" content="{$templateconf.defaultmetakeywords}" />
{/if}

{if $seodesc}
	<meta name="description" content="{$seodesc}" />
{elseif $templateconf.defaultmetadescription}
	<meta name="description" content="{$templateconf.defaultmetadescription}" />
{/if}

{/strip}












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

{include file="$spath/general/social_headers.tpl" title=$title seokey=$seokey seodesc=$seodesc areaurl=$areaurl}



<!-- JQuery include -->
<script type="text/javascript" src="js/jquery.min.js"></script>


{** Flash Code **}
<script type='text/javascript' src='jwplayer.js'></script>
<script type="text/javascript">jwplayer.key="qLzynSodouEg2o+gukjzO+6P0dzyHYq1TqcHaUF9cJE=";</script>
{** Silverlight Code **}
<script type='text/javascript' src='silverlight.js'></script>
<script type='text/javascript' src='wmvplayer.js'></script>

{** Elevated X Code **}
<script type='text/javascript'  src ="include.js"></script>
<script type='text/javascript'  src ="js/helper.js"></script>

<!-- include new jplayer plugin -->
﻿<link rel="stylesheet" href="jpl/skin/circle.skin/circle.player.css" />
<script type="text/javascript" src="jpl/js/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="jpl/js/jquery.transform2d.js"></script>
<script type="text/javascript" src="jpl/js/jquery.grab.js"></script>
<script type="text/javascript" src="jpl/js/mod.csstransforms.min.js"></script>
<script type="text/javascript" src="jpl/js/circle.player.js"></script>


<script type="text/javascript" src="http://www.google.com/jsapi"></script>

<script type="text/javascript" src="js/gfeedfetcher.js">
/***********************************************
* gAjax RSS Feeds Displayer- (c) Dynamic Drive (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/
</script>


<!-- JQuery include -->
<!-- <script type="text/javascript" src="http://drsusanblock.tv/galleries/script.js"></script> -->


<!-- jQuery-UI -->
<script type="text/javascript" src="js/jquery-ui.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="./images/jqueryui/jquery-ui.custom.min.css" />

<style>
	{literal}
	.iosSlider, .iosSlider .slider .item  {height: 550px !important; width: 1000px !important;}
	{/literal}
</style>


<script>
{literal}
try
{

	// starting the script on page load
	var bLue = jQuery.noConflict();
	bLue(document).ready(function(){


	   ﻿var myCirclePlayer = new CirclePlayer("#jquery_jplayer_1", {
    	mp3: "http://drsusanblock.com:8000/stream",}, {
    		cssSelectorAncestor: "#cp_container_1",
			swfPath: "jpl/js",
			wmode: "window",
			supplied: "mp3",
			keyEnabled: true
		});




		if (typeof jQuery.ui == 'undefined')
		{
			// alert("Warning: File js/jquery-ui.custom.min.js not found.")
		}

		if (typeof jwplayer !== 'function')
		{
			alert("Warning: File jwplayer.js not found.");
		}

		if (typeof Silverlight !== 'object')
		{
			alert("Warning: File silverlight.js not found.");
		}

		if (typeof jeroenwijering !== 'object')
		{
			alert("Warning: File wmvplayer.js not found.");
		}
		
		if (typeof imagePreview !== 'function')
		{
			alert("Warning: File js/helper.js not found");
		}

		imagePreview();
		StdImageHandler();
	});
}
catch(e)
{
  alert("Warning: File js/jquery.min.js not found.");
}


{/literal}

</script>

<script type="text/javascript">
{literal}
function makeActivePayType(type) {
    document.getElementById('ccl').className = '';
    document.getElementById('cql').className = '';
    document.getElementById('phl').className = '';
	document.getElementById('dpl').className = '';
	document.getElementById('edl').className = '';

    // activate type    
    document.getElementById(type + 'l').className = 'active';
    document.getElementById('right-side').innerHTML=document.getElementById('right_'+type).innerHTML;
}

function makeActiveJoinType(type,num) {

    for (var i = 0; i < 4; i++) {
	var namex='pay_'+type+'_type'+ i + 'l';

        if (document.getElementById(namex)) {
            if (i == num) {
                document.getElementById(namex).className = 'active';
            } else {
                document.getElementById(namex).className = '';
            }
        }
    }
}
{/literal}
</script>


{if $templateconf.googleanalyticscode != ''}
<!-- Google Analytics code -->
{literal}
<script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', '{/literal}{$templateconf.googleanalyticscode}{literal}']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>
{/literal}
{/if}

</head>

{if !isset($onload)} {assign var="onload" value="" }{/if}
<body {$onload}>
{if !empty($templateconf.splashtxtwarning)}
	{include file="$spath/general/splash.tpl"}
{/if}
<div id="massk" style="position:fixed;display:none;">
	<div class="center">
		<div class="bouncywrap">

        <div class="dotcon dc1">
        <div class="dot"></div>
        </div>
    
        <div class="dotcon dc2">
        <div class="dot"></div>
        </div>
    
        <div class="dotcon dc3">
        <div class="dot"></div>
        </div>
 
  </div>
</div>
	</div>
<div id="universal_navbar">
{assign var="pipe" value="0"}

<table>
<tr>
<td><!-- 
{strip}
{if $root.page.sites.site|@count > 0}
{foreach from=$root.page.sites.site item=site}
 {if $site.LimitToSite[0] == "0"}
   {assign var=hubsite value=$site}
 {/if}
{/foreach}
{if isset($hubsite)}
{if isset($root.page.trial)}
<a href="{$hubsite.TrialURL[0]}">{$templateconf.navtxtnetworkhome}</a>
{else}
<a href="{$hubsite.URL[0]}">{$templateconf.navtxtnetworkhome}</a>
{/if}
{assign var="pipe" value="1"}
{/if}
{/if}


{if in_array('news',$pluginsdata.plugins) && $pluginsdata.enabled.news == 1 }
{if $pipe}<span>|</span>{/if}
<a href="{include file="$spath/general/pg_news.tpl"}" {if $item=='news' } class="hilite" {/if} >{$templateconf.navtxtblog}</a>
{assign var="pipe" value="1"}
{/if}
 -->


<a href="http://drsusanblock.com/" class="hilite">DSB.com</a>

<a href="http://bonoboville.com/members/home" class="hilite">Bonoboville.com</a>

<!-- 
{if in_array('favorites',$pluginsdata.plugins) && $pluginsdata.enabled.favorites == 1 }
{if $pipe}<span>|</span>{/if}
<a href="favorites.php" {if $item=='favorites' } class="hilite" {/if} >{$templateconf.navtxtfavorites}</a>
{assign var="pipe" value="1"}
{/if}

{if in_array('calendar',$pluginsdata.plugins) && $pluginsdata.enabled.calendar == 1  }
{if $pipe}<span>|</span>{/if}
<a href="{include file="$spath/general/pg_calendar.tpl"}" {if $item=='calendar' } class="hilite" {/if} >{$templateconf.navtxtcalendar}</a>
{assign var="pipe" value="1"}
{/if}
 -->

{if  in_array('privatemessage',$pluginsdata.plugins) && $pluginsdata.enabled.privatemessage == 1 && $root.has_username}
{if $pipe}<span>|</span>{/if}
<a href="mailbox.php" {if $root.page.privatemessage_attr[0].new == '1'}  class="newmessage" {elseif $item=='messaging'} class="hilite" {/if}  >{if $root.page.privatemessage_attr[0].new == '1'}{$templateconf.navtxtnewmessage}{else}{$templateconf.navtxtprivatemessaging}{/if}
{assign var="pipe" value="1"}
</a>
{/if}

{/strip}

</td>
<!--All Access Sites Dropdown-->
{if isset($root.page.sites.site[0])}
<td align="right">
{include file="general/sitesdd.tpl"}
</td>
{/if}

<td align="right">

<div style="display:inline;"><a class="topiconlink hilite" color="color:#cfa710;" href="/join">Become a Member!</a><div style="display:inline;"><a class="topiconlink hilite" id="searchbtn" href="#">SEARCH SPEAKEASY STARS</a><a class="topiconlink hilite" href="../members">MEMBERS AREA</a>
{if $templateconf.txtmobileurl}
<a class="topiconlink" href="{$templateconf.txtmobileurl}">{$templateconf.txtmobile|@strtoupper}</a>
{elseif $root.page_attr[0].mobileswap}
<a class="topiconlink" href="{include file="$spath/general/pg_index.tpl" mobile=1}">{$templateconf.txtmobile|@strtoupper}</a>
</div>
<td>
<div style="display:inline;">

<img src="images/icons/mobileicon.png" border="0" class="topicon">

</div>

</td>
{/if}


</tr>
</table>



</div>

<div class="body">
	<div id="advsearch" style="display:none; z-index:999;position:absolute">
	
	    <div class="login-popup" style=":100px;width:100%;background:black;">
{include file="search/advancedsearch_box.tpl"}

	    </div>		
	</div>
