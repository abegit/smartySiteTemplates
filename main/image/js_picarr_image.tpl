{**
* The js_picarr image Template 
* !!Second Level Template !! - call from image.tpl
* @param $item - the current item being displayed
* @pos - the position of the item  
**}
{math equation="floor((el2-1)/el1)+1" el1=$root.page.numperpage[0] el2=$pos assign="pagenum"}

{assign var="directory" value=$root.page.contentgroup.Directory[0]}

{foreach from=$root.page.movietabs.item item="tmp"}
	{if $tmp == $root.page.settype[0] }
		{assign var="setEqualMov" value=1}
	{/if}
{/foreach}

{assign var="file" value=""}
{assign var="movie_width" value=""}
{assign var="movie_height" value=""}


{if $item.show[0] == "0"}

{elseif !isset($root.page.trial) && isset($setEqualMov) && $setEqualMov==1}
	{foreach from=$item.Files.file_attr item="itemF" key="keyF"}
		{if $itemF.name == $root.page.mediatype_attr[0].value}
			{assign var="file" value=$item.Files.file[$keyF]}
			{assign var="movie_width" value=$itemF.movie_width}
			{assign var="movie_height" value=$itemF.movie_height}
		{/if}		
	{/foreach}
		{capture name="src"}{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}{$file}{/capture}
picarr.push(["{$item.Id[0]}","{$smarty.capture.src}","{if ($movie_width!="")}{$movie_width}{else}320{/if}","{if ($movie_height!="")}{$movie_height}{else}240{/if}",'{$root.page.settype[0]}', '{$root.page.mediatype_attr[0].value}', '{$root.page.contentgroup.Id[0]}'])

	
{elseif !isset($root.page.trial) }

	{assign var="setx" value=0}
	{if $setx == 0}{foreach from=$item.Files.file_attr item="itemF" key="keyF"}

		{if $itemF.name == 'watermark' && $itemF.sourcetype ==$root.page.settype[0] && $itemF.cname == $root.page.mediatype_attr[0].value}
			{assign var="file" value=$item.Files.file[$keyF]}
			{assign var="width" value=$itemF.width}
			{assign var="height" value=$itemF.height}
			{assign var="setx" value=1}
		{/if}
	{/foreach}{/if}
	{if $setx == 0}
		{assign var="watermarkmatch" value=""}
		{foreach from=$page.watermark.item item=wmark}
			{if ($watermarkmatch == "") && ($wmark.Wtype[0] == "watermark") && ($wmark.sourceType[0] == $root.page.settype[0])}
				{assign var="watermarkmatch" value=$wmark.Name[0]}
			{/if}
		{/foreach}

		{foreach from=$item.Files.file_attr item="itemF" key="keyF"}
		{if ($watermarkmatch != "") && $itemF.name == 'watermark' && $itemF.sourcetype ==$root.page.settype[0] && $itemF.cname == $watermarkmatch}
			{assign var="file" value=$item.Files.file[$keyF]}
			{assign var="width" value=$itemF.width}
			{assign var="height" value=$itemF.height}
			{assign var="setx" value=1}
		{/if}

		{/foreach}
	{/if}

	{if $setx == 0}{foreach from=$item.Files.file_attr item="itemF" key="keyF"}
		{if $itemF.name == 'watermark' && $itemF.sourcetype ==$root.page.settype[0] && !isset($root.page.mediatype)}
			{assign var="file" value=$item.Files.file[$keyF]}
			{assign var="width" value=$itemF.width}
			{assign var="height" value=$itemF.height}
			{assign var="setx" value=1}
		{/if}
	{/foreach}{/if}
	{if $setx == 0}{foreach from=$item.Files.file_attr item="itemF" key="keyF"}
		{if $itemF.name == 'watermark' && !$itemF.sourcetype}
			{assign var="file" value=$item.Files.file[$keyF]}
			{assign var="width" value=$itemF.width}
			{assign var="height" value=$itemF.height}
			{assign var="setx" value=1}
		{/if}
	{/foreach}{/if}

	{if $setx == 0}{foreach from=$item.Files.file_attr item="itemF" key="keyF"}
		{if $itemF.name == 'jpg' && $itemF.type == $root.page.settype[0]}
			{assign var="file" value=$item.Files.file[$keyF]}
			{assign var="width" value=$itemF.width}
			{assign var="height" value=$itemF.height}
			{assign var="setx" value=1}		
		{/if}		
	{/foreach}{/if}

	{if $setx == 0}{foreach from=$item.Files.file_attr item="itemF" key="keyF"}
		{if $itemF.name == 'jpg'}
			{assign var="file" value=$item.Files.file[$keyF]}
			{assign var="width" value=$itemF.width}
			{assign var="height" value=$itemF.height}
			{assign var="setx" value=1}		
		{/if}		
	{/foreach}{/if}

		{capture name="src"}{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}{$file}{/capture}	
