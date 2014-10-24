{**
* Page image file - creates the link for page image 
* @param $type - the type of image
* @param $id - the image id
* @param $cg 
* @param $mt
* @param $pt
*}
{strip}
image.php?{if $id}id={$id}&amp;{/if}{if $type}type={$type}{/if}&amp;{if $cg}cg={$cg}{/if}&amp;{if $mt}mt={$mt}{/if}
{/strip}