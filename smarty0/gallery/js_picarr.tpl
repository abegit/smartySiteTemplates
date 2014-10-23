{**
* @param $item - the item that is being passed
* @pos - the position (index) of the item in the array 
* @param $fullplayName - the full play video type 
*}
{strip}
{math equation="floor((el1-1)/el2)+1" el1=$pos el2=$root.page.numperpage[0] assign="pagenum"}

{assign var="directory" value=$root.page.contentgroup.Directory[0]}

{capture assign="cdir"}{#contentdir#}/upload/{/capture}

{if !(isset($root.page.trial) && $root.page.settype[0] == $root.page.movietabls.item[0])}

{assign var="h" value=240}
{assign var="w" value=320}
{assign var="file" value=""}
{assign var="thumbfile" value=""}
{assign var="vtt_file" value=""}

{foreach from =$item.Files.file_attr item="fattr" key="fattrK"}
{if $fattr.name==$fullplayName}
	{if !$file}
		{capture assign="file"}{$cdir}/{$root.page.contentgroup.Directory[0]}/{$item.Files.file[$fattrK]}{/capture}
	{/if}
	{if isset($fattr.movie_width)}
		{assign var="w" value=$fattr.movie_width}
	{/if}
	{if isset($fattr.movie_height)}
		{assign var="h" value=$fattr.movie_height}
	{/if}
	{if isset($fattr.vtt_file)}
		{capture assign="vtt_file"}{$cdir}/{$root.page.contentgroup.Directory[0]}/{$vtt_file}{$fattr.vtt_file}{/capture}
	{/if}
{/if}
{if $fattr.cname == "Video Thumbnails"}
	{capture assign="thumbfile"}{$cdir}/{$root.page.contentgroup.Directory[0]}/{$item.Files.file[$fattrK]}{/capture}
{/if}

{/foreach}

picarr.push(["{$item.Id[0]}", "{$file}",'{$w}','{$h}','{$root.page.settype[0]}', '{$fullplayType}', '{$root.page.contentgroup.Id[0]}', '{$label}', '{$thumbfile}', '{$vtt_file}']);
{/if}
{/strip}
