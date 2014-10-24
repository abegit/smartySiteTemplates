{** Show 4 columns on this page **}
{assign var="numcolumns" value="4"}

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



{if isset($root.page.category.Title[0]) && $root.page.category.Title[0] == 'Movies'}
	{assign var="title" value=$templateconf.titletxtmovieindex}
{elseif $root.page.category.Title == 'Photos'}
	{assign var="title" value=$templateconf.titletxtphotogalleryindex}
{elseif ($root.page.content_attr[0].contentasc == 1)}
	{assign var="title" value=$templateconf.titletxtmodelindex}
{elseif  isset($foundId) }
	{assign var="title" value="$foundId `$templateconf.titletxttagindex`"}
{else}
	{assign var="categorytitle"      value=$root.page.category.Title[0]}
	{assign var="title" value="$categorytitle Index"}
{/if}


{if ($root.page.category.Title[0]=='Movies')}
	{assign var="nav" value='movies'}	
{elseif ($root.page.content_attr[0].contentasc == 1)}
	{assign var="nav" value='models'}
{elseif ($root.page.category.Title[0] == 'Photos')}
	{assign var="nav" value='photos'}
{else}
	{assign var="nav" value='n/a'}
{/if}

{foreach from=$tags item="cat"}
	{if $cat.Id[0] == $root.page.category.Id[0] }
		{assign var="foundId" value=$cat.Title[0]}
	{/if}
{/foreach}

<TITLE>{$title}</TITLE>
{assign var="areaurl" value=#areaurl#}
{assign var="areaurl" value=$areaurl|@full_url}
{global put="areaurl" value=$areaurl}
{** If SEO optimized URLs are enabled, use a base href **}
{if $root.seo_urls == "1"}
<base href="{$areaurl}" />
{/if}

<link rel="stylesheet" type="text/css" href="style.css" />

{** Code that shows the meta keywords and description on tour pages **}
{strip}
	{assign var="seokey"  value=$root.page.category.SEOkey[0]}
	{assign var="seodesc" value=$root.page.category.SEOdesc[0]}
	{if $seokey}
	<meta name="keywords" content="{$seokey}" />
	{/if}
	{if $seodesc}
	<meta name="description" content="{$seodesc}" />
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

{if $tourname}
 {include file="$spath/$tourname/social_headers.tpl" title=$title seokey=$seokey seodesc=$seodesc areaurl=$areaurl}
{/if}


</HEAD>


<!--Page Top and Universal Navbar-->
{include file="$tourname/page_top.tpl" pos=$key}

<div class="wrapper" align="center">


<!--Header-->
{include file="$tourname/header.tpl" pos=$key}



<!--Top Navbar-->
{include file="$tourname/topnav.tpl" item="models" pos=$key}

<!--Model A-Z Links-->
<div align="center">{include file="$spath/general/a-zlinks.tpl" zone=1 static=0}</div>

<!--Title-->
{strip}
<div class="title_bar">
{if $root.page.category.Title[0] == 'Movies'}
  {$templateconf.titletxtmovieindex}
{elseif $root.page.category.Title[0] =='Models'}
  {$templateconf.titletxtmodelindex}
{elseif isset($foundId)}
  {$templateconf.txtsetswith} {$foundId} {$templateconf.txtaskeywordtag}
{else}
  {$templateconf.titletxtphotogalleryindex}
{/if}
</div>
{/strip}








<table cellspacing="2" cellpadding="0" border="0">
<tr>
<td>
<div id="sort_link"><a href="{include file="$spath/general/pg_category.tpl" id=$root.page.category.Id[0] s="d" page=1 seoname=$root.page.category.SEOname[0] item=$root.page.category}">{$templateconf.txtmostrecent}</a></div>
</td>

<td>
<div id="sort_link"><a href="{include file="$spath/general/pg_category.tpl" id=$root.page.category.Id[0] s="p" page=1 seoname=$root.page.category.SEOname[0] item=$root.page.category}">{$templateconf.txtmostpopular}</a></div>
</td>

<td>
<div id="sort_link"><a href="{include file="$spath/general/pg_category.tpl" id=$root.page.category.Id[0] s="n" page=1 seoname=$root.page.category.SEOname[0] item=$root.page.category}">{$templateconf.txtnametitle}</a></div>
</td>


</tr>
</table>

	

<!--Page Navigation-->
{if count($root.page.pages.page)>1 }{include file="category_outside/pagenav.tpl"}{/if}







<a class="join_links_big" href='{$root.page.tour.JoinUrl}'>{$templateconf.tourtxtjoinlink}</a>


<br>
<br>

<div align="center">
<table cellpadding="2" cellspacing="0">
<!--This tells the page the number of items to show per row-->

{foreach from=$root.page.content.item item="itemC" key="kex"}
{if ($kex % $numcolumns) == 0}
<tr>
	{** To adjust the number of columns, change the value of numcolumns at the top of this page **}
	{section name=columns start=0 loop=$numcolumns step=1}
		{assign var="tmpk" value=$kex+$smarty.section.columns.index}

		<td valign="top">
			{if isset($root.page.content.item[$tmpk])}
				{include file="category_outside/category_item_outside.tpl" item=$root.page.content.item[$tmpk] contentdir=#contentdir#}
			{else} 
				&nbsp;
			{/if}
		</td>

	{/section}
</tr>
{/if}
{/foreach}


</table>
</div>


<br>



<a class="join_links_big" href='{$root.page.tour.JoinUrl}'>{$templateconf.tourtxtjoinlink}</a>

<p>


<!--Page Navigation-->
{if count($root.page.pages.page)>1 }{include file="category_outside/pagenav.tpl"}{/if}


<br />





</div>

<!--Footer-->
<div class="footer">{include file="$tourname/footer.tpl"}</div>
