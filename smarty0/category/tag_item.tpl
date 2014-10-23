{strip}
{if isset($item) && $item!=""}

{assign var="cdir" value=#contentdir#}

<table cellspacing="2" cellpadding="0" border="0">
<tr>
	<td colspan="2" align="left">
	
		<br />
		<!--Title-->
		<span class="update_title">
		  <a class="model_title" href="{include file="$spath/general/pg_category.tpl" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{$item.Title[0]}</a>
		</span>
		
		<br />
		
		<!--Thumbnail-->		
		<a class="model_title"   href="{include file="$spath/general/pg_category.tpl" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}" >
		{include file="$spath/general/stdcatimage.tpl" item=$item usepriority="50" alt="" class="thumbs"}
		</a>
	
	</td>
</tr>
</table>



{else}&nbsp

{/if}
{/strip}