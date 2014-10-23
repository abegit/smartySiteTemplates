{**
* Shows the indivudual thumbs from the gallery page 
* @param $item - the given thumb item
* @parm pos - the position of the tthumb
*}

{if $item}
	{capture assign="cdir"}{#contentdir#}/upload/{/capture}

	{assign var="thumbSet_w" value=""}
	{assign var="thumbSet_h" value=""}

	{assign var="thumb_w" value=""}
	{assign var="thumb_h" value=""}


	{** {$item.Id[0]}asd **}
	{** get the content thumb  for this element **}
	{foreach from=$item.Files.file_attr item="itemF" key="k" } 
		{if $itemF.name =="thumb" }
			{assign var="thumb" value=$item.Files.file[$k]}
			{assign var="thumb_w" value=$itemF.width}
			{assign var="thumb_h" value=$itemF.height}

			{if $itemF.sourcetype == $root.page.settype[0]}
				{assign var="thumbSet" value=$item.Files.file[$k]}
				{assign var="thumbSet_w" value=$itemF.width}
				{assign var="thumbSet_h" value=$itemF.height}
			{/if}
		{/if}
	{/foreach}


	{** get the mediatype attribute **}
	{if isset($root.page.mediatype_attr[0].value) }
		{assign var ="mt" value=$root.page.mediatype_attr[0].value}
	{else}
		{** Basically try and get the first matching watermark that exists for this set **}
		{assign var="mt" value=""}
		{assign var="wname" value="0"}
		{foreach from=$root.page.watermark.item item=witem}
			{if ($witem.Wtype[0] == "watermark") && ($wname == 0) && ($witem.sourceType[0] == $root.page.settype[0])}
			
				{foreach from=$root.page.contentgroup.PreviewXML.content.watermarks.name_attr item=wattr}
					{if $wattr.name == $witem.Name[0]}
						{assign var="wname" value="1"}
						{assign var="mt" value=$witem.Name[0]}
					{/if}
				{/foreach}
			{/if}
		{/foreach}
	{/if}

	{if $item.show[0] == 0}
			<img class="thumbs-gallery"
			{if $thumb_w}width= "{$thumb_w}"{/if}
			{if $thumb_h}height="{$thumb_h}"{/if}
			src="{$cdir}/{$root.page.contentgroup.Directory[0]}/{$thumb}" />
			<br />
			{$templateconf.txtcoming}{$item.DateDisplay[0]}
	{else}
		{assign var="go" value=0}
		{foreach from=$root.page.movietabs.item item="mtab" key="k"} 
			{if $root.page.settype[0]==$mtab } {assign var="go" value=1} {/if}
		{/foreach}

			{if $go == 1}
				{include file="$spath/gallery/vid-link.tpl" item=$item pos=$pos}
			{else}
			<a  
				{if $root.page.trial}
							{if in_array($root.page.onpage[0], $root.page.trial.ClickPages.page) || $root.page.trial.ClickPages.page[0] == 0 ||	in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)}					
								onclick="return jsgallery('{$root.page.contentgroup.Id[0]}', '{$item.Id[0]}', '{$root.page.content.item[0].Id[0]}', '{$root.page.settype[0]}', '{$mt}')"
							{/if}
				{else}
						 onclick="return jsgallery('{$root.page.contentgroup.Id[0]}', '{$item.Id[0]}', '{$root.page.content.item[0].Id[0]}', '{$root.page.settype[0]}', '{$mt}')"
				{/if}
				
				{if $root.page.trial}
					{if in_array($root.page.onpage[0], $root.page.trial.ClickPages.page) || $root.page.trial.ClickPages.page[0] == 0 || in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)}
						href="{include file="$spath/general/pg_image.tpl" type=$root.page.settype[0] id=$item.Id[0] cg=$root.page.contentgroup.Id[0] mt=$mt}" >
					{else}
						href="{$root.page.trial.PhotoURL[0]}" >
					{/if}
				{else}	 
					 href="{include file="$spath/general/pg_image.tpl" type=$root.page.settype[0] id=$item.Id[0] cg=$root.page.contentgroup.Id[0] mt=$mt}" >
				{/if}			
				
				{if isset($thumbSet)}
					<img class="thumbs-gallery" 
					{if $thumbSet_w}width= "{$thumbSet_w}"{/if}
					{if $thumbSet_h}height="{$thumbSet_h}"{/if}
					src="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$thumbSet}" />
				{else}
					<img class="thumbs-gallery" 
					{if $thumb_w}width= "{$thumb_w}"{/if}
					{if $thumb_h}height="{$thumb_h}"{/if}
					src="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$thumb}" />
				{/if}
			</a>
			{/if}
	{/if}

{else}
	&nbsp;
{/if}
