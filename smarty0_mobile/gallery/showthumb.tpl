{**
* This is the showthumb file - shows the indivudual thumbs from the gallery page 
* @param $item - the given thumb item
* @parm pos - the position of the tthumb
*}


{if $item}
	{** get the content thumb  for this element **}
	{foreach from=$item.Files.file_attr item="itemF" key="k" } 
		{if $itemF.name =="thumb" }
			{assign var="thumb" value=$item.Files.file[$k]}
			{if $itemF.sourcetype == $root.page.settype[0]}
				{assign var="thumbSet" value=$item.Files.file[$k]}
				{assign var="thumbSet_w" value=$item.Files.file_attr[$k].width}
				{assign var="thumbSet_h" value=$item.Files.file_attr[$k].height}
			{/if}
		{/if}
	{/foreach}

	{assign var="maxwidth" value="250"}

	{if $thumbSet_w > $maxwidth}
		{math equation="x*y/z" x=$thumbSet_h y=$maxwidth z=$thumbSet_w assign="thumbSet_h"}
		{assign var="thumbSet_w" value=$maxwidth}
	{/if}

	{foreach from=$item.Files.file_attr item="itemF" key="keyF"}
		{if $itemF.name == 'watermark' && $itemF.sourcetype ==$root.page.settype[0] && $itemF.cname == $root.page.mediatype_attr[0].value}
			{assign var="file" value=$item.Files.file[$keyF]}
		{elseif $itemF.name == 'watermark' && $itemF.sourcetype ==$root.page.settype[0] && !isset($root.page.mediatype)}
			{assign var="file" value=$item.Files.file[$keyF]}
		{elseif	$itemF.name == 'watermark'}
			{assign var="file" value=$item.Files.file[$keyF]}
		{elseif $itemF.name == 'jpg'}
			{assign var="file" value=$item.Files.file[$keyF]}
		{/if}		
	{/foreach}

	{** get the mediatype attribute **}
	{if isset($root.page.mediatype_attr[0].value) }
		{assign var ="mt" value=$root.page.mediatype_attr[0].value}
	{else}
		{assign var ="mt" value=""}
	{/if}

	{if $item.show[0] == 0}
		{$templateconf.txtcoming} {$item.DateDisplay[0]}<br>
		{if isset($thumbSet)}
			<img class="thumbs_gallery" src="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$thumbSet}" width="{$thumbSet_w}" height="{$thumbSet_h}" alt="" />
		{else}
			<img class="thumbs_gallery" src="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$thumb}" alt="" />
		{/if}
		<br>
	{else}
			{if in_array($root.page.settype[0], $root.page.movietabs.item) }
				{include file="$spath/gallery/vid-link.tpl" item=$item pos=$pos}
			{else}
			<a  				
				{if $root.page.trial}
					{if $root.page.trial.ClickPages.page[0] == $root.page.onpage[0] || $root.page.trial.ClickPages.page[0] == 0 || $root.page.trial.AllowRecent.Id[0] == $root.page.contentgroup.Id[0]}
						href="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$file}" >
					{else}
						href="{$root.page.trial.PhotoURL[0]}" >
					{/if}
				{else}	 
					 href="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$file}" >
				{/if}			
				
				{if isset($thumbSet)}
					<img class="thumbs_gallery" src="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$thumbSet}" width="{$thumbSet_w}" height="{$thumbSet_h}" alt="" />
				{else}
					<img class="thumbs_gallery" src="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$thumb}" alt="" />
				{/if}
			</a>
		{/if}
	{/if}

{else}
	&nbsp;
{/if}