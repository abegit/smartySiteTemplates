{**
* This is the js_picarr file 
* @param $item - the item that is being passed
* @pos - the position (index) of the item in the array 
* @param $fullplayName - the full play video type 
*}

{math equation="floor((el1-1)/el2)+1" el1=$pos el2=$root.page.numperpage[0] assign="pagenum"}
{assign var="directory" value=$root.page.contentgroup.Directory[0]}


{if !(isset($root.page.trial) && $root.page.settype[0] == $root.page.movietabls.item[0])}
{assign var="h" value=240}
{assign var="w" value=320}
{foreach from =$item.Files.file_attr item="fattr" key="fattrK"}
{if $fattr.name==$fullplay.Name[0]}{if !isset($file)} {assign var="file" value=$item.Files.file_[$fattrK]}{/if}{if isset($fattr.movie_width)} {assign var="w" value=$fattr.movie_width} {/if}	{if isset($fattr.movie_height)} {assign var="h" value=$fattr.movie_height} {/if}	
{/if}
{/foreach}
picarr.push(["{$item.Id[0]}", "{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$file}",{$w},{$h} ,'{$root.page.settype[0]}', '{$fullplayName}', '{$root.page.contentgroup.Id[0]}'])

{/if}