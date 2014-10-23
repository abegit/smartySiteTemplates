{**
* Page image file - creates the link for page image 
* @param $type - the type of image
* @param $id - the image id
* @param $cg 
* @param $mt 
*}
{if $root.page_attr.static == 1}
	{if $id}
		image-{$id}{if $type}-{$type}{/if}{if $mt}-{$mt}{/if}.html
	{else}
		image{if $cg}-cg-{$cg}{/if}{if $mt}-{$mt}{/if}.html
	{/if}
{else}
	image.php?{if $id}id={$id}&amp;{/if}{if $type}type={$type}{/if}&amp;{if $cg}cg={$cg}{/if}&amp;{if $mt}mt={$mt}{/if}
{/if}