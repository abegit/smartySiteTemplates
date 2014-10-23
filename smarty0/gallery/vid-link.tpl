{**
* This is the  Movie gallery table vid-link file
* @param $item - the display item 
* @param $pos - the position of the item 
*}
{assign var="directory" value=$root.page.contentgroup.Directory[0]}

{capture assign="cdir"}{#contentdir#}/upload/{/capture}

{assign var="thumbSet_w" value=""}
{assign var="thumbSet_h" value=""}

{assign var="vidSet_w" value=""}
{assign var="vidSet_h" value=""}


{** get the content thumb  for this element **}
{foreach from=$item.Files.file_attr item="itemF" key="k" }
	{if $itemF.name =="thumb" }
		{assign var="thumb" value=$item.Files.file[$k]}
		{if $itemF.sourcetype == $root.page.settype[0]}
			{assign var="thumbSet" value=$item.Files.file[$k]}
			{assign var="thumbSet_w" value=$itemF.width}
			{assign var="thumbSet_h" value=$itemF.height}
		{/if}

		{if $itemF.cname == 'Video Thumbnails' }
			{assign var="vidSet" value=$item.Files.file[$k]}
			{assign var="vidSet_w" value=$itemF.width}
			{assign var="vidSet_h" value=$itemF.height}
		{/if}
	{/if}
	{if $itemF.type == $root.page.settype[0] && !isset($ml)}
		{assign var="ml" value=$itemF.movie_length}
	{/if}
{/foreach}

<!--Start Clip Item-->
<table width="100%" align="center" cellspacing="0" cellpadding="2" border="0">
<tr>
<td colspan="3" align="center" bgcolor="#FFFFFF" valign="top">

<!--This displays a thumbnail pulled from the /vidthumbs/ folder to represent the clip-->


{foreach from=$root.page.contenttypesub.type item="itemSub" key=k}
	{if $itemSub.Type[0]==$root.page.settype[0] && $itemSub.FullVideo[0] ==0 && ($itemSub.ShowPlay[0] == 1)}
		{foreach from=$item.Files.file_attr item="fName"}
			{if $fName.name == $itemSub.Name[0]}

			{if (substr_count($itemSub.Name[0],'flv') || substr_count($itemSub.Name[0],'flash') || substr_count($itemSub.Name[0],'mp4') ) && !isset($fullplayItem)}
 				{assign var="fullplayItem" value=$fName}
 				{assign var="fullplayType" value=$itemSub}
			{/if}

			{/if}
		{/foreach}
	{/if}
{/foreach}

{if isset($fullplayItem)}

	{capture name="surl"}return jsgallery('{$root.page.contentgroup.Id[0]}', '{$item.Id[0]}', '{$item.Id[0]}', '{$root.page.settype[0]}', '{$fullplayItem.name}'){/capture}
	<a class="vid-link" 
	onclick="{include file="$spath/gallery/gallery_trial_js_movie.tpl" type=$fullplayItem.type id=$item.Id[0] cg=$root.page.contentgroup.Id[0] mt=$fullplayItem.name pos=$pos surl=$smarty.capture.surl}"
	href="{include file="$spath/gallery/trial_pg_image.tpl" type=$fullplayItem.type id=$item.Id[0] cg=$root.page.contentgroup.Id[0] mt=$fullplayItem.name pos=$pos}">

{/if}


<img class="thumbs"
{if isset($thumbSet) }
	src="{$cdir}/{$directory}{$thumbSet}"
	{if $thumbSet_w}width= "{$thumbSet_w}"{/if}
	{if $thumbSet_h}height="{$thumbSet_h}"{/if}
{else}
	src="{$cdir}/{$directory}{$vidSet}" 
	{if $vidSet_w}width= "{$vidSet_w}"{/if}
	{if $vidSet_h}height="{$vidSet_h}"{/if}
{/if} />

{if isset($fullplayItem)}
</a>
{/if}

</td>
</tr>

<!--The following displays the movie length-->
{if $item.show[0] == 1}
{if isset($ml)}
	<tr bgcolor="#E8E8E8">    				
	<td colspan="3" class="update_info">{include file="$spath/general/display_movielength.tpl" length =$ml}</td>
	</tr>
{/if}

<tr>
<td align="left" class="clip_options_heading">{$templateconf.txtformat}</td>
<td align="left" colspan="2" class="clip_options_heading">{$templateconf.txtdelivery}</td>
</tr>

<!--The following statement displays a video link only if a file is present that matches the media type specified-->

{assign var="fcnt" value="0"}

{foreach from=$root.page.contenttypesub.type item="itemSub" key=k}
	{if $itemSub.Type[0]==$root.page.settype[0] && $itemSub.FullVideo[0] ==0 && ($itemSub.ShowPlay[0] == 1 || $itemSub.ShowDownload[0]==1 || $itemSub.ShowPlay[0] == 2 || $itemSub.ShowDownload[0]==2)} 
		{foreach from=$item.Files.file_attr item="fName"}
			{if $fName.name == $itemSub.Name[0]}
				{include file="$spath/gallery/showlink.tpl" type=$itemSub pos=$pos fpos=$fcnt item=$item}
				{assign var="fcnt" value=$fcnt+1}
			{/if}
		{/foreach}
	{/if}
{/foreach}
	
<!--The following statement displays the update date of the next clip in the sequence if you have scheduled individual clips to appear on different dates-->
{else}
	<tr>
	<td colspan="3">
	{$templateconf.txtcoming} {$item.DateDisplay[0]}
	</td>
	</tr>
{/if}

</table>
<!--End Clip Item-->