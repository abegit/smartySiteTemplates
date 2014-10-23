
{assign var="contentid" value=$root.page.currentcontent.item[0].Id[0]}

<table align="center" cellspacing="0" cellpadding="0" border="0" style="min-width:600px;">
<tr>
	<td>
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>

{foreach from=$root.page.content.item item="itemC" key="keyC"}
	{if $itemC.Id[0] == $contentid}

		{assign var="nextEl" value=$keyC+1}
		{assign var="prevEl" value=$keyC-1}
	
		<td width="120">
		<!-- This displays the previous page image/link-->
		<!-- Node is hidden if this is the first page -->

				<table cellspacing="0" cellpadding="0" border="0" id="gal_prevpage{if $navarea=="bot"}_bot{/if}" 
				
				{if isset($root.page.content.item[$prevEl])}
					class="nav_vis" >
				{else}
					class="nav_hid" >
				{/if}
				
				<tr>
			
				<td nowrap="nowrap">
				<a class="image_nav_link" onclick="return PrevImage()" href="{include file="$spath/general/trial_pg_image.tpl" id=$root.page.content.item[$prevEl].Id[0]}" >
				
				{if $root.page.settype[0] == $root.page.movietabs.item[0]}
					
				{else}
					< {$templateconf.txtprevious}&nbsp;{$templateconf.txtPhoto}
				{/if}
				</a>
				</td>
				</tr>
				</table>
			</td>	
			<td align="center">
		
		<!--The following choose/when statements display the return to main page image/link based on the category title. In order for this to work, you must specify titles below that match your category titles exactly-->

		<a class="image_nav_link" href="{include file="$spath/general/pg_gallery.tpl" type=$root.page.settype[0] id=$root.page.contentgroup.Id[0] page=1 mt=$root.page.mediatype_attr[0].value seoname=$root.page.contentgroup.SEOname[0] item=$root.page.contentgroup}">
		{$templateconf.txtclicktoreturntomain}&nbsp;
		{if $root.page.settype[0] == $root.page.movietabs.item[0]}
			{$templateconf.txtMovies}
		{else}
			{$templateconf.txtPhotos}
		{/if}
			&nbsp;{$templateconf.txtpage}
		</a>
		</td>
		
		
		<!--This displays the next page image/link-->
		
		<td align="right" width="120">

				<table cellspacing="0" cellpadding="0" border="0" id="gal_nextpage{if $navarea=="bot"}_bot{/if}"
				{if isset($root.page.content.item[$nextEl])}
					class="nav_vis" >
				{else}
					class="nav_hid" >
				{/if}
				
				<tr>
					<td>
				
				<a class="image_nav_link" onclick="return NextImage()" href="{include file="$spath/general/trial_pg_image.tpl" id=$root.page.content.item[$nextEl].Id[0]}" >
					
				{if $root.page.settype[0] == $root.page.movietabs.item[0]}
					
				{else}
					{$templateconf.txtnext}&nbsp;{$templateconf.txtPhoto}>
				{/if}
		</a>
				</td>
			
				</tr>
				</table>
		</td>
	{/if}
{/foreach}
</tr>
</table>
	</td>
</tr>
</table>

