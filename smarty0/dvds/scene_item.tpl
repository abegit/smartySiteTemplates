{assign var="hType" value=0}{assign var="vType" value=0}
{foreach from=$item.PreviewXML.content.types.type_attr item="itemF" key="keyF"}
{if $itemF.type == 'highres'}{assign var="hType" value=1}{if isset($itemF.num)} {assign var="numP" value=$itemF.num}{/if}{/if}
{if $itemF.type == 'vids'}{assign var="vType" value=1}{/if}
{/foreach}

<table cellspacing="2" cellpadding="2" border="0">
<tr>
<td valign="top" align="left">

	<!--Thumbnail-->
{if isset($hType) && isset($vType) && $hType && $vType}
<a  class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{include file="$spath/general/stdimage.tpl" item=$item usepriority="10" alt="" class="thumbs"}</a>
{elseif isset($hType) && $hType }<a  class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="highres" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{include file="$spath/general/stdimage.tpl" item=$item usepriority="10" alt="" class="thumbs"}</a>
{elseif isset($vType) && $vType }<a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{include file="$spath/general/stdimage.tpl" item=$item usepriority="10" alt="" class="thumbs"}</a>
{else}<a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type=$item.PreviewXML.content.types.type_attr[0].type id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{include file="$spath/general/stdimage.tpl" item=$item usepriority="10" alt="" class="thumbs"}</a>
{/if}


</td>

<td valign="top" align="left">

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


{if isset($highres) && isset($vids)}{$highres} {$templateconf.txtphotos} - {include file="$spath/general/display_movielength.tpl" length=$length} {$templateconf.txtofvideo}
{elseif isset($highres)}{$highres} {$templateconf.txtphotos}. {elseif isset($vids) && isset($length)}{include file="$spath/general/display_movielength.tpl" length=$length} {$templateconf.txtofvideo}
{/if}


</span>


<br />




<table cellspacing="0" cellpadding="0">
<tr><td>
<!--Date-->
<span class="date">{$templateconf.txtadded} {$item.DateDisplay[0]}</span>
</td>
<td><!--Rating-->
{if sizeof($root.page.ratings_attr[0].pointsrank) && sizeof($root.page.ratings_attr[0].pointstot) }
{if ($root.page.ratings_attr[0].pointstot)==0 } {assign var="el2" value=10}{else} {assign var="el2" value=$root.page.ratings_attr[0].pointstot} {/if}
{math equation ="((el1/el2)*10)" el1=$root.page.ratings_attr[0].pointsrank el2=$el2 assign=rating}{else}{assign var="rating" value=10}
{/if}{include file="$spath/general/votefrm_model.tpl" rating=$rating hover=0 }
</td>
</tr>
</table>

<br />

<!--Description-->
<span class="dvd_description">{$item.Description[0]}</span>


<br />
<br />

<span class="subtitle">{$templateconf.txtfeaturedmodels}</span> 

{foreach from=$item.PreviewXML.sets.set item="sitem" name="loopCN"}{if ($sitem.Id[0]!=$root.page.models.model.Id[0])}
<a class="model_category_link" href="{include file="$spath/general/pg_sets.tpl" id=$sitem.Id[0] seoname=$sitem.SEOname[0] item=$sitem}">{$sitem.ModelName[0]}</a>{if !$smarty.foreach.loopCN.last }, {/if}{/if}
{/foreach}	

<br />

	<span class="subtitle">{$templateconf.txtcategories}</span>

{assign var="count" value=0}
{foreach from=$item.PreviewXML.category.item_attr item=item1}
{foreach from=$categories item=item2 }
{if $item2.Title[0] == 'Tags'}
{foreach from=$item2.cats.cat item=item3}
{if $item3.Id[0] == $item1.category } 
{assign var="count" value=$count+1}
{/if}
{/foreach}
{/if}
{/foreach}
{/foreach}


{foreach from=$item.PreviewXML.category.item_attr item=item1}
{foreach from=$categories item=item2 }
{if $item2.Title[0] == 'Tags'}
{foreach from=$item2.cats.cat item=item3}
{strip}
	{if $item3.Id[0] == $item1.category }
		{assign var="count" value=$count-1}
		<a class="model_category_link" href="{include file="$spath/general/pg_category.tpl" id=$item3.Id[0] seoname=$item3.SEOname[0] item=$item3}">{$item3.Title[0]}</a>
		{if $count > 0 },&nbsp;{/if}
	{/if}
{/strip}
{/foreach}
{/if}
{/foreach}
{/foreach}



</td>
</tr></table>

<table>
<tr>
<td><a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{include file="$spath/general/stdimage.tpl" item=$item usepriority="26" alt="" class="thumbs"}</a></td>
<td><a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{include file="$spath/general/stdimage.tpl" item=$item usepriority="27" alt="" class="thumbs"}</a></td>
<td><a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{include file="$spath/general/stdimage.tpl" item=$item usepriority="28" alt="" class="thumbs"}</a></td>
<td><a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{include file="$spath/general/stdimage.tpl" item=$item usepriority="29" alt="" class="thumbs"}</a></td>
</tr><tr>
<td><a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{include file="$spath/general/stdimage.tpl" item=$item usepriority="30" alt="" class="thumbs"}</a></td>
<td><a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{include file="$spath/general/stdimage.tpl" item=$item usepriority="31" alt="" class="thumbs"}</a></td>
<td><a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{include file="$spath/general/stdimage.tpl" item=$item usepriority="32" alt="" class="thumbs"}</a></td>
<td><a class="update_title" href="{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >{include file="$spath/general/stdimage.tpl" item=$item usepriority="33" alt="" class="thumbs"}</a></td>

</tr>
</table>


