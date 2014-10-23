{**
* This is the feature update element - called from index_feature.tpl 
*	@param $item - the $root.page.whatshot.item instance 
*}
{if !(isset($usepriority))} {assign var="usepriority" value=13} {/if}

{global get="mediatype_vids" assign=mediatype_vids}
{global get="mediatype_pics" assign=mediatype_pics}
{global get="mediatype_caps" assign=mediatype_caps}


{** Find out what the content type is **}
{assign var="ml" value="0"}
{foreach from=$item.PreviewXML.content.types.type_attr item="tattr" key="k"}
	{if $tattr.type == $mediatype_pics && !isset($h)} {assign var="h" value=$tattr.num} 
	{elseif $tattr.type == $mediatype_vids && !isset($v)} {assign var="v" value=$tattr.num} 
	{else} {assign var="type" value=$tattr.type} {/if} 

	{if isset($tattr.movie_length)}
		{math assign="ml" equation="max(a,b)" a=$ml b=$tattr.movie_length}
	{/if}
{/foreach}

{** Getting the content type attributes  **}
{foreach from=$item.PreviewXML.element.item_attr item="eitem" key="k"}
	{if $eitem.priority ==$usepriority && !isset($img) } 
	{assign var="img" value=$eitem.Id} 
	{assign var="img_w" value=$eitem.thumb_width}
	{assign var="img_h" value=$eitem.thumb_height}
	{/if}	
{/foreach}

<div class="element">

<table class="content_wrapper">
<tr>
<td id="title">

<!--This displays the title for the content set-->
{$item.Title[0]}


</td>
</tr>
<tr>
<td>

<!--This displays a thumbnail for the content set-->
	<img alt="" class="thumbs" src="{#contentdir#}/contentthumbs/{$img}.jpg" width="{$img_w}" height="{$img_h}" />


</td>
</tr>


<tr>
<td class="info">


<table>
<tr>

<td>

<!--Site Name-->
{include file="$spath/general/sitelink.tpl" item=$item}

</td>
</tr>

<tr>
<td>
<!--Date-->
{$templateconf.txtcoming}&nbsp;{$item.DateDisplay[0]}
</td>
</tr>



<tr><td>

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

{if ($root.page.content_attr[0].contentasc==1)}

	{else}

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
			{if $cat2.Id[0] == $catItem.category}{assign var="count" value=$count-1}<a href="{include file="$spath/general/pg_category.tpl" id=$catItem.category seoname=$catItem.seoname item=$catItem}">{$cat2.Title[0]}</a>{if $count > 0}, {/if}{/if}
		{/foreach}
		{/if}
		{/foreach}
		{/foreach}

		{/if}

	</td>
		</tr>
	{/if}

</table>


</td>
</tr>
</table>

</div>
