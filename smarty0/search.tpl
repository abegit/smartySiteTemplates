{include file='general/page_top.tpl' pagename="search" title = $templateconf.titletxtsearch }

<div class="wrapper" align="center">

<!--Header-->
{include file="$spath/general/header.tpl"}
<div class="container content">

<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl" item=$nav}</div>


{if isset($root.page.results.result)}


<div style="width:100%;float:right;">
		<!--Title Bar-->
<div class="title_bar">{$templateconf.txtadvancedsearch}</div>
<!--Search Form-->
{include file="search/advancedsearch_box.tpl"}
</div>




<!--Title-->
<div class="title_bar">{$templateconf.txtsearchresultsfor}

{if $root.page.info.query[0] != ""}
  "{$root.page.info.query[0]}"
{elseif $root.page.searchparam.all != ""}
  "{$root.page.searchparam.all}"
{elseif $root.page.searchparam.any != ""}
  "{$root.page.searchparam.any}"
{elseif $root.page.searchparam.phrase != ""}
  "{$root.page.searchparam.phrase}"
{elseif $root.page.sitechoose.site_attr|@count > 0}
 {assign var="scnt" value="0"}
 {strip}
 {foreach from=$root.page.sitechoose.site_attr item=sitea}
  {foreach from=$root.page.sites.site item=siteb}
   {if $siteb.Id[0] == $sitea.id}
	{$siteb.Name[0]}
    {assign var="scnt" value=$scnt+1}
	{if $scnt != $root.page.sitechoose.site_attr|@count}, {/if}
   {/if}
  {/foreach}
 {/foreach}
 {/strip}
{elseif $root.page.catchoose.cat_attr|@count > 0}
 {assign var="scnt" value="0"}
 {strip}
 {foreach from=$root.page.catchoose.cat_attr item=cata}
  {foreach from=$tags item=tag}
   {if $tag.Id[0] == $cata.id}
	{$tag.Title[0]}
    {assign var="scnt" value=$scnt+1}
	{if $scnt != $root.page.catchoose.cat_attr|@count}, {/if}
   {/if}
  {/foreach}

  {foreach from=$areas item=tag}
   {if $tag.Id[0] == $cata.id}
	{$tag.Title[0]}
    {assign var="scnt" value=$scnt+1}
	{if $scnt != $root.page.catchoose.cat_attr|@count}, {/if}
   {/if}
  {/foreach}

 {/foreach}
 {/strip}
{/if}



{if isset($root.page.info.query[0]) && $root.page.info.query[0]!='' && sizeof($root.page.catchoose.cat_attr)}
	&nbsp;{$templateconf.txtin}

	{assign var="comma" value=0}
	
	
	{if sizeof($root.page.catchoose.cat_attr)}
	{foreach from=$root.page.catchoose.cat_attr item="cat" key="catKey"}
	{assign var="catc" value=$root.page.catchoose.cat_attr[$catKey].id}
		{foreach from=$tags item="tag"}
			{if $tag.Id[0] == $catc}
				{assign var="comma" value=$comma+1}
			{/if}
		{/foreach}
	{/foreach}
	{/if}
	
	{if sizeof($root.page.catchoose.cat_attr)}
	{foreach from=$root.page.catchoose.cat_attr item="cat" key="catKey"}
	{assign var="catc" value=$root.page.catchoose.cat_attr[$catKey].id}
		{foreach from=$tags item="tag"}
			{if $tag.Id[0] == $catc}
				{assign var="comma" value=$comma-1}{$tag.Title[0]}
				{if $comma > 0},{/if}
			{/if}
		{/foreach}
	{/foreach}
	{/if}

{/if}</div>




<!--Page Navigation-->
{if count($root.page.numpages.p) > 1}
	{include file="search/pagenav.tpl"}
{/if}



{if $root.page.results.result|@count == 0}
<br />
{$templateconf.txtnosearchresults}
{/if}


<div style="width:75%;float:left;">

{foreach from=$root.page.results.result item="result"}{strip}

{** Get Video / Picture information **}
{assign var="hType" value=0}
{assign var="vType" value=0}
{foreach from=$result.PreviewXML.content.types.type_attr item="itemF" key="keyF"}
{if $itemF.type == 'highres'}{assign var="hType" value=1}{if isset($itemF.num)} {assign var="numP" value=$itemF.num}{/if}{/if}
{if $itemF.type == 'vids'}{assign var="vType" value=1}{/if}
{/foreach}

{assign var="ml" value="0"}

{** Get Movie Length **}
{foreach from=$result.PreviewXML.content.names.name_attr item="itemN"}
{if isset($itemN.movie_length)}
    {if !isset($ml)} {assign var="ml" value=0} {/if}
	{math assign="ml" equation="max(a,b)" a=$ml b=$itemN.movie_length}
{/if}
{/foreach}



{/strip}

<div align="left">
<table cellspacing="2" cellpadding="2" border="0">
<tr>
<td align="left" valign="top">

	<!--Thumbnail-->
{if isset($hType) && isset($vType) && $hType && $vType}
<a  class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$result.Id[0] seoname=$result.SEOname[0] item=$result}" >{include file="$spath/general/stdimage.tpl" item=$result usepriority="10" alt="" class="thumbs"}</a>
{elseif isset($hType) && $hType }<a  class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="highres" id=$result.Id[0] seoname=$result.SEOname[0] item=$result}">{include file="$spath/general/stdimage.tpl" item=$result usepriority="10" alt="" class="thumbs"}</a>
{elseif isset($vType) && $vType }<a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$result.Id[0] seoname=$result.SEOname[0] item=$result}">{include file="$spath/general/stdimage.tpl" item=$result usepriority="10" alt="" class="thumbs"}</a>
{else}<a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type=$item.PreviewXML.content.types.type_attr[0].type id=$result.Id[0] seoname=$result.SEOname[0] item=$result}">{include file="$spath/general/stdimage.tpl" item=$result usepriority="10" alt="" class="thumbs"}</a>
{/if}

