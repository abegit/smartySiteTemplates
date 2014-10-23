{strip}

{** Loading the static path variables from the config File **}
{if isset($root.page.trial)}{config_load file='static.conf' scope="global"}
{elseif isset($root.page.tour)}{config_load file='static.tour.conf' scope="global"}
{else}{config_load file='static.conf' scope="global"}{/if}


{** End Adding **}
{** Path to Image Directory **}
{foreach from=$root.page.languages.language item="l" key="k"}
{if $l.Id[0] == $root.page.languages_attr[$k].id && !isset($imagefolder)}
{assign var="imgfolder" value=$l.ImageFolder[0]}
{/if}
{/foreach}

{** Getting the List of categories available **} 
	{foreach from=$categories item=cat}
	{foreach from=$cat.cats.cat item=cat2 }
	{if $cat2.Title[0] =='Models' }{assign var="modelsCat" value=$cat2.Id[0]}{/if}
	{if $cat2.Title[0] == 'Photos'}{assign var="photosCat" value=$cat2.Id[0]}{/if}
	{if $cat2.Title[0] == 'Movies'}{assign var="moviesCat" value=$cat2.Id[0]}{/if}
	{/foreach}
	{/foreach}
	{** End Getting the categories available **} 


{** Here is some code to determine whether or not the this site should show other site links **}

{** Check if the current site allows the link showing **}
{assign var="showallaccesslinks" value=1}

{if $root.page.subsite.LimitToSite[0] == 1}
  {assign var="showallaccesslinks" value=0}
{/if}

{global put="showallaccesslinks" value=$showallaccesslinks}

{global put="mediatype_vids" value="vidsmobile"}
{global put="mediatype_pics" value="highres"}
{global put="mediatype_caps" value="caps"}


{** End Check **}

{/strip}<!DOCTYPE html>
<html>
<head>
{** If SEO optimized URLs are enabled, use a base href **}
{if $root.seo_urls == "1"}
{assign var="areaurl" value=#areaurl#}
{assign var="areaurl" value=$areaurl|@full_url}
{global put="areaurl" value=$areaurl}
<base href="{$areaurl}" />

{/if}
{** End SEO optimized URL test **}



<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8" />
<meta name="RATING" content="RTA-5042-1996-1400-1577-RTA" />
<title>{$title}</title>
<meta name="viewport" content="width=320px; initial-scale=1.0; maximum-scale=1.0; user-scalable=false;" />
<meta http-equiv="Cache-Control" content="no-transform" /> 

<link href="mobilestyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/tour/commons/style.css"></link>
<link rel="stylesheet" type="text/css" href="/tour/mobi.css"></link>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type='text/javascript' src="jwplayer.js"></script>
<script type="text/javascript">jwplayer.key="qLzynSodouEg2o+gukjzO+6P0dzyHYq1TqcHaUF9cJE=";</script>
<script type='text/javascript' src="js/mobileinclude.js"></script>

<script>
{literal}
try
{
	// starting the script on page load
	$(document).ready(function(){

		if (typeof jwplayer !== 'function')
		{
			alert("Warning: File jwplayer.js not found.");
		}
		
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



</head>
<body>
{if !empty($templateconf.splashtxtwarning)}
        {include file="$tourname/splash.tpl"}
{/if}

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