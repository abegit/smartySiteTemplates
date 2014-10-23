{if $item}

{** Code that determines whether the set has movies / pictures.  Do not remove **}
{strip}
{assign var="hType" value=0}{assign var="vType" value=0}
{foreach from=$item.PreviewXML.content.types.type_attr item="itemF" key="keyF"}
{if $itemF.type == 'highres'}{assign var="hType" value=1}{if isset($itemF.num)} {assign var="numP" value=$itemF.num}{/if}{/if}
{if $itemF.type == 'vids'}{assign var="vType" value=1}{/if}
{/foreach}
{/strip}


<table cellspacing="2" cellpadding="2" border="0">
<tr>
<td valign="top" align="left">

	<!--Thumbnail-->
{if isset($hType) && isset($vType) && $hType && $vType}
<a  class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{include file="$spath/general/stdimage.tpl" item=$item usepriority="10" alt="" class="thumbs"}</a>
{elseif isset($hType) && $hType }<a  class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="highres" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{include file="$spath/general/stdimage.tpl" item=$item usepriority="10" alt="" class="thumbs"}</a>
{elseif isset($vType) && $vType }<a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{include file="$spath/general/stdimage.tpl" item=$item usepriority="10" alt="" class="thumbs"}</a>
{else}<a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type=$item.PreviewXML.content.types.type_attr[0].type id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{include file="$spath/general/stdimage.tpl" item=$item usepriority="10" alt="" class="thumbs"}</a>
{/if}



<td valign="top" align="left">

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
{foreach from=$item.PreviewXML.content.types.type_attr item="type"}
{if $type.type == 'highres' && !isset($highres)}{assign var="highres" value=$type.num}{/if}
{if $type.type == 'vids' && !isset($vids)}{assign var="vids" value=$type.num}{/if}
{/foreach}

{if isset($vids)}


{assign var="length" value="0"}
{** Get Movie Length **}
{foreach from=$item.PreviewXML.content.names.name_attr item="itemN"}
{if isset($itemN.movie_length)}
	{math assign="length" equation="max(a,b)" a=$length b=$itemN.movie_length}
{/if}
{/foreach}
{/if}


{if isset($highres) && isset($vids)}{$highres} {$templateconf.txtphotos} {include file="$spath/general/display_movielength.tpl" length=$length} {$templateconf.txtofvideo}
{elseif isset($highres)}{$highres} {$templateconf.txtphotos}{elseif isset($vids) && isset($length)}{include file="$spath/general/display_movielength.tpl" length=$length} {$templateconf.txtofvideo}
{/if}


</span>


<br />




<table cellspacing="0" cellpadding="0">
<tr><td>
<!--Date-->
<span class="date">{$templateconf.txtadded} {$item.DateDisplay[0]}</span>
</td>
<td><!--Rating-->
{if $item.plg_ratings_rank[0] && $item.plg_ratings_total[0] }
{if ($item.plg_ratings_total[0])==0 } {assign var="el2" value=10}{else} {assign var="el2" value=$item.plg_ratings_total[0]} {/if}
{math equation ="((el1/el2)*10)" el1=$item.plg_ratings_rank[0] el2=$el2 assign=rating}{else}{assign var="rating" value=10}
{/if}{include file="$spath/general/votefrm_model.tpl" rating=$rating hover=0 }
</td>
<td class="small_text">
&nbsp;
{if isset($item.plg_ratings_total[0])}
{$templateconf.txtaveragerating}: 
{math assign="rtng" equation="x / y * 5 " x=$item.plg_ratings_rank[0] y=$item.plg_ratings_total[0]}
{$rtng|@string_format:"%.1f"}
{/if}
</td>


</tr>
</table>

<br />

<!--Description-->
<span class="model_description">{$item.Description[0]}</span>


<br />
<br />


{assign var="lp" value="-1"}
{foreach from=$item.PreviewXML.sets.set item="itemm" name="loopCM" key=kex}
{if ($itemm.Id[0]!=$root.page.models.model.Id[0])}
 {assign var="lp" value="$kex"}
{/if}
{/foreach}

{strip}
{assign var="numothermodel" value="0"}
{foreach from=$item.PreviewXML.sets.set item="itemm" name="loopCN" key="kexx"}
{if ($itemm.Id[0]!=$root.page.models.model.Id[0])}
 {assign var="numothermodel" value="1"}
{/if}
{/foreach}
{/strip}

{if $numothermodel == "1"}
<span class="subtitle">{$templateconf.txtfeaturedmodels}</span> 
{foreach from=$item.PreviewXML.sets.set item="itemm" name="loopCN" key="kexx"}
{if ($itemm.Id[0]!=$root.page.models.model.Id[0])}
<a class="model_category_link" href="{include file="$spath/general/pg_sets.tpl" id=$itemm.Id[0] seoname=$itemm.SEOname[0] item=$itemm}">{$itemm.ModelName[0]}</a>
{if $lp != $kexx }, {/if}
{/if}
{/foreach}	

<br />
{/if}


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

{if $count > 0}
<span class="subtitle">{$templateconf.txtcategories}</span> 

{foreach from=$item.PreviewXML.category.item_attr item="catItem"}
{foreach from=$root.page.categories.cat item="cat1"}
{if $cat1.Title[0] == 'Tags'}
{foreach from=$cat1.cats.cat item="cat2"}

{strip}
	{if $cat2.Id[0] == $catItem.category}{assign var="count" value=$count-1}
		<a class="model_category_link" href="{include file="$spath/general/pg_category.tpl" id=$catItem.category seoname=$catItem.seoname item=$catItem}">
		{$cat2.Title[0]}
		</a>
	
		{if $count > 0},{/if}
	{/if}
{/strip}


{/foreach}
{/if}
{/foreach}
{/foreach}
{/if}

</td>
</tr></table>

{/if}
