{config_load file="static.tour.conf" scope="global"}
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
<HTML>
<HEAD>
{** If SEO optimized URLs are enabled, use a base href **}
{if $root.seo_urls == "1"}
{assign var="areaurl" value=#areaurl#}
{assign var="areaurl" value=$areaurl|@full_url}
{global put="areaurl" value=$areaurl}
<base href="{$areaurl}" />
{/if}
<TITLE>{$templateconf.titletxtnews}</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
<meta name="RATING" content="RTA-5042-1996-1400-1577-RTA" />
<link rel="stylesheet" type="text/css" href="style.css" />

{** Code that shows the meta keywords and description on tour pages **}
{strip}
{if sizeof($root.page.content.item) ==1 && isset($root.page.content.item[0].Id) }
	{assign var="seokey"  value=$root.page.content.item[0].SEOkey[0]}
	{assign var="seodesc" value=$root.page.content.item[0].SEOdesc[0]}
	{if $seokey}
		<meta name="keywords" content="{$seokey}" />
	{elseif $templateconf.tourdefaultmetakeywords}
		<meta name="keywords" content="{$templateconf.tourdefaultmetakeywords}" />
	{/if}
	{if $seodesc}
		<meta name="description" content="{$seodesc}" />
	{elseif $templateconf.tourdefaultmetadescription}
		<meta name="description" content="{$templateconf.tourdefaultmetadescription}" />
	{/if}
{/if}
{/strip}



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

</HEAD>

<!--Page Top and Universal Navbar-->

{include file="$tourname/page_top.tpl" pos=$key  title=$templateconf.titletxtnews}


<div class="wrapper" align="center">


<!--Header-->
{include file="$tourname/header.tpl" pos=$key}


<!--Top Navbar-->
{include file="$tourname/topnav.tpl" item="news" pos=$key}





<!--Latest News-->
{if $root.page.tag}
<div class="title_bar">{$templateconf.txtnewswith} '{$root.page.tag|@strtoupper}' {$templateconf.txttag}</div>
{else}
<div class="title_bar">{$templateconf.txtlatestnews}</div>
{/if}


<!--Page Navigation-->
{if sizeof($root.page.pages.page)>1}{include file="$spath/news/pagenav.tpl" }{/if}


<!--News-->
<div class="news">{include file="$tourname/news1.tpl" }</div>


<!--Comments-->
{if sizeof($root.page.content.item) ==1 && isset($root.page.content.item[0].Id) && count($root.page.comments.comment)}
<a name="comment"></a><div class="title_bar">{$templateconf.txtcomments|@strtoupper}</div>
 
{include file="$tourname/news_commentsui.tpl"}

{/if}	



<!--Page Navigation-->
{if sizeof($root.page.pages.page)>1}{include file="$spath/news/pagenav.tpl" }{/if}


<br />

<a class="join_links_big" href="{$root.page.tour.JoinUrl}">{$templateconf.tourtxtjoinlink}</a>

</div>

<!--Footer-->
<div class="footer">{include file="$tourname/footer.tpl"}</div>
