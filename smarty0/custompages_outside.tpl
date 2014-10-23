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
<TITLE>{$root.page.content.item[0].Title[0]}</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
<meta name="RATING" content="RTA-5042-1996-1400-1577-RTA" />
<link rel="stylesheet" type="text/css" href="style.css" />

{** Code that shows the meta keywords and description on tour pages **}
{strip}
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




<table width="100%" cellpadding="2" cellspacing="0" border="0">
<tr>
<td valign="top" width="100%">
<!--Left Column-->

<!--Title-->
<div class="title_bar">{$root.page.content.item[0].Title[0]}</div>


{assign var="item" value=$root.page.content.item[0]}
{if isset($item)}

	<div class="custompages">
	{global get="image_folder" assign="image_folder"}
		
	
	<br>
	
	<!-- Extra Pages Entry-->
	<span class="custompages_info">
	
	
		{$item.Body[0]}
	
	
	<br>
	<br>


	<!--Number of Comments-->
	{if in_array('comments',$pluginsdata.plugins) && $item.NumComments[0]}

	
		{if $item.CommentNew[0] == 1 }
		<img src="{$image_folder}/icons/new.gif" />
		{/if}

	{/if}	
	
	
	
	<br><br /><hr class="custompages_hr" /><br>
	
	</span>
	</div>
	
	<!--Comments-->
	<div class="title_bar">{$templateconf.txtcomments|@strtoupper}</div>
	{include file="custompages/commentsui.tpl"}
{/if}


</td>
<td valign="top" class="right_col">
<!--Right Column-->

{if ($pluginsdata.enabled.contentasc == 1) && ($pluginsdata.enabled.ratings == 1) }
<!--Most Popular Girls-->
<div class="title_bar">{$templateconf.txtmostpopulargirls}</div>
{include file="$spath/general/toplist_models.tpl"}
{/if}

{if $root.page.news.item|@count > 0}
<!--News-->
<div class="title_bar">{$templateconf.txtlatestnews}</div>
{include file="$spath/general/news_small.tpl"}
{/if}


<!--Suggested Site-->
<div class="title_bar">{$templateconf.txtsuggestedsite}</div>
<div id="suggested_site_index">
{include file="$spath/general/showbanner.tpl" zone="custompages_suggested" allmodels="1" allcats="1"}
</div>



<br>

<!--Mailing List-->
<div class="title_bar">{$templateconf.txtnewsletter}</div>
{include file="$spath/general/mailinglistform.tpl" item=$root.mailinglist.item }


<br>

{if in_array('stats',$pluginsdata.plugins) && $pluginsdata.enabled.stats == 1 }
<!--Most Viewed Updates Toplist-->
<div class="title_bar">{$templateconf.txtmostviewed}</div>
{include file="$spath/general/toplist_stats.tpl"}
{/if}

{if in_array('ratings',$pluginsdata.plugins) && $pluginsdata.enabled.ratings == 1 }
<div class="title_bar">{$templateconf.txtmostpopularupdates}</div>
{include file="$spath/general/toplist_updates.tpl"}
{/if}

</td>
</tr>
</table>



</div>

<!--Footer-->
<div class="footer">{include file="$tourname/footer.tpl"}</div>
