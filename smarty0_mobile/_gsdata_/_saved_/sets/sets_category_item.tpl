{**
* The set category item page -Sub page of sets.tpl
* @param $item 
*}
{if $item}

{global get="mediatype_vids" assign=mediatype_vids}
{global get="mediatype_pics" assign=mediatype_pics}
{global get="mediatype_caps" assign=mediatype_caps}

{if !(isset($usepriority))} {assign var="usepriority" value=13} {/if}

{assign var="img" value=""}
{assign var="img_w" value="320"}
{assign var="img_h" value="240"}


{** Getting the content type attributes  **}
{foreach from=$item.PreviewXML.element.item_attr item="eitem" key="k"}

	{if $eitem.priority == $usepriority && ($img == "") }
		{assign var="img" value=$eitem.Id}
		{assign var="img_w" value=$eitem.thumb_width}
		{assign var="img_h" value=$eitem.thumb_height}
	{/if}
{/foreach}


<div class="info">
		<!--This displays a thumbnail for the content set-->
	<span class="title">{$item.Title[0]}</span>
<br />

{if $img}
	<img class="thumbs" src="{#contentdir#}/contentthumbs/{$img}.jpg" width="{$img_w}" height="{$img_h}" />
{/if}

<div align="center" cellspacing="0" cellpadding="0" border="0">
		<div>
			<div style="padding-right:4px;" class="sub-heading">{$templateconf.txtrating}</div>
			<div align="left" class="plaintext">
		
		<!-- Using Model because it has white stars -->
		<!-- Also, we're not doing voting here -->
				{if isset($item.plg_ratings_rank[0]) && $item.plg_ratings_rank[0]!=''} {assign var="el1" value=$item.plg_ratings_rank[0]} {else} {assign var="el1" value=0} {/if}
				{if isset($item.plg_ratings_total[0]) && $item.plg_ratings_total[0]!=''} {assign var="el2" value=$item.plg_ratings_total[0]} {else} {assign var="el2" value=1} {/if}
				{math equation="round((el1/el2)*10)" el1=$el1 el2=$el2 assign=rating}
				{include file="$spath/general/votefrm_model.tpl" rating=$rating hover=0}
		
			</div>
		</div>
		</div>	

	<span class="info">
		{assign var="h" value="no"}
		{assign var="v" value="no"}
		{assign var="c" value="no"}
		{foreach from=$item.PreviewXML.content.types.type_attr item="t"}
			{if $t.type == $mediatype_pics}
				{assign var="h" value=$t.num}
			{/if}
			{if $t.type == $mediatype_vids}
				{assign var="v" value=$t.num}
			{/if}
			{if $t.type == $mediatype_caps}
				{assign var="c" value=1}
			{/if}
		{/foreach}
		
		{if isset($v) && $v!='no'}
			{assign var="len" value="0"}
			{foreach from=$item.PreviewXML.content.names.name_attr item="n"}
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
		</span>
		


		<div>
		<div><div>
		{assign var="count" value=0}
		{foreach from=$item.PreviewXML.sets.set item="setItem"}
		{if $setItem.Id[0] != $roots.page.models.model.Id[0]}
			{assign var="count" value=$count+1}
		{/if}
		{/foreach}
		</div></div>
		{if $count >1}
		<div><div class="info">

<span class="sub-heading">{$templateconf.txtfeaturedmodels}</span>

	{foreach from=$item.PreviewXML.sets.set item="setItem"}
			{if $setItem.Id[0] != $roots.page.models.model.Id[0]}
				{assign var="count" value=$count-1}
				<a class="model-category-links" href="{include file="$spath/general/pg_sets.tpl" id=$setItem.Id[0] seoname=$setItem.SEOname[0] item=$setItem}">{$setItem.ModelName[0]}</a> 
				{if $count > 0}, {/if}	
			{/if}
			{/foreach}

	
	<br />

<span class="sub-heading">{$templateconf.txtcategories}</span>


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
			{if $cat2.Id[0] == $catItem.category}{assign var="count" value=$count-1}<a class="model-category-links" href="{include file="$spath/general/pg_category.tpl" id=$catItem.category seoname=$catItem.seoname item=$catItem}">{$cat2.Title[0]}</a>{if $count > 0},{/if}{/if}
		{/foreach}
		{/if}
		{/foreach}
		{/foreach}

		{/if}

		</div></div>
</div>
	
	
	<br />
	<br />


<span class="sub-heading">{$templateconf.txtinsidethisupdate}</span>


	<br />


		<!--The following displays the content links-->
				{if isset($h) && $h!='no'}
				<a class="content-links" href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_pics id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">
				{$templateconf.txtPhotos}</a>
				{/if}
				
				{if isset($c) && isset($h) && $c!="no" && $h!="no"} &nbsp;|&nbsp; {/if}
				
				{if isset($c) && $c!='no'}
				<a class="content-links" href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_caps id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">
				{$templateconf.txtvidcaps}</a>
				{/if}
				
				
				{if (isset($c) && isset($v) && $c!="no" && $v!="no") || (isset($v) && isset($h) && $v!="no" && $h!="no")} &nbsp;|&nbsp; {/if}
				{if isset($v) && $v!='no'}
				<a class="content-links" href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_vids id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">
				{$templateconf.txtMovies}
				</a>
				{/if}


	{if $k < ($count-1)}
	<br /><br /><hr />
	{/if}

</div>

{/if}
