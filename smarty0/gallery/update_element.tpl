{if !isset($usepriority) } {assign var="usepriority" value="10"} {/if}

<table cellspacing="2" cellpadding="0" border="0">
<tr>
<td colspan="2">

<!--Site Name-->
{include file="$spath/general/sitelink.tpl" item=$item}

<br />

<!--Title-->
{if isset($hType) && isset($vType) && $hType && $vType}
<a  class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{$item.Title[0]}</a>
{elseif isset($hType) && $hType }<a  class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="highres" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{$item.Title[0]}</a>
{elseif isset($vType) && $vType }<a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{$item.Title[0]}</a>
{else}<a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type=$item.PreviewXML.content.types.type_attr[0].type id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{$item.Title[0]}</a>
{/if}





<br />


<!--Thumbnail-->
{if isset($hType) && isset($vType) && $hType && $vType}
<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
{include file="$spath/general/stdimage.tpl" item=$item usepriority="14,20,21,22,23,24,25" alt="" class="thumbs"}
</a>
{elseif isset($hType) && $hType }
<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl" type="highres" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
{include file="$spath/general/stdimage.tpl" item=$item usepriority="14,20,21,22,23,24,25" alt="" class="thumbs"}
</a>
{elseif isset($vType) && $vType }
<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
{include file="$spath/general/stdimage.tpl" item=$item usepriority="14,20,21,22,23,24,25" alt="" class="thumbs"}
</a>
{else}
<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl" type=$item.PreviewXML.content.types.type_attr[0].type id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
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

<td align="right">

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