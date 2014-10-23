{**
<!--This truncates the description length to the number of characters displayed-->
The Whatshot file 
The passed variable here is 
@param $item 
**}
<assign var="maxDescLength" value="'210'"/>
<table cellspacing="2" cellpadding="0" border="0">
<tr>
<td align="left" class="set-info">

{global get="showallaccesslinks" assign=showallaccesslinks}
{if $showallaccesslinks == 1}
{** Site Name **}
{include file="$spath/general/sitelink.tpl" item=$item}
<br />
{/if}


{foreach from=$item.PreviewXML.content.types.type_attr item="tmp"}
	{if $tmp.type =='highres'}	{assign var="h" value=$item.PreviewXML.element.item_attr[0].Id} {/if}
	{if $tmp.type =='vids'} {assign var="v" value=$item.PreviewXML.element.item_attr[0].Id} {/if}
{/foreach}

	{if isset($h) && isset($v)}
		<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl" type='vids' id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >

<!--Title-->
<span class="update_title">{$item.Title[0]}</span>
			{include file="$spath/general/stdimage.tpl" item=$item usepriority="10" alt="" class="thumbs"}
		</a>
	{elseif isset($h)}
		<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl"  type='highres' id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">

<!--Title-->
<span class="update_title">{$item.Title[0]}</span>
		{include file="$spath/general/stdimage.tpl" item=$item usepriority="10" alt="" class="thumbs"}
		</a>
	{elseif isset($v)}
		<a class="contentnavlink" href="{include file="$spath/general/pg_gallery.tpl" type='vids' id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">

<!--Title-->
<span class="update_title">{$item.Title[0]}</span>
		{include file="$spath/general/stdimage.tpl" item=$item usepriority="10" alt="" class="thumbs"}
		</a>
	{/if}




<!--Photo Count/Movie Length-->
<span class="update_info">

{foreach from=$item.PreviewXML.content.names.name_attr item="tmp"}
{if isset($tmp.movie_length)}
    {if !isset($l)} {assign var="l" value=0} {/if}
	{math assign="l" equation="max(a,b)" a=$l b=$tmp.movie_length}
{/if}
{/foreach}

{if isset($l)}
	{include file="$spath/general/display_movielength.tpl" length =$l }{$templateconf.txtofvideo}
{/if}</span>
</td>
</tr>
<tr>
<td align="left" class="update_description">{$item.plg_desc[0]|truncate:220}
</td>
</tr>

</table>