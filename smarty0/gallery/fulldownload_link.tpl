{**
* @param $type - the type of downloading 
* @param $id 
* @param $fileName - the name of the file that is going to be uploaded  
*}


{assign var="cdir" value=#contentdir#}

{foreach from=$type item="t"}
	{if substr_count($t[0],'flv') }
		{assign var="typeFLV" value="1" }
	{/if}
{/foreach}


{if isset($typeFLV) }
<div id="full_download" style="float:left;">
		<a href="{include file="$spath/general/pg_image.tpl" type=$root.page.settype[0] id=$id cg=$root.page.contentgroup.Id[0] mt=$type.Name[0]}">
{$type.Label[0]}</a>
</div>
{else}
<div id="full_download" > 
<a href="{$cdir}/upload/{$root.page.contentgroup.Directory[0]}/{$fileName}" >
{$type.Label[0]}</a>
</div>
{/if}

