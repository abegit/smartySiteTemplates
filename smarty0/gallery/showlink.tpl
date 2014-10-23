{**
* This page shows the movie links to a particular image
* @param $item
* @param $type
* @param $pos default=0
* @param $fpos default =0
**}


	{if !isset($pos)} {assign var="pos" value=0} {/if}
	{if !isset($fpos)} {assign var="fpos" value=0} {/if}
	
	{foreach from=$item.Files.file_attr item="tmp"}
		{if $tmp.name == $type.Name[0] }
			{assign var="c" value=1}
		{/if}
	{/foreach}
	
	
	{if isset($c)}
	<tr {if ($fpos % 2) == 1} bgcolor="FFFFFF" {/if} {if ($fpos % 2) == 0} bgcolor="#e8e8e8" {/if} >
	
	<td align="left" class="clip_options_title">{$type.Label[0]}</td>
	<td align="left" class="plaintext">
	{if $type.ShowPlay[0] == 1 || $type.ShowPlay[0] == 2}
		{capture name="surl"}return jsgallery('{$root.page.contentgroup.Id[0]}', '{$item.Id[0]}', '{$root.page.content.item[0].Id[0]}', '{$root.page.settype[0]}', '{$type.Name[0]}'){/capture}
	<a class="vid-link" 
		onclick="{include file="$spath/gallery/gallery_trial_js_movie.tpl" type=$root.page.settype[0] id=$item.Id[0] cg=$root.page.contentgroup.Id[0] mt=$type.Name[0] pos=$pos surl=$smarty.capture.surl}"
		href="{include file="$spath/gallery/trial_pg_image.tpl" type=$root.page.settype[0] id=$item.Id[0] cg=$root.page.contentgroup.Id[0] mt=$type.Name[0] pos=$pos}">
		{$templateconf.txtplay}</a>
	{/if}
	</td>
	<td align="left" class="clip_options_title">
	{if $type.ShowDownload[0] == 1 || $type.ShowDownload[0] == 2}
	<a class="vid-link"
		{**Get the file**}
		{foreach from=$item.Files.file_attr item="tmp" key="k"}
		{if $tmp.name == $type.Name[0] && !isset($file)} {assign var="file" value=$item.Files.file[$k]} {/if}
		{/foreach}

		{if !isset($root.page.trial)}			
			href="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$file}"
			onclick="return TrackDownload('{$item.Id[0]}','{$root.page.contentgroup.Id[0]}','{$root.page.settype[0]}','{$type.Name[0]}')"
		{elseif $type.ShowDownload[0] == 1 && in_array($pos, $root.page.trial.AccessClips.page) or ($root.page.trial.AccessClips.page[0] == 0) or in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)}
			href="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$file}"
			onclick="return TrackDownload('{$item.Id[0]}','{$root.page.contentgroup.Id[0]}','{$root.page.settype[0]}','{$type.Name[0]}')"
		{elseif $type.ShowDownload[0] == 2 &&  in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)}
			href="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$file}"
			onclick="return TrackDownload('{$item.Id[0]}','{$root.page.contentgroup.Id[0]}','{$root.page.settype[0]}','{$type.Name[0]}')"
		{else}
			href="{$root.page.trial.VideoURL[0]}"
		{/if} 
	>
		{$templateconf.txtdownload}</a>
	{/if}
	
	</td>
	
	</tr>
	{/if}
