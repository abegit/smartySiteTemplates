{strip}
{assign var="seokey"  value=$root.page.models.model.SEOkey[0]}
{assign var="seodesc" value=$root.page.models.model.SEOdesc[0]}
{assign var="usepriority" value="16"}

{/strip}{include file='general/page_top.tpl' pagename="index" title=$root.page.results.modelname[0] seokey=$seokey seodesc=$seodesc}
<div class="wrapper" align="center">

{assign var="cdir" value=#contentdir#}

<!--Header-->
{include file="$spath/general/header.tpl"}

<div class="container content">
<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl" item='models'}</div>

{include file="$spath/general/showbanner.tpl" zone="sets"}

{if $root.page.models.model|@count}

{if $cms_pro}
<!--Title-->
<div class="title_bar">Speakeasy Star Profile</div>



<div cellspacing="2" cellpadding="2" border="0" class="modelset">
<div>
	<div valign="top" align="center" class="avi">
	<!--Model Thumbnail-->

	{**  Going through all the models **}
	 {foreach item=i from=$root.page.models.model.PreviewXML.element.item_attr}
	 {if ($i.priority==$usepriority)}
	   {assign var="setIdmatch" value=$i.Id}
	   {assign var="pInfo" value=$i}
	 {/if}
	 {/foreach}

	{if isset($setIdmatch) }
		<img data-canvas-image class="thumbs" 
			{if $pInfo.Width > 0}width="{$pInfo.Width}"{/if}
			{if $pInfo.Height > 0}height="{$pInfo.Height}"{/if}
			src="{$cdir}/contentthumbs/{$setIdmatch}-set.jpg"/>
	{else}
		<img data-canvas-image class="thumbs" src="/commons/no-photo.png"/>
	{/if}
	<div cellpadding="0" cellspacing="0" border="0">
<div class="subtitle">{$templateconf.txtratethismodel}</div>
</div>
<!--Allow User Rating-->
{strip}
{if !isset($root.page.trial)}
 {if $root.page.models.model.Voted[0] == 1 }
  {assign var="hover" value=0}
 {else} 
  {assign var="hover" value=1} 
 {/if}

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
</div>



<div class="small_text">
&nbsp;
{if isset($root.page.models.model.PointsTot[0])}
{$templateconf.txtaveragerating}

: 
{math assign="rtng" equation="x / y * 5 " x=$root.page.models.model.PointsRank[0] y=$root.page.models.model.PointsTot[0]}
{$rtng|@string_format:"%.1f"}
</div>
{/if}


</div>
</div>
	<div align="left" valign="top" class="desc">






<!--Extra Field For Bio-->
<h2>{$root.page.results.modelname[0]}</h2>
<span class="section_title">{$templateconf.txtabout} Speakeasy Star:</span>
<span class="model_info">{$root.page.results.extrafields.bio[0]}</span>

<br />
<br />


<!--This displays the model name as defined under Plug-ins/Content Associations-->
<span class="section_title">{$templateconf.txtvitalstats}</span>

<br />

<span class="model_info">
<!--Extra Fields-->
{assign var="item" value=$root.page.results}

{if !isset($item.extrafields.socialmedia[0])}
{$templateconf.txtsocialmedia}&nbsp;<a href="{$item.extrafields.socialmediaurl[0]}" target="_blank">{$item.extrafields.socialmedia[0]}</a><br />
{/if}


{if isset($item.extrafields.personalsite[0].value)}
{$templateconf.txtpersonalsite}&nbsp;<a href="{$item.extrafields.personalsiteurl[0]}" target="_blank">{$item.extrafields.personalsite[0]}</a><br />
{/if}
{if isset($item.extrafields.age[0].value)}
{$templateconf.txtage}&nbsp;{$item.extrafields.age[0]}<br />
{/if}
{if isset($item.extrafields.height[0].value)}
{$templateconf.txtheight}&nbsp;{$item.extrafields.height[0]}<br />
{/if}
{if isset($item.extrafields.measurements[0].value)}
{$templateconf.txtmeasurements}&nbsp;{$item.extrafields.measurements[0]}<br />
{/if}	
{if isset($item.extrafields.sign[0].value)}
{$templateconf.txtastrologicalsign}&nbsp;{$item.extrafields.sign[0]}<br />
{/if}
{if isset($item.extrafields.funfact[0].value)}
{$templateconf.txtfunfact}&nbsp;{$item.extrafields.funfact[0]}<br />
{/if}

{if isset($item.extrafields.bloggamy1[0].value)}
{$templateconf.txtepisodebloggamy}&nbsp;<a href="{$item.extrafields.bloggamy1url[0]}" target="_blank">{$item.extrafields.bloggamy1[0]}</a><br />
{/if}

{if isset($item.extrafields.bloggamy2[0].value)}
{$templateconf.txtepisodebloggamy}&nbsp;<a href="{$item.extrafields.bloggamy2url[0]}" target="_blank">{$item.extrafields.bloggamy2[0]}</a><br />
{/if}

{if isset($item.extrafields.bloggamy3[0].value)}
{$templateconf.txtepisodebloggamy}&nbsp;<a href="{$item.extrafields.bloggamy3url[0]}" target="_blank">{$item.extrafields.bloggamy3[0]}</a><br />
{/if}

{if isset($item.extrafields.bloggamy4[0].value)}
{$templateconf.txtepisodebloggamy}&nbsp;<a href="{$item.extrafields.bloggamy4url[0]}" target="_blank">{$item.extrafields.bloggamy4[0]}</a><br />
{/if}

{if isset($item.extrafields.bloggamy5[0].value)}
{$templateconf.txtepisodebloggamy}&nbsp;<a href="{$item.extrafields.bloggamy5url[0]}" target="_blank">{$item.extrafields.bloggamy5[0]}</a><br />
{/if}

<span>

</div>

<div align="right" class="sponsor">


<div id="model_bio_banner">
{include file="$spath/general/showbanner.tpl" zone="model_bio"}
</div>


</div>

</div>
</div>
	

{/if}





<!--Updates Title-->
<div class="title_bar">{$templateconf.txtupdatesfeaturing}&nbsp;{$root.page.results.modelname[0]}</div>

</div>



<!--Page Navigation-->
{if count($root.page.pages.page) >1 }
	{include file="sets/pagenav.tpl"}
{/if}




<div cellpadding="2" cellspacing="1" width="100%">
{foreach from=$root.page.results.result item=item key=k}
{if $root.page.paginate || (($k) >= (($root.page.onpage[0]-1) * $root.page.numperpage[0]) && ($k) < (($root.page.onpage[0]) * $root.page.numperpage[0]))}
	<div>
		<div valign="top">
		{include file="sets/set_item.tpl" item=$item}
		</div>
	
	</div>
{/if}    	
{/foreach}

</div>



<!--Page Navigation-->
{if count($root.page.pages.page) >1 }
<br />
	{include file="sets/pagenav.tpl"}
{/if}


{if in_array('comments',$pluginsdata.plugins) && $pluginsdata.enabled.comments == 1}
<!--Comments-->
<div class="title_bar">{$templateconf.txtcomments}</div>

<a name="comments"></a>

{include file="$spath/sets/commentsui.tpl"}
{/if}


</div>

{else} {** if $root.page.models.model|@count **}

Model does not exist.

{/if} {** if $root.page.models.model|@count **}

</div>
<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl" item='models'}</div>