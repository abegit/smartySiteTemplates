{if !isset($pos)} {assign var="pos" value=0} {/if}
{if !isset($fpos)} {assign var="fpos" value=0} {/if}

{foreach from=$item.Files.file_attr item="tmp"}
	{if $tmp.name == $type.Name[0] }
		{assign var="c" value=1}
	{/if}
{/foreach}

{assign var="width" value="640"}
{assign var="height" value="480"}

{if isset($c) && ($type.ShowPlay[0] == 1)}
	{foreach from=$item.Files.file_attr item="tmp" key="k"}
	{if ($tmp.name == $type.Name[0])}
		{assign var="file" value=$item.Files.file[$k]}
		
		{if $tmp.movie_width}
			{assign var="width" value=$tmp.movie_width}
		{/if}

		{if $tmp.movie_height}
			{assign var="height" value=$tmp.movie_height}
		{/if}
	{/if}
	{/foreach}

<tr class="playrow">
<td align="left">
	{$type.Label[0]}
</td>
<td align="right">

	<a

	{if !isset($root.page.trial)}		
		href="javascript:playmovie('{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$file}','',1, 1, {$width}, {$height})"
	{elseif in_array($pos, $root.page.trial.AccessClips.page) or ($root.page.trial.AccessClips.page[0] == 0) or ($root.page.trial.AllowRecent.Id[0] == $root.page.contentgroup.Id[0])}		
		href="javascript:playmovie('{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$file}','',1, 1, {$width}, {$height})"
	{else}
		href="{$root.page.trial.VideoURL[0]}"
	{/if} >
	{$templateconf.txtplay}</a>
</td>
</tr>


{/if}

{if isset($c) && ($type.ShowDownload[0] == 1) && ($type.ShowPlay[0] == 1) }
{/if}

{if isset($c) && ($type.ShowDownload[0] == 1)}
	{foreach from=$item.Files.file_attr item="tmp" key="k"}
	{if ($tmp.name == $type.Name[0])} {assign var="file" value=$item.Files.file[$k]} {/if}
	{/foreach}

<tr>
<td align="left">
	{$type.Label[0]}
</td>
<td align="right">

	<a

	{if !isset($root.page.trial)}		
		href="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$file}"
	{elseif in_array($pos, $root.page.trial.AccessClips.page) or ($root.page.trial.AccessClips.page[0] == 0) or ($root.page.trial.AllowRecent.Id[0] == $root.page.contentgroup.Id[0])}		
		href="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$file}"
	{else}
		href="{$root.page.trial.VideoURL[0]}"
	{/if} >
	{$templateconf.txtdownload}</a>
</td>
</tr>


{/if}