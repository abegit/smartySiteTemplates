{include file='general/page_top.tpl' title="Search"}

{include file="general/topnav.tpl" item=search}

{global get="mediatype_vids" assign=mediatype_vids}
{global get="mediatype_pics" assign=mediatype_pics}
{global get="mediatype_caps" assign=mediatype_caps}

{if !(isset($usepriority))} {assign var="usepriority" value=13} {/if}



{if isset($root.page.results.result)}






{** Search result Text **}


<div id="section_title">
{$templateconf.txtsearchresultsfor}

{if $root.page.info.query[0] != ""}
  "{$root.page.info.query[0]}"
{elseif $root.page.searchparam.all != ""}
  "{$root.page.searchparam.all}"
{elseif $root.page.searchparam.any != ""}
  "{$root.page.searchparam.any}"
{elseif $root.page.searchparam.phrase[0] != ""}
  "{$root.page.searchparam.phrase[0]}"
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

{if isset($root.page.info.query[0]) && $root.page.info.query[0]!='' && isset($root.page.catchoose.cat)}
	&nbsp;{$templateconf.txtin}
{/if}

{assign var="comma" value=0}
{if sizeof($root.page.catchoose.cat)}
{foreach from=$root.page.catchoose.cat item="cat" key="catKey"}
{assign var="catc" value=$root.page.catchoose.cat_attr[$catKey].id}
{foreach from=$root.page.categories.cat item="cat1"}
{foreach from=$cat1.cats.cat item="cat2" key="cat2Key"}
{if $cat1.cats.cat_attr[$cat2Key].id == $catc}
{assign var="comma" value=$comma+1}{/if}
{/foreach}
{/foreach}
{/foreach}
{/if}
{if sizeof($root.page.catchoose.cat)}
{foreach from=$root.page.catchoose.cat item="cat" key="catKey"}
{assign var="catc" value=$root.page.catchoose.cat_attr[$catKey].id}
{foreach from=$root.page.categories.cat item="cat1"}
{foreach from=$cat1.cats.cat item="cat2" key="cat2Key"}{if $cat1.cats.cat_attr[$cat2Key].id == $catc}{assign var="comma" value=$comma-1}{$cat2.Title[0]}{if $comma > 0},{/if}{/if}
{/foreach}
{/foreach}
{/foreach}
{/if}
</div>

<div>




	{assign var="comma" value=0}
	{if sizeof($root.page.catchoose.cat)}
	{foreach from=$root.page.catchoose.cat item="cat" key="catKey"}
	{assign var="catc" value=$root.page.catchoose.cat_attr[$catKey].id}
	{foreach from=$root.page.categories.cat item="cat1"}
	{foreach from=$cat1.cats.cat item="cat2" key="cat2Key"}
	{if $cat1.cats.cat_attr[$cat2Key].id == $catc}
	{assign var="comma" value=$comma+1}{/if}
	{/foreach}
	{/foreach}
	{/foreach}
	{/if}
	{if sizeof($root.page.catchoose.cat)}
	{foreach from=$root.page.catchoose.cat item="cat" key="catKey"}
	{assign var="catc" value=$root.page.catchoose.cat_attr[$catKey].id}
	{foreach from=$root.page.categories.cat item="cat1"}
	{foreach from=$cat1.cats.cat item="cat2" key="cat2Key"}{if $cat1.cats.cat_attr[$cat2Key].id == $catc}{assign var="comma" value=$comma-1}{$cat2.Title[0]}{if $comma > 0},{/if}{/if}
	{/foreach}
	{/foreach}
	{/foreach}
	{/if}


	










<!--*****This displays the Page Navigation table-->
{if count($root.page.numpages.p) > 1}
	{include file="search/pagenav.tpl"}
{/if}


<div class="element_wrapper">
{foreach from=$root.page.results.result item="result" key="k"}

{assign var="img" value=""}
{assign var="img_w" value=""}
{assign var="img_h" value=""}


{** Getting the content type attributes  **}
{foreach from=$result.PreviewXML.element.item_attr item="eitem"}

	{if $eitem.priority == $usepriority }
		{assign var="img" value=$eitem.Id}
		{assign var="img_w" value=$eitem.thumb_width}
		{assign var="img_h" value=$eitem.thumb_height}
	{/if}
{/foreach}

{** Get Video / Picture information **}
{assign var="hType" value=0}
{assign var="vType" value=0}
{foreach from=$result.PreviewXML.content.types.type_attr item="itemF" key="keyF"}
{if $itemF.type == $mediatype_pics}{assign var="hType" value=1}{if isset($itemF.num)} {assign var="numP" value=$itemF.num}{/if}{/if}
{if $itemF.type == $mediatype_vids}{assign var="vType" value=1}{/if}
{/foreach}


<div class="element">
<table class="content_wrapper">
<tr>
<td id="title_center">