picarr.push(["{$item.Id[0]}","{$smarty.capture.src}","{$width}","{$height}","{$root.page.settype[0]}", "{$root.page.mediatype_attr[0].value}", "{$root.page.contentgroup.Id[0]}"])

{elseif !isset($setEqualMov) && ( in_array($pagenum, $root.page.trial.ClickPages.page) or $root.page.trial.ClickPages.page[0] == 0 or in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id) ) }


	{assign var="setx" value=0}
	{if $setx == 0}{foreach from=$item.Files.file_attr item="itemF" key="keyF"}

		{if $itemF.name == 'watermark' && $itemF.sourcetype ==$root.page.settype[0] && $itemF.cname == $root.page.mediatype_attr[0].value}
			{assign var="file" value=$item.Files.file[$keyF]}
			{assign var="width" value=$itemF.width}
			{assign var="height" value=$itemF.height}
			{assign var="setx" value=1}
		{/if}
	{/foreach}{/if}
	{if $setx == 0}
		{assign var="watermarkmatch" value=""}
		{foreach from=$page.watermark.item item=wmark}
			{if ($watermarkmatch == "") && ($wmark.Wtype[0] == "watermark") && ($wmark.sourceType[0] == $root.page.settype[0])}
				{assign var="watermarkmatch" value=$wmark.Name[0]}
			{/if}
		{/foreach}

		{foreach from=$item.Files.file_attr item="itemF" key="keyF"}
		{if ($watermarkmatch != "") && $itemF.name == 'watermark' && $itemF.sourcetype ==$root.page.settype[0] && $itemF.cname == $watermarkmatch}
			{assign var="file" value=$item.Files.file[$keyF]}
			{assign var="width" value=$itemF.width}
			{assign var="height" value=$itemF.height}
			{assign var="setx" value=1}
		{/if}

		{/foreach}
	{/if}

	{if $setx == 0}{foreach from=$item.Files.file_attr item="itemF" key="keyF"}
		{if $itemF.name == 'watermark' && $itemF.sourcetype ==$root.page.settype[0] && !isset($root.page.mediatype)}
			{assign var="file" value=$item.Files.file[$keyF]}
			{assign var="width" value=$itemF.width}
			{assign var="height" value=$itemF.height}
			{assign var="setx" value=1}
		{/if}
	{/foreach}{/if}
	{if $setx == 0}{foreach from=$item.Files.file_attr item="itemF" key="keyF"}
		{if	$itemF.name == 'watermark'}
			{assign var="file" value=$item.Files.file[$keyF]}
			{assign var="width" value=$itemF.width}
			{assign var="height" value=$itemF.height}
			{assign var="setx" value=1}
		{/if}
	{/foreach}{/if}
	{if $setx == 0}{foreach from=$item.Files.file_attr item="itemF" key="keyF"}
		{if $itemF.name == 'jpg'}
			{assign var="file" value=$item.Files.file[$keyF]}
			{assign var="width" value=$itemF.width}
			{assign var="height" value=$itemF.height}
			{assign var="setx" value=1}
		{/if}		
	{/foreach}{/if}

		{capture name="src"}{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}{$file}{/capture}	
picarr.push(["{$item.Id[0]}","{$smarty.capture.src}","{$width}","{$height}","{$root.page.settype[0]}", "{$root.page.mediatype_attr[0].value}", "{$root.page.contentgroup.Id[0]}"])



{elseif  (in_array($pos, $root.page.trial.AccessClips.page) || $root.page.trial.AccessClips.page[0] ==0 || in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)) && $root.page.settype[0] == $root.page.movietabs.item[0]}
  


	{foreach from=$item.Files.file_attr item="itemF" key="keyF"}
		{if $itemF.name == $root.page.mediatype_attr[0].value}
			{assign var="file" value=$item.Files.file[$keyF]}
			{assign var="movie_width" value=$itemF.movie_width}
			{assign var="movie_height" value=$itemF.movie_height}
		{/if}		
	{/foreach}
		{capture name="src"}{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}{$file}{/capture}
picarr.push(["{$item.Id[0]}","{$smarty.capture.src}","{if ($movie_width!="")}{$movie_width}{else}320{/if}","{if ($movie_height!="")}{$movie_height}{else}240{/if}",'{$root.page.settype[0]}', '{$root.page.mediatype_attr[0].value}', '{$root.page.contentgroup.Id[0]}'])
	
{else}
picarr.push(["{$item.Id[0]}", "#trial#"])
{/if}