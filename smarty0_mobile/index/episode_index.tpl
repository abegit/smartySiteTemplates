{** Program Code - Do Not Edit **}
{if !(isset($usepriority))} {assign var="usepriority" value=14} {/if}

{global get="mediatype_vids" assign=mediatype_vids}
{global get="mediatype_pics" assign=mediatype_pics}


{assign var="ml" value="0"}
{foreach from=$item.PreviewXML.content.types.type_attr item="tattr" key="k"}
	{if $tattr.type == $mediatype_pics && !isset($h)} {assign var="h" value=$tattr.num} 
	{elseif $tattr.type == $mediatype_vids && !isset($v)} {assign var="v" value=$tattr.num} 
	{else} {assign var="type" value=$tattr.type} {/if} 

	{if isset($tattr.movie_length)}
		{math assign="ml" equation="max(a,b)" a=$ml b=$tattr.movie_length}
	{/if}

{/foreach}

{** Start Editable Design **}

<div class="element">

<div class="content_wrapper">
<div>
<div id="title">
<!--This displays the title for the content set-->
{if isset($h) && isset($v)}
<a href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_vids id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">
{$item.Title[0]}</a>
{elseif isset($h)}	
<a href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_pics id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">
{$item.Title[0]}</a>
{elseif isset($v)}	
<a href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_vids id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">
{$item.Title[0]}</a>
{else}
<a href="{include file="$spath/general/pg_gallery.tpl" type=$type id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">
{$item.Title[0]}</a>
{/if}
</div>
</div>
<div>
<div>


<!--This displays a thumbnail for the content set-->

	{if isset($h) && isset($v)}
	<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_vids id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">
	{include file="$spath/general/stdimage.tpl" item=$item usepriority=$usepriority alt="" class="thumbs"}</a>
	{elseif isset($h)}	
	<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_pics id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">
	{include file="$spath/general/stdimage.tpl" item=$item usepriority=$usepriority alt="" class="thumbs"}</a>
	{elseif isset($v)}	
	<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_vids id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">
	{include file="$spath/general/stdimage.tpl" item=$item usepriority=$usepriority alt="" class="thumbs"}</a>
	{else}
	<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl" type=$type id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">
	{include file="$spath/general/stdimage.tpl" item=$item usepriority=$usepriority alt="" class="thumbs"}</a>
	{/if}
</div>
</div>

<div>
<div class="info">


<div>
<div>
<div>
<!--Site Name-->
{global get="showallaccesslinks" assign=showallaccesslinks}
{if $showallaccesslinks == 1}
{include file="$spath/general/sitelink.tpl" item=$item}
{/if}
</div>
</div>

<div>
<div>
<!--Date-->
{$templateconf.txtadded}&nbsp;{$item.DateDisplay[0]}
</div>
<div>
<!--Rating-->
{if strlen($item.plg_ratings_rank[0]) && strlen($item.plg_ratings_total[0] ) }
	{math equation ="((el1/el2)*10)" el1=$item.plg_ratings_rank[0] el2=$item.plg_ratings_total[0] assign=rating}	
{else}
	{assign var="rating" value=0}
{/if}
{include file="$spath/general/votefrm_model.tpl" rating=$rating hover=0 }
</div>
</div>

<div>
<div>


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
			{assign var="len" value=0}
			{foreach from=$item.PreviewXML.content.names.name_attr item="n"}
				{if isset($n.movie_length)}
					{math assign="len" equation="max(a,b)" a=$len b=$n.movie_length}
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


</div>
</div>

<div>
<div>
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

	
</div>
		</div>
<div>
<div>
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

	</div>
		</div>
</div>

</div>
</div>
</div>

</div>

