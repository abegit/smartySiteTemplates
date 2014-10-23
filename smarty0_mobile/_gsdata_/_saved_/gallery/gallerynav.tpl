{assign var="onpage" value=$root.page.onpage[0]}
{assign var="pcount" value=$root.page.pages.page|@count}

{assign var=cg value=$root.page.contentgroup}

<!--Start Nav Table-->
{strip}
<table width="100%" style="padding:4px;" cellpadding="0" cellspacing="0" class="aligncenter">
<tr>
	<td align="left" width="42">
	{if $onpage != 1}
		<!--This displays the previous page image/link-->
		{assign var="prev" value=$root.page.onpage[0]-1}
		
		<a {if ($root.page.trial.AccessPages.page[0] == $root.page.onpage[0] - 1) || ($root.page.trial.AccessPages.page[0] == 0) 
				|| ($root.page.trial.AllowRecent.Id[0] == $root.page.contentgroup.Id[0]) || !isset($root.page.trial)}
				href="{include file="$spath/general/pg_gallery.tpl" id=$root.page.contentgroup.Id[0] type=$root.page.settype[0] page=$prev seoname=$cg.SEOname[0] item=$cg}"	
			{elseif $root.page.settype[0] == 'highres'}
				 href="{$root.page.trial.PhotoURL}"
			{else}
				 href="{$root.page.trial.VideoURL[0]}"
			{/if}>
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
		{assign var="next" value=$root.page.onpage[0]+1}
		<a class="pagenav-link1" {if ($root.page.trial.AccessPages.page[0] == $root.page.onpage[0] + 1) || ($root.page.trial.AccessPages.page[0] == 0) || ($root.page.trial.AllowRecent.Id[0] == $root.page.contentgroup.Id[0]) || !isset($root.page.trial)}
		
			href="{include file="$spath/general/pg_gallery.tpl" id=$root.page.contentgroup.Id[0] type=$root.page.settype[0] page=$next seoname=$cg.SEOname[0] item=$cg}"	
		
		
		{elseif $root.page.settype[0] == 'highres'}
			 href="{$root.page.trial.PhotoURL}"
		{else}
			 href="{$root.page.trial.VideoURL[0]}"
		
		{/if}>
		<img style="margin-left:4px;" src="images/icons/right_arrow.gif" /></a>
	{else}
	 <div style="width:37px;height:37px;" class="page_nav"></div>
	{/if}
	</td>
</tr>


</table>
{/strip}
	
<!--End Nav Table-->
