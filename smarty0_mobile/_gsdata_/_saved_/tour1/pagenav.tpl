{assign var="onpage" value=$root.page.pages_attr[0].onpage}
{assign var="pcount" value=$root.page.pages.page|@count}


<!--Start Nav Table-->
{strip}
<table width="100%" style="padding:4px;" cellpadding="0" cellspacing="0" class="aligncenter">
<tr>
	<td align="left" width="42">
	{if $onpage != 1}
		<!--This displays the previous page image/link-->
		<a href="{include file="$spath/$tourname/pg_tour.tpl" page=$onpage-1}">
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
		<a href="{include file="$spath/$tourname/pg_tour.tpl" page=$onpage+1}">
		<img style="margin-left:4px;" src="images/icons/right_arrow.gif" /></a>
	{else}
		<a href="{$root.page.tour.JoinUrl}">
		<img style="margin-left:4px;" src="images/icons/right_arrow.gif" /></a>
	{/if}
	</td>
</tr>


</table>
{/strip}



<!--End Nav Table-->



