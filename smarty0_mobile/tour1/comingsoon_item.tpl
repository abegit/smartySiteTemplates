
<table class="content_wrapper">
<tr>
<td id="title_center">
<!--Title-->
{$item.Title[0]}<br>

</td>
</tr>
<tr>
<td>

<div class="coming_soon">
<!--Date-->
{$templateconf.txtcoming}&nbsp;{$item.DateDisplay[0]}
</div>

<!--This displays thumbnails for the set-->

{include file="$tourname/stdimage.tpl" width="297" height="230" item=$item class="thumbs" priority="1"}
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
{include file="$spath/$tourname/sitelink.tpl" item=$item}
{/if}
</td>
</tr>

<tr>
<td>
<!--Date-->
{$templateconf.txtcoming}&nbsp;{$item.DateDisplay[0]}
</td>
<td>
<!--Rating-->
{if isset($item.plg_ratings_rank[0]) && $item.plg_ratings_rank[0]!=""}{assign var="el1" value=$item.plg_ratings_rank[0]} {else} {assign var="el1" value=0} {/if}
{if isset($item.plg_ratings_total[0]) && $item.plg_ratings_total[0]!=""}{assign var="el2" value=$item.plg_ratings_total[0]} {else} {assign var="el2" value=1} {/if}

{math equation="round((el1/el2)*10)" el1=$el1 el2=$el2 assign="rating"}
{include file="$spath/$tourname/votefrm.tpl" rating=$rating}

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




