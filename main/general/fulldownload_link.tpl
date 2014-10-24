{**
* The full download file 
* @param $type - the type of downloading 
* @param $id 
* @param $fileName - the name of the file that is going to be uploaded  
*}

{foreach from=$types.types.type_attr item="t"}
	{if $t.type=='flv'}
		{assign var="typeFLV" value="" }
	{/if}
{/foreach}


{if isset($typeFLV) }
		<a class="fulldownload-links"	href="{include file="$spath/general/pg_image.tpl" type=$root.page.settype[0] id=$id cg=$root.page.contentgroup.Id[0] mt=$type.Name[0]}">
{$templateconf.txtplay}&nbsp;{$type.Label[0]}</a>
{else}


<a class="fulldownload-links" href="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$fileName}">
{$templateconf.txtdownload}&nbsp;{$type.Label[0]}</a>

{/if}