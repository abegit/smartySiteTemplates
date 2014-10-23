
<table class="content_wrapper">
<tr>
<td id="title_center">
<!--Title-->
{$item.Title[0]}
</td>
</tr>


<tr>
<td>


{if $item.trailer_url_mobile[0]}
	<div align="center" class="playrow">
	<div class="playrow hid" id="mediaplayer" align="center"></div>
	</div>

<script>
	mobile_trailer = "{$item.trailer_url_mobile[0]}"

	{literal}
	picarr = []
	
	$(document).ready(function() {
		
		if (mobile_trailer == "")
		{
			return;
		}		

		passobj = {}	
		passobj.file = mobile_trailer;
		passobj.image = "{/literal}content/{$item.Directory[0]}/0.jpg{literal}"			
		passobj.autostart = false;		
		
		passobj.width = parseInt($(".header").width());
		passobj.height = parseInt($(".header").width() * 9 / 16);

		passobj.primary = "flash";
		
		jwplayer("mediaplayer").setup(passobj);
	});
		
	$(window).resize(function() {
	
		if ( mobile_trailer != "" )
		{			
			jw_wdth = jwplayer('mediaplayer').getWidth();
			jw_hdth = jwplayer('mediaplayer').getHeight();
		
			wdth = parseInt($(".header").width());
			hdth = parseInt(wdth * jw_hdth / jw_wdth);
	
			try
			{	
				jwplayer('mediaplayer').resize( wdth, hdth );
			}
			catch(e)
			{
				console.log(wdth + "x" + hdth + " " + jw_wdth + "x" + jw_hdth + " - " + e);
			}
		}
	});
	
	{/literal}

</script>

<br />

{/if}

{if $item.Description[0]}
<div class="description">{$item.Description[0]}</div>
{/if}

<div class="element_wrapper">

	<div class="element">
	<a href="pages.php?id=join">{include file="$tourname/stdimage.tpl" width="297" height="230" item=$item class="thumbs" priority="1"}
	</div>

	<div class="element">
	<a href="pages.php?id=join">{include file="$tourname/stdimage.tpl" width="297" height="230" item=$item class="thumbs" priority="2"}
	</div>

	<div class="element">
	<a href="pages.php?id=join">{include file="$tourname/stdimage.tpl" width="297" height="230" item=$item class="thumbs" priority="3"}
	</div>
	
	<div class="element">
	<a href="pages.php?id=join">{include file="$tourname/stdimage.tpl" width="297" height="230" item=$item class="thumbs" priority="4"}
	</div>
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
{include file="$spath/$tourname/sitelink.tpl" item=$item}
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
			{if $cat2.Id[0] == $catItem.category}{assign var="count" value=$count-1}<a href="{include file="$spath/general/pg_category.tpl" id=$catitem.category seoname=$cat2.SEOname[0] item=$cat2}">{$cat2.Title[0]}</a>{if $count > 0}, {/if}{/if}
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