</td>
<td valign="top">


<!--Site Name-->
{include file="$spath/general/sitelink.tpl" item=$result}

<br />

<!--Title-->
{if isset($hType) && isset($vType) && $hType && $vType}
<a  class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$result.Id[0] seoname=$result.SEOname[0] item=$result}" >{$result.Title[0]}</a>
{elseif isset($hType) && $hType }<a  class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="highres" id=$result.Id[0] seoname=$result.SEOname[0] item=$result}" >{$result.Title[0]}</a>
{elseif isset($vType) && $vType }<a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$result.Id[0] seoname=$result.SEOname[0] item=$result}" >{$result.Title[0]}</a>
{else}<a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type=$item.PreviewXML.content.types.type_attr[0].type id=$result.Id[0] seoname=$result.SEOname[0] item=$result}" >{$result.Title[0]}</a>
{/if}

<br />


<!--Photo Count/Movie Length-->
<span class="update_info">
{if isset($hType) && isset($vType) && $hType && $vType }
{$numP}&nbsp;{$templateconf.txtphotos}

{include file="$spath/general/display_movielength.tpl" length=$ml}{$templateconf.txtofvideo}

{elseif isset($hType) && $hType}
{$numP}&nbsp;{$templateconf.txtphotos}
{elseif isset($ml)}
{include file="$spath/general/display_movielength.tpl" length=$ml}{$templateconf.txtofvideo}
{/if}
</span>

<br />




<table cellspacing="0" cellpadding="0">
<tr><td>
<!--Date-->
<span class="date">{$templateconf.txtadded} {$result.DateDisplay[0]}</span>
</td>
{strip}
<td>
{** Rating **}

{if sizeof($result.plg_ratings_rank[0]) && sizeof($result.plg_ratings_total[0]) }
  {if ($result.plg_ratings_total[0])==0 }
    {assign var="el2" value=10}
  {else} 
     {assign var="el2" value=$result.plg_ratings_total[0]}
  {/if}

  {math equation ="((el1/el2)*10)" el1=$result.plg_ratings_rank[0] el2=$el2 assign=rating}
{else}
  {assign var="rating" value=10}
{/if}

{include file="$spath/general/votefrm_model.tpl" rating=$rating hover=0 }
</td>
{/strip}
</tr>
</table>



<!--Description-->
<span class="search_decription">{$result.Description[0]}</span>

<br />
<br />

{if $result.PreviewXML.sets.set|@count}
<span class="subtitle">{$templateconf.txtfeaturedmodels}</span>
{foreach from=$result.PreviewXML.sets.set item="set" name="setLoop"}
{strip}
  <a class="model_category_link" href="{include file="$spath/general/pg_sets.tpl" id=$set.Id[0] seoname=$set.SEOname[0] item=$set}">{$set.ModelName[0]}</a>
  {if !$smarty.foreach.setLoop.last},{/if}	
{/strip}
{/foreach}
<br />
{/if}


{assign var="count" value=0}
{foreach from=$result.PreviewXML.category.item_attr item="catItem"}
{foreach from=$root.page.categories.cat item="cat1"}
{if $cat1.Title[0] == 'Tags'}
{foreach from=$cat1.cats.cat item="cat2"}
	{if $cat2.Id[0] == $catItem.category}
		{assign var="count" value=$count+1}
	{/if}
{/foreach}
{/if}
{/foreach}
{/foreach}

{if $count > 0}
<span class="subtitle">{$templateconf.txtcategories}</span> 

{foreach from=$result.PreviewXML.category.item_attr item="catItem"}
{foreach from=$root.page.categories.cat item="cat1"}
{if $cat1.Title[0] == 'Tags'}
{foreach from=$cat1.cats.cat item="cat2"}
{strip}
	{if $cat2.Id[0] == $catItem.category}
		{assign var="count" value=$count-1}
		<a class="model_category_link" href="{include file="$spath/general/pg_category.tpl" id=$catItem.category seoname=$catItem.seoname item=$catItem}">
		{$cat2.Title[0]}</a>

		{if $count > 0},{/if}
	{/if}
{/strip}
{/foreach}
{/if}
{/foreach}
{/foreach}
{/if}


{if $result.PreviewXML.dvds.dvd|@count}
<br />

<span class="subtitle">{$templateconf.txtdvds}:</span>
{foreach from=$result.PreviewXML.dvds.dvd item="dvd" name="setLoop"}
{strip}
  <a class="model_category_link" href="{include file="$spath/general/pg_dvds.tpl" id=$dvd.Id[0] seoname=$dvd.SEOname[0] item=$dvd}">{$dvd.ModelName[0]}</a>
  {if !$smarty.foreach.setLoop.last},{/if}	
{/strip}
{/foreach}

{/if}

</td></tr>
</table>
</div>

<hr class="search_hr" />

{/foreach}
</div>


<div class="clear"></div>


	<!--Page Navigation-->
	{if count($root.page.numpages.p) > 1}
		{include file="search/pagenav.tpl"}
	{/if}



{else}
	<div align="center">{$templateconf.txtnosearchresults}</div>
	
{/if}

</div>

</div>

<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl"}</div>
