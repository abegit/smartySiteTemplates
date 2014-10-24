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

<TITLE>{$templateconf.tourtxttitle}</TITLE>
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
	{assign var="seokey"  value=$root.page.models.model.SEOkey[0]}
	{assign var="seodesc" value=$root.page.models.model.SEOdesc[0]}
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

<!-- JQuery include -->
<script type="text/javascript" src="js/jquery.min.js"></script>

{include file="$spath/$tourname/social_headers.tpl" title=$templateconf.tourtxttitle seokey=$seokey seodesc=$seodesc areaurl=$areaurl}

<!--Page Top and Universal Navbar-->
{include file="$tourname/page_top.tpl" pos=$key}

<div class="wrapper" align="center">



<!--Header-->
{include file="$tourname/header.tpl" pos=$key}

<!--Top Navbar-->
{include file="$tourname/topnav.tpl" item="models" pos=$key}


<!--Model A-Z Links-->
<div align="center">{include file="$spath/general/a-zlinks.tpl" zone=1 static=0}</div>


{if $root.page.models.model|@count}


{if $cms_pro}

<!--Title-->
<div class="title_bar">{$root.page.results.modelname[0]}</div>


<table cellspacing="2" cellpadding="2" border="0">
<tr>
	<td valign="top" align="center">
	<!--Model Thumbnail-->
	{**  Going through all the models **}
	 {foreach item=i from=$root.page.models.model.PreviewXML.element.item_attr}
	 {if ($i.priority==16)}
	   {assign var="setIdmatch" value=$i.Id}
	   {assign var="pInfo" value=$i}
	 {/if}
	 {/foreach}

	{if isset($setIdmatch) }
		<img class="thumbs" 
			{if $pInfo.Width > 0}width="{$pInfo.Width}"{/if}
			{if $pInfo.Height > 0}height="{$pInfo.Height}"{/if}
			src="{#contentdir#}/contentthumbs/{$setIdmatch}-set.jpg"/>
	{else}
		<img class="thumbs" src="images/p16.jpg"/>
	{/if}



</td>
	<td align="left" valign="top">


<table cellpadding="0" cellspacing="0" border="0">
<td>
<!--Allow User Rating-->
{strip}
{if !isset($root.page.trial)}
 {assign var="hover" value=0}

 {if isset($root.page.models.model.PointsRank[0]) && $root.page.models.model.PointsRank[0]!=''} 
  {assign var="el1" value=$root.page.models.model.PointsRank[0]} 
 {else}
  {assign var="el1" value=10} 
 {/if}
 {if isset($root.page.models.model.PointsTot[0]) && $root.page.models.model.PointsTot[0]!=''} 
  {assign var="el2" value=$root.page.models.model.PointsTot[0]}
 {else} 
  {assign var="el2" value=10} 
 {/if}

 {if $el2 == 0 }
  {assign var="el1" value=0}
  {assign var="el2" value=1}
 {/if}
 {math equation="round((el1/el2)*10)" el1=$el1 el2=$el2 assign=rating}
 {include file="general/votefrm_model.tpl" rating=$rating hover=$hover}
{/if}
{/strip}
</td>



<td class="small_text">
&nbsp;
{if isset($root.page.models.model.PointsTot[0])}
{$templateconf.txtaveragerating}: 
{math assign="rtng" equation="x / y * 5 " x=$root.page.models.model.PointsRank[0] y=$root.page.models.model.PointsTot[0]}
{$rtng|@string_format:"%.1f"}
</td>
{/if}


</table>

<br />

<!--Extra Field For Bio-->
<span class="section_title">{$templateconf.txtabout} {$root.page.results.modelname[0]}:</span><br />
<span class="model_info">{$root.page.results.extrafields.bio[0]}</span>

<br />
<br />


<!--This displays the model name as defined under Plug-ins/Content Associations-->
<span class="section_title">{$templateconf.txtvitalstats}</span>

<br />

<span class="model_info">
<!--Extra Fields-->
{assign var="item" value=$root.page.results}
{$templateconf.txtage}&nbsp;{$item.extrafields.age[0]}<br />
{$templateconf.txtheight}&nbsp;{$item.extrafields.height[0]}<br />
{$templateconf.txtmeasurements}&nbsp;{$item.extrafields.measurements[0]}<br />	
{$templateconf.txtastrologicalsign}&nbsp;{$item.extrafields.sign[0]}<br />
{$templateconf.txtfunfact}&nbsp;{$item.extrafields.funfact[0]}
<span>

</td>

<td align="right">

{**
<div id="model_bio_banner">
{include file="$spath/general/showbanner.tpl" zone="model_bio"}
</div>
**}


</td>

</tr>
</table>
	

{/if}





<!--Updates Title-->
<div class="title_bar">{$templateconf.txtupdatesfeaturing}&nbsp;{$root.page.results.modelname[0]}</div>

</td>



<!--Page Navigation-->
{if count($root.page.pages.page) >1 }
	{include file="sets/pagenav.tpl"}
{/if}




<table cellpadding="2" cellspacing="1" width="100%">
{foreach from=$root.page.results.result item=item key=k}
{if $root.page.paginate || (($k) >= (($root.page.onpage[0]-1) * $root.page.numperpage[0]) && ($k) < (($root.page.onpage[0]) * $root.page.numperpage[0]))}
	
	<tr>
		<td valign="top">
		{include file="sets_outside/set_item.tpl" item=$item}
		</td>
	
	</tr>
{/if}    	
{/foreach}

</table>

<br />

<!--Page Navigation-->
{if count($root.page.pages.page) >1 }
	{include file="sets_outside/pagenav.tpl"}
{/if}


</div>


{else} {** if $root.page.models.model|@count **}

Model does not exist.

{/if} {** if $root.page.models.model|@count **}


<!--Footer-->
<div class="footer">{include file="$tourname/footer.tpl"}</div>
