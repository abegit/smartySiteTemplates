{assign var="onpage" value=$root.page.pages_attr[0].onpage}
{assign var="pcount" value=$root.page.pages.page|@count}

{assign var="cat" value=$root.page.category}


<!--Start Nav Table-->
{strip}
<table width="100%" style="padding:4px;" cellpadding="0" cellspacing="0" class="aligncenter">
<tr>
	<td align="left" width="42">
	{if $onpage != 1}
		<!--This displays the previous page image/link-->
		<a href="{include file="$spath/general/pg_category.tpl" id=$cat.Id[0] page=$onpage-1 s=$root.page.sort[0] sw=$root.page.letter[0] seoname=$cat.SEOname[0] item=$cat}">
			<img style="margin-right:4px;" src="images/icons/left_arrow.gif" />
		</a>
	{else}
	 <div style="width:37px;height:37px;" class="page_nav"></div>
	{/if}
	</td>
	<td class="page_nav aligncenter">	
		{$templateconf.txtpage} {$onpage} {$templateconf.txtof} {$pcount}
	</td>
		
	<td align="right" width="42">
	{if $onpage < $pcount}			
		<a href="{include file="$spath/general/pg_category.tpl" id=$cat.Id[0] page=$onpage+1 s=$root.page.sort[0] sw=$root.page.letter[0] seoname=$cat.SEOname[0] item=$cat}">
		<img style="margin-left:4px;" src="images/icons/right_arrow.gif" /></a>
	{else}
	 <div style="width:37px;height:37px;" class="page_nav"></div>
	{/if}
	</td>
</tr>


</table>
{/strip}



<!--End Nav Table-->



