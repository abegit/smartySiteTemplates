{strip}
{if isset($item) && $item!=""}

{global get="mediatype_vids" assign="mediatype_vids"}
{global get="mediatype_pics" assign="mediatype_pics"}
{global get="mediatype_caps" assign="mediatype_caps"}


{assign var="cdir" value=#contentdir#}

{foreach from=$item.PreviewXML.content.types.type_attr item="type"}
	{if $type.type =='highres'}
		{assign var="highres" value=$type.num} 			
	{elseif $type.type =='caps'}	
		{assign var="caps" value=$type.num}
	{elseif $type.type =='vids'}
		{assign var="vids" value=$type.num}
	{/if}
{/foreach}




<div class="content_wrapper">
<div>
<div id="title_center">


<!--Title-->

{if ($root.page.content_attr[0].contentasc==1)}
  <a class="model_title" href="{include file="$spath/general/pg_sets.tpl" id=$item.modelid[0] seoname=$item.modelseo[0] item=$item}">{$item.modelname[0]}</a>
{elseif ($root.page.category.Title[0] == 'Movies') || ($root.page.category.MainLanguage_Title[0] == 'Movies')}	
  <a class="model_title" href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_vids id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{$item.Title[0]}</a>
{elseif ($root.page.category.Title[0] == 'Photos') || ($root.page.category.MainLanguage_Title[0] == 'Photos')}	
  <a class="model_title" href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_pics id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{$item.Title[0]}</a>
{elseif isset($vids)}	
  <a class="model_title" href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_vids id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{$item.Title[0]}</a>
{elseif isset($highres)}	
  <a class="model_title" href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_pics id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{$item.Title[0]}</a>
{else}
  <a class="model_title" href="{include file="$spath/general/pg_gallery.tpl" type="" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{$item.Title[0]}</a>
{/if}

</div>
</div>
<div>
<div>

<!--Thumbnail-->

{if ($root.page.category.Title[0] == 'Movies') || ($root.page.category.MainLanguage_Title[0] == 'Movies')}
	<a class="model_title"   href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_vids id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
	<!--This displays a thumbnail for the content set-->
{include file="$spath/general/stdimage.tpl" item=$item usepriority="14" alt="" class="thumbs"}
	</a> 


{elseif ($root.page.category.Title[0] == 'Photos') || ($root.page.category.MainLanguage_Title[0] == 'Photos')}	
		{if isset($highres)}	
			<a href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_pics id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
			<!--This displays a thumbnail for the content set-->
	{include file="$spath/general/stdimage.tpl" item=$item usepriority="14" alt="" class="thumbs"}
			</a>


		{elseif isset($caps)}					
			<a  href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_caps id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
			<!--This displays a thumbnail for the content set-->
{include file="$spath/general/stdimage.tpl" item=$item usepriority="14" alt="" class="thumbs"}
			</a>


		{/if}
{elseif ($root.page.content_attr[0].contentasc==1)}
<!--This displays a thumbnail for the content set-->
	<a href="{include file="$spath/general/pg_sets.tpl" id=$item.modelid[0] seoname=$item.modelseo[0] item=$item}">


	 {foreach item=i from=$item.ModelXML.element.item_attr}
	 {if ($i.priority==14)}
	   {assign var="setIdmatch" value=$i.Id}
	   {assign var="pInfo" value=$i}
	 {/if}
	 {/foreach}

	{if isset($setIdmatch) }
		<img class="thumbs" 
			{if $pInfo.Width > 0}width="{$pInfo.Width}"{/if}
			{if $pInfo.Height > 0}height="{$pInfo.Height}"{/if}
			src="{$cdir}/contentthumbs/{$setIdmatch}-set.jpg"/>
	{else}
		<img class="thumbs" src="images/p16.jpg"/>
	{/if}
	</a>
	
{else}

		{if isset($vids)}	
			<a class="model_title"   href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_vids id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
		{elseif  isset($highres)}	
			<a class="model_title"   href="{include file="$spath/general/pg_gallery.tpl" type=$mediatype_pics id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
		{else}
			<a class="model_title"   href="{include file="$spath/general/pg_gallery.tpl" type="" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
		{/if}
	{include file="$spath/general/stdimage.tpl" item=$item usepriority="14" alt="" class="thumbs"}
	</a>


{/if}

</div>
</div>

<div>
{if ($root.page.content_attr[0].contentasc==1)}
<div class="model_info">
{else}
<div class="info">
{/if}

<div>
<div>
<div>
<!--Site Name-->
{include file="$spath/general/sitelink.tpl" item=$item}

</div>
</div>

<div>
<div>
<!--Date-->
{$templateconf.txtadded} {$item.DateDisplay[0]}
</div>

<div>
<!--Rating-->
{if in_array('ratings',$pluginsdata.plugins) && $pluginsdata.enabled.ratings == 1}


{if isset($item.plg_ratings_rank[0]) && $item.plg_ratings_rank[0]!=""} {assign var="el1" value=$item.plg_ratings_rank[0]} {else} {assign var="el1" value="0"} {/if}
{if isset($item.plg_ratings_total[0]) && $item.plg_ratings_total[0]!=""} {assign var="el2" value=$item.plg_ratings_total[0]} {else} {assign var="el2" value="1"} {/if}
{math equation="round((el1/el2)*10)" el1=$el1 el2=$el2 assign="rating"}
{include file="$spath/general/votefrm_model.tpl" rating=$rating hover="0"}
{/if}
</div>
</div>

<div>
<div>


{if ($root.page.content_attr[0].contentasc != 1)}


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

	{/if}



</div>
</div>

{if ($root.page.content_attr[0].contentasc==1)}

	{else}

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
	{/if}

</div>


</div>
</div>
</div>

<br />

{else}&nbsp

{/if}
{/strip}