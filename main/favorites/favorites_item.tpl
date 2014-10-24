{global get="image_folder" assign="image_folder"}
{if !isset($usepriority) } {assign var="usepriority" value="10"} {/if}

{foreach from=$item.PreviewXML.content.names.name_attr item="itemN"}
{if isset($itemN.movie_length) && !isset($ml)} {assign var="ml" value=$itemN.movie_length} {/if}
{/foreach}

{assign var="hType" value=0}{assign var="vType" value=0}
{foreach from=$item.PreviewXML.content.types.type_attr item="itemF" key="keyF"}
{if $itemF.type == 'highres'}{assign var="hType" value=1}{if isset($itemF.num)} {assign var="numP" value=$itemF.num}{/if}{/if}
{if $itemF.type == 'vids'}{assign var="vType" value=1}{/if}
{/foreach}

{assign var="thumbfile" value=""}
{foreach from=$item.PreviewXML.element.item_attr item="itemE" key="keyE"}
{if $itemE.priority == $usepriority}{assign var="thumbfile" value=$itemE.Id}{/if}
{/foreach}

<table cellspacing="0" cellpadding="0" border="0">
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

<!--Photo Count/Movie Length-->
<span class="update_info">
{if isset($hType) && isset($vType) && $hType && $vType }
{$numP}&nbsp;{$templateconf.txtphotos}

{include file="$spath/general/display_movielength.tpl" length=$ml}{$templateconf.txtofvideo}

{elseif isset($hType) && $hType}
{$numP}&nbsp;{$templateconf.txtphotos}
{elseif isset($ml)}
{include file="$spath/general/display_movielength.tpl" length=$ml}{$templateconf.txtofvideo}
{/if}
</span>

<br />

<!--Thumbnail-->
{if isset($hType) && isset($vType) && $hType && $vType}
<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
{include file="$spath/general/stdimage.tpl" item=$item usepriority="14" alt="" class="thumbs"}
</a>
{elseif isset($hType) && $hType }
<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl" type="highres" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
{include file="$spath/general/stdimage.tpl" item=$item usepriority="14" alt="" class="thumbs"}
</a>
{elseif isset($vType) && $vType }
<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
{include file="$spath/general/stdimage.tpl" item=$item usepriority="14" alt="" class="thumbs"}
</a>
{else}
<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl" type=$item.PreviewXML.content.types.type_attr[0].type id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
{include file="$spath/general/stdimage.tpl" item=$item usepriority="14" alt="" class="thumbs"}
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
<tr><td colspan="2" class="date">
<!--Date Added-->
{if $item.FavAdded[0] != ""}{$templateconf.txtaddedtofavorites} {$item.FavAdded[0]}{/if}
</td></tr>


</table>

	<table cellspacing="2" cellpadding="2" border="0">
<tr>

	<td><img src="{$image_folder}/icons/remove.gif" width="16" height="16" alt=""/></td>
	<td><a class="favorites_link" href="favorites.php?del={$item.Id[0]}">{$templateconf.txtremovefromfavorites}</a></td>
</tr>
</table>




































