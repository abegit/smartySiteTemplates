<div id="episode">
<a name="update"></a>

{strip}
<table id="episode_title" cellspacing="0" cellpadding="0" border="0">
<tr>
<td><!--Title-->
{$item.Title[0]}</td>
<td>
<!--Featured Models-->
{$templateconf.txtfeaturedmodels}&nbsp;
{if isset($item.PreviewXML.sets.set)}
	{foreach from=$item.PreviewXML.sets.set item="itemS" name="loopCN"}{$itemS.ModelName[0]} 
		{if !$smarty.foreach.loopCN.last },&nbsp;{/if}
	{/foreach}
{/if}</td>
<td align="right">{$templateconf.txtadded}&nbsp;{$item.DateDisplay[0]}</td>
</tr>
</table>
{/strip}




	



<table id="episode_thumbs_table" cellspacing="0" cellpadding="0" border="0" align="center" width="961">

<tr>
<td class="episode_thumbs" rowspan="2" width="664" align="center"><div align="center">

{if $item.trailer_url[0]!=""}
<a class="trailer_link" href="{include file="$tourname/pg_trailer.tpl" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}#update" onclick="return tlimit()">
{include file="$tourname/stdimage.tpl" width="664" height="468" item=$item class="thumbs" priority="0"}
</a>
{else}
{include file="$tourname/stdimage.tpl" width="664" height="468" item=$item class="thumbs" priority="0"}
{/if}

</div></td>
<td class="episode_thumbs" width="297">{include file="$tourname/stdimage.tpl" width="297" height="230" item=$item class="thumbs" priority="1"}</td>
</tr>
<tr>
<td class="episode_thumbs" width="297">{include file="$tourname/stdimage.tpl" width="297" height="230" item=$item class="thumbs" priority="2"}</td>
</tr>
<tr>
<td>


<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td>



{if isset($item.plg_ratings_rank[0]) && $item.plg_ratings_rank[0]!=""}{assign var="el1" value=$item.plg_ratings_rank[0]} {else} {assign var="el1" value=0} {/if}
{if isset($item.plg_ratings_total[0]) && $item.plg_ratings_total[0]!=""}{assign var="el2" value=$item.plg_ratings_total[0]} {else} {assign var="el2" value=1} {/if}

{math equation="round((el1/el2)*10)" el1=$el1 el2=$el2 assign="rating"}
{include file="$spath/$tourname/votefrm.tpl" rating=$rating}





<div class="episode_description">

<!--Description-->
{$item.Description[0]}

{strip}
<br />
<br />

<!--Photo Count/Movie Length-->
{foreach from=$item.PreviewXML.content.types.type_attr item="tmp"}
	{if $tmp.type== "highres"}
		{assign var="h" value=$tmp.num}
	{/if}
{/foreach}

{assign var="ml" value="0"}
{foreach from=$item.PreviewXML.content.names.name_attr item="itemN"}
{if isset($itemN.movie_length)}
    {if !isset($ml)} {assign var="ml" value=0} {/if}
	{math assign="ml" equation="max(a,b)" a=$ml b=$itemN.movie_length}
{/if}
{/foreach}



{if isset($h)}{$h}&nbsp;{$templateconf.txtPhotos}&nbsp;{/if}
{if ($ml) && isset($h)}&nbsp;{$templateconf.txtand}&nbsp;{/if}
{if ($ml)}
  {include file="$spath/general/display_movielength.tpl" length=$ml} {$templateconf.txtofvideo}
{/if}

<br />
<br />
{/strip}


<div align="left">
{if $item.trailer_url[0]!=""}
	<a class="trailer_link" href="{include file="$tourname/pg_trailer.tpl" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}#update" onclick="return tlimit()">

{$templateconf.tourtxtwatchtrailer}</a>
{/if}

</div>

</div>



</td>
<td width="297" align="right" class="episode_thumbs">{include file="$tourname/stdimage.tpl" width="297" height="230" item=$item class="thumbs" priority="3"}</td>
</tr>
</table>

	</td>
<td class="episode_thumbs">
{include file="$tourname/stdimage.tpl" width="297" height="230" item=$item class="thumbs" priority="4"}
	</td>
</tr>
</table>

<div class="episode_footer">
<a href="{$root.page.tour.JoinUrl}" class="episode_join_link">{$templateconf.tourtxtjoinlink}</a>
</div>


</div>



<br />