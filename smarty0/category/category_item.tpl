{strip}
{if isset($item) && $item!=""}

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




<table cellspacing="2" cellpadding="0" border="0">
<tr>
<td colspan="2" align="left">

<!--Site Name-->
{include file="$spath/general/sitelink.tpl" item=$item}

<br />

<!--Title-->
<span class="update_title">
{if ($root.page.content_attr[0].contentasc==1)}
  <a class="model_title" href="{include file="$spath/general/pg_sets.tpl" id=$item.modelid[0] seoname=$item.modelseo[0] item=$item}">{$item.modelname[0]}</a><br>
<span class="update_info">{$templateconf.txtupdates}: {$item.setcount[0]}</span>
{elseif ($root.page.category.Title[0] == 'Movies') || ($root.page.category.MainLanguage_Title[0] == 'Movies')}	
  <a class="model_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{$item.Title[0]}</a>
{elseif ($root.page.category.Title[0] == 'Photos') || ($root.page.category.MainLanguage_Title[0] == 'Photos')}	
  <a class="model_title" href="{include file="$spath/general/pg_gallery.tpl" type="highres" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{$item.Title[0]}</a>
{elseif isset($vids)}	
  <a class="model_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{$item.Title[0]}</a>
{elseif isset($highres)}	
  <a class="model_title" href="{include file="$spath/general/pg_gallery.tpl" type="highres" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{$item.Title[0]}</a>
{else}
  <a class="model_title" href="{include file="$spath/general/pg_gallery.tpl" type="" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{$item.Title[0]}</a>
{/if}

</span>





{if ($root.page.content_attr[0].contentasc==1)}

	{else}


	
<br />




<!--Photo Count/Movie Length-->
<span class="update_info">

{if ($root.page.category.Title[0] == 'Photos') || ($root.page.category.MainLanguage_Title[0] == 'Photos')}	
		{if isset($highres)}
			{$highres}&nbsp;{$templateconf.txtphotos}&nbsp;
		{/if}
		{if isset($caps)} {$caps}&nbsp;{$templateconf.txtvideoscreencaps}{/if}

{else}

	{assign var="mv" value="0"}
	{foreach from=$item.PreviewXML.content.names.name_attr item="namel"}
	{if isset($namel.movie_length)}
		{math assign="mv" equation="max(a,b)" a=$mv b=$namel.movie_length}
	{/if}
	{/foreach}
	{if isset($highres)}
			{$highres}&nbsp;{$templateconf.txtphotos}&nbsp;
		{/if}
	{if $mv != '0'}
		{include file="$spath/general/display_movielength.tpl" length=$mv}{$templateconf.txtofvideo}
	{/if}
{/if}
</span>

	{/if}


<br />



<!--Thumbnail-->

{if ($root.page.category.Title[0] == 'Movies') || ($root.page.category.MainLanguage_Title[0] == 'Movies')}
	<a class="model_title"   href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
	<!--This displays a thumbnail for the content set-->
{include file="$spath/general/stdimage.tpl" item=$item usepriority="14,20,21,22,23,24,25" alt="" class="thumbs"}
	</a> 


{elseif ($root.page.category.Title[0] == 'Photos') || ($root.page.category.MainLanguage_Title[0] == 'Photos')}	
		{if isset($highres)}	
			<a href="{include file="$spath/general/pg_gallery.tpl" type="highres" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
			<!--This displays a thumbnail for the content set-->
	{include file="$spath/general/stdimage.tpl" item=$item usepriority="14,20,21,22,23,24,25" alt="" class="thumbs"}
			</a>


		{elseif isset($caps)}					
			<a  href="{include file="$spath/general/pg_gallery.tpl" type="caps" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
			<!--This displays a thumbnail for the content set-->
{include file="$spath/general/stdimage.tpl" item=$item usepriority="14,20,21,22,23,24,25" alt="" class="thumbs"}
			</a>


		{/if}
{elseif ($root.page.content_attr[0].contentasc==1)}
<!--This displays a thumbnail for the content set-->
	<a href="{include file="$spath/general/pg_sets.tpl" id=$item.modelid[0] seoname=$item.modelseo[0] item=$item}">

	 {foreach item=i from=$item.ModelXML.element.item_attr}
	 {if ($i.priority==16)}
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
			<a class="model_title"   href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
		{elseif  isset($highres)}	
			<a class="model_title"   href="{include file="$spath/general/pg_gallery.tpl" type="highres" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
		{else}
			<a class="model_title"   href="{include file="$spath/general/pg_gallery.tpl" type="" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
		{/if}
	{include file="$spath/general/stdimage.tpl" item=$item usepriority="14,20,21,22,23,24,25" alt="" class="thumbs"}
	</a>


{/if}

</td>
</tr>
<tr>
	
	<td class="date">

<!--Date-->
{$templateconf.txtadded} {$item.DateDisplay[0]}






</td>

<td align="right" class="scene_info">

<!--Rating-->
{if in_array('ratings',$pluginsdata.plugins) && $pluginsdata.enabled.ratings == 1}


{if isset($item.plg_ratings_rank[0]) && $item.plg_ratings_rank[0]!=""} {assign var="el1" value=$item.plg_ratings_rank[0]} {else} {assign var="el1" value="0"} {/if}
{if isset($item.plg_ratings_total[0]) && $item.plg_ratings_total[0]!=""} {assign var="el2" value=$item.plg_ratings_total[0]} {else} {assign var="el2" value="1"} {/if}
{math equation="round((el1/el2)*10)" el1=$el1 el2=$el2 assign="rating"}
{include file="$spath/general/votefrm_model.tpl" rating=$rating hover="0"}
{/if}



<td>
</tr>
</table>



{else}&nbsp

{/if}
{/strip}