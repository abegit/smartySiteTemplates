
{global get="mediatype_vids" assign=mediatype_vids}
{global get="mediatype_pics" assign=mediatype_pics}

{assign var="hType" value=0}{assign var="vType" value=0}
{foreach from=$item.PreviewXML.content.types.type_attr item="itemF" key="keyF"}
{if $itemF.type == $mediatype_pics}{assign var="hType" value=1}{if isset($itemF.num)} {assign var="numP" value=$itemF.num}{/if}{/if}
{if $itemF.type == $mediatype_vids}{assign var="vType" value=1}{/if}
{/foreach}

<table class="content_wrapper">
<tr>
<td id="title_center">

<!--Title-->
{if isset($hType) && isset($vType) && $hType && $vType}
<a class="title" href="{include file="general/pg_gallery.tpl" type=$mediatype_vids id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{$item.Title[0]}</a>
{elseif isset($hType) && $hType }<a class="title" href="{include file="general/pg_gallery.tpl" type=$mediatype_pics id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{$item.Title[0]}</a>
{elseif isset($vType) && $vType }<a class="title" href="{include file="general/pg_gallery.tpl" type=$mediatype_vids id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{$item.Title[0]}</a>
{else}<a class="title" href="{include file="general/pg_gallery.tpl" type=$item.PreviewXML.content.types.type_attr[0].type id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{$item.Title[0]}</a>
{/if}


</td>
</tr>
<tr>
<td>

<!--This displays the thumbnails for the scene-->

<div style="element_wrapper">
	
	{section name=dvdimg start=26 loop=33 step=1}
		{assign var="usepriority" value=$smarty.section.dvdimg.index}
	
		<div class="dvd_image_element">
			<a class="title" href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_vids id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
				{include file="$spath/general/stdimage.tpl" item=$item usepriority=$usepriority alt="" class="thumbs"}
			</a>
		</div>
	{/section}

</div>

</td>
</tr>
<tr>
<td class="info">


<table>
<tr>
<td colspan="2">
<!--Site Name-->
{global get="showallaccesslinks" assign=showallaccesslinks}
{if $showallaccesslinks == 1}
{include file="$spath/general/sitelink.tpl" item=$item}
{/if}
</td>
</tr>

<tr>
<td>
<!--Date-->
{$templateconf.txtadded}&nbsp;{$item.DateDisplay[0]}
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
		{assign var="len" value=""}
		{foreach from=$item.PreviewXML.content.types.type_attr item="t"}
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
			{foreach from=$item.PreviewXML.content.names.name_attr item="n"}
				{if isset($n.movie_length) && !$len }
					{assign var="len" value=$n.movie_length}
				{/if}
			{/foreach}
		{/if}
		{if isset($h) && isset($v) && $h!="no" && $v!="no"}
			{strip}
			{$h}&nbsp;{$templateconf.txtphotos}.

			 {if $len}
             &nbsp;
			 {include file="$spath/general/display_movielength.tpl" length=$len }
			 {$templateconf.txtofvideo}.
			 {/if}
			{/strip}
		{elseif isset($h) &&  $h!="no"}	
			{$h}&nbsp; {$templateconf.txtphotos}.
		{elseif isset($v) && $v!="no" }
			{include file="$spath/general/display_movielength.tpl" length=$len }&nbsp;{$templateconf.txtofvideo}.
		{/if}


</td>
</tr>

<tr>
<td colspan="2">
<!--Featured Models-->	
		{assign var="count" value=0}
		{foreach from=$item.PreviewXML.sets.set item="setItem"}
		{if $setItem.Id[0] != $roots.page.models.model.Id[0]}
			{assign var="count" value=$count+1}
		{/if}
		{/foreach}
	
		{if $count >1}
	

{$templateconf.txtfeaturedmodels}&nbsp;

	{foreach from=$item.PreviewXML.sets.set item="setItem"}
			{if $setItem.Id[0] != $roots.page.models.model.Id[0]}
				{assign var="count" value=$count-1}
				<a href="{include file="$spath/general/pg_sets.tpl" id=$setItem.Id[0] seoname=$setItem.SEOname[0] item=$setItem}">{$setItem.ModelName[0]}</a> 
				{if $count > 0}, {/if}	
			{/if}
			{/foreach}

	
</td>
		</tr>
<tr>
<td colspan="2">
<!--Categories-->
{$templateconf.txtcategories}&nbsp;

	{assign var="count" value=0}
		{foreach from=$item.PreviewXML.category.item_attr item="catItem"}
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
		
		{foreach from=$item.PreviewXML.category.item_attr item="catItem"}
		{foreach from=$root.page.categories.cat item="cat1"}
		{if $cat1.Title[0] == 'Tags'}
		{foreach from=$cat1.cats.cat item="cat2"}
			{if $cat2.Id[0] == $catItem.category}{assign var="count" value=$count-1}<a href="{include file="$spath/general/pg_category.tpl" id=$cat2.Id[0] seoname=$cat2.SEOname[0] item=$cat2}">{$cat2.Title[0]}</a>{if $count > 0}, {/if}{/if}
		{/foreach}
		{/if}
		{/foreach}
		{/foreach}

		{/if}

	</td>
		</tr>
</table>

</td>
</tr>
</table>

<br />