<!--Title-->
{if isset($vType) && $vType}
<a class="content-links"  href="{include file="general/pg_gallery.tpl" id=$result.Id[0] type=$mediatype_vids}">{$result.Title[0]}</a>
		
{else if}					
<a class="content-links" href="{include file="general/pg_gallery.tpl" id=$result.Id[0] type=$mediatype_pics}">{$result.Title[0]}</a>
{/if}
			
	
			

	





</td>
</tr>
<tr>
<td>

<!--Thumbnail-->
{if isset($vType) && $vType}
<a class="content-links"  href="{include file="general/pg_gallery.tpl" id=$result.Id[0] type=$mediatype_vids}"><img class="thumbs" src="{#contentdir#}/contentthumbs/{$img}.jpg" alt="" width="{$img_w}" height="{$img_h}" />
</a>
		
{else}					
<a class="content-links" href="{include file="general/pg_gallery.tpl" id=$result.Id[0] type=$mediatype_pics}"><img class="thumbs" src="{#contentdir#}/contentthumbs/{$img}.jpg" alt="" width="{$img_w}" height="{$img_h}" />
</a>
{/if}


</td>
</tr>

<tr>
<td class="info">

<table>
<tr>
<td colspan="2">
<!--Site Name-->
{include file="$spath/general/sitelink.tpl" item=$result}

</td>
</tr>

<tr>
<td>
<!--Date-->
{$templateconf.txtadded} {$result.DateDisplay[0]}
</td>


<td>
<!--Rating-->

{if strlen($item.plg_ratings_rank[0]) && strlen($item.plg_ratings_total[0] ) }
	{math equation ="((el1/el2)*10)" el1=$item.plg_ratings_rank[0] el2=$item.plg_ratings_total[0] assign=rating}	
{else}
	{assign var="rating" value=0}
{/if}
{include file="$spath/general/votefrm_model.tpl" rating=$rating hover=0 }


</td>
</tr>

<tr>
<td colspan="2">






<!--Photo Count/Movie Length-->
		{assign var="h" value="no"}
		{assign var="v" value="no"}
		{assign var="c" value="no"}
		{foreach from=$result.PreviewXML.content.types.type_attr item="t"}
			{if $t.type =='highres'}
				{assign var="h" value=$t.num}
			{/if}
			{if $t.type =='vids'}
				{assign var="v" value=$t.num}
			{/if}
			{if $t.type =='caps'}
				{assign var="c" value=1}
			{/if}
		{/foreach}
		
		{if isset($v) && $v!='no'}
			{assign var="len" value="0"}
			{foreach from=$result.PreviewXML.content.names.name_attr item="n"}
			{if isset($n.movie_length)}
				{math assign="len" equation="max(a,b)" a=$len b=$n.movie_length}
			{/if}
			{/foreach}
		{/if}
		{if isset($h) && isset($v) && $h!="no" && $v!="no"}
			{$h}&nbsp;{$templateconf.txtPhotos}&nbsp;,
			 {include file="$spath/general/display_movielength.tpl" length=$len }
			 {$templateconf.txtofvideo}
		{elseif isset($h) &&  $h!="no"}	
			{$h}&nbsp;Photos
		{elseif isset($v) && $v!="no" }
			{include file="$spath/general/display_movielength.tpl" length=$len }&nbsp;{$templateconf.txtofvideo}
		{/if}


</td>
</tr>

{if $result.PreviewXML.sets.set|@count}
<tr>
<td colspan="2">
<!--Featured Models-->

{$templateconf.txtfeaturedmodels}&nbsp;

	{foreach from=$result.PreviewXML.sets.set item="set" name="setLoop"}
<a class="model-category-links" href="{include file="$spath/general/pg_sets.tpl" id=$set.Id[0] seoname=$set.SEOname[0] item=$set}">{$set.ModelName[0]}</a>{if !$smarty.foreach.setLoop.last},{/if}	
	{/foreach}
</td>
</tr>
{/if}

<tr>
<td colspan="2">
<!--Categories-->
{$templateconf.txtcategories}&nbsp; 

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

{foreach from=$result.PreviewXML.category.item_attr item="catItem"}
{foreach from=$root.page.categories.cat item="cat1"}
{if $cat1.Title[0] == 'Tags'}
{foreach from=$cat1.cats.cat item="cat2"}
	{if $cat2.Id[0] == $catItem.category}{assign var="count" value=$count-1}<a class="model-category-links" href="{include file="$spath/general/pg_category.tpl" id=$catItem.category seoname=$catItem.seoname item=$catItem}">{$cat2.Title[0]}</a>{if $count > 0},{/if}{/if}
{/foreach}
{/if}
{/foreach}
{/foreach}


	

	</td>
		</tr>

</table>


</td>
</tr>
</table>
</div>


{/foreach}
</div>



<!--*****This displays the Page Navigation table-->
{if count($root.page.numpages.p) > 1}
{include file="search/pagenav.tpl"}
{/if}

</div>







{/if}

{include file='general/page_bottom.tpl' item=search}
