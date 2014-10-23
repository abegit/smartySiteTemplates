{assign var="directory" value=$root.page.contentgroup.Directory[0]}

{** get the content thumb  for this element **}
{foreach from=$item.Files.file_attr item="itemF" key="k" } 
	{if $itemF.name =="thumb" }
		{assign var="thumb" value=$item.Files.file[$k]}
		{if $itemF.sourcetype == $root.page.settype[0]}
			{assign var="thumbSet" value=$item.Files.file[$k]}
			{if isset($item.Files.file_attr[$k].width)} {assign var="thumbSet_w" value=$item.Files.file_attr[$k].width}{/if}
			{if isset($item.Files.file_attr[$k].height)}{assign var="thumbSet_h" value=$item.Files.file_attr[$k].height}{/if}
		{/if}

		{if $itemF.cname == 'Video Thumbnails' }
			{assign var="vidSet" value=$item.Files.file[$k]}
			{if isset($item.Files.file_attr[$k].width) }{assign var="vidSet_w" value=$item.Files.file_attr[$k].width}{/if}
			{if isset($item.Files.file_attr[$k].height)}{assign var="vidSet_h" value=$item.Files.file_attr[$k].height}{/if}
		{/if}
	{/if}
	{if $itemF.type == $root.page.settype[0] && !isset($ml)}
		{assign var="ml" value=$itemF.movie_length}
	{/if}
{/foreach}

<!--Start Clip Item-->


<!--This displays a thumbnail pulled from the /vidthumbs/ folder to represent the clip-->
{$templateconf.txtlength} {include file="$spath/general/display_movielength.tpl" length=$ml}<br />
<img alt="" class="thumbs_gallery" {if isset($thumbSet) }
	src="{#contentdir#}/upload/{$directory}{$thumbSet}" width="{$thumbSet_w}" height="{$thumbSet_h}"
{else}
	src="{#contentdir#}/upload/{$directory}{$vidSet}" width="{$vidSet_w}" height="{$vidSet_h}"
{/if} />

<!--The following displays the movie length-->

<!--The following statement displays a video link only if a file is present that matches the media type specified-->

{if $item.show[0] == 1}
	<!-- VIDEO -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">

	{foreach from=$root.page.contenttypesub.type item="itemSub" key=k}
		{if $itemSub.Type[0]==$root.page.settype[0] && $itemSub.FullVideo[0] ==0 && ($itemSub.ShowPlay[0] == 1 || $itemSub.ShowDownload[0]==1)} 
			{foreach from=$item.Files.file_attr item="fName"}
				{if $fName.name == $itemSub.Name[0]}
					{include file="$spath/gallery/gallery_showlink.tpl" type=$itemSub pos=$pos fpos =$k item=$item}
				{/if}
	
			{/foreach}
		{/if}

	{/foreach}
</table>

{if isset($ml)}
 
  
{/if}


	<!--  VIDEO -->
<!--The following statement displays the update date of the next clip in the sequence if you have scheduled individual clips to appear on different dates-->
{else}
	
<br />

	{$templateconf.txtcoming} {$item.DateDisplay[0]}
	
{/if}

<br />

<!--End Clip Item-->