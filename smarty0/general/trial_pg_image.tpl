{**
* Displays the link to a trial page image
* @param $id - the id of the image set
* @param $pos - the position of the inage within the image sets 
*}
{if $id}
{** Get the position of the item **}
{foreach from=$root.page.content.item item="tmpItem"}
	{if $tmpItem.Id[0] == $id }
		{assign var="pos" value=$tmpItem.position[0]} 
	{/if}
{/foreach}


{math equation="floor((el2-1)/el1)+1" el1=$root.page.numperpage[0] el2=$pos assign="pagenum"}

{**<!-- If we're in a members area, not a trial area -->**}
{if !isset($root.page.trial)}
	{include file="$spath/general/pg_image.tpl" type=$root.page.settype[0] id=$id cg=$root.page.contentgroup.Id[0] mt=$root.page.mediatype_attr[0].value}
{**<!-- If we're in trial on a highres page, and are going to an allowed page -->**}
{elseif ($root.page.trial.ClickPages.page[0] == $pagenum || $root.page.trial.ClickPages.page==0 || in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)) and ($root.page.settype[0] == 'highres')}	
	{include file="$spath/general/pg_image.tpl" type=$root.page.settype[0] id=$id cg=$root.page.contentgroup.Id[0] mt=$root.page.mediatype_attr[0].value}
{**<!-- If we're in trial on a vids page, and are going to an allowed page -->**}	
{elseif ($root.page.trial.AccessClips.page[0] == $pos || $root.page.trial.AccessClips.page ==0 || in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)) and $root.page.settype[0] == $root.page.movietabs.item[0]}
	{include file="$spath/general/pg_image.tpl" type=$root.page.settype[0] id=$id cg=$root.page.contentgroup.Id[0] mt=$root.page.mediatype_attr[0].value}
{**<!-- Show error URL for videos -->**}
{elseif $root.page.settype[0] == $root.page.movietabs.item[0]}
	{$root.page.trial.VideoURL[0]}
{**<!-- Show error URL for photos -->**}
{elseif $root.page.settype[0] =='highres'}
	{$root.page.trial.PhotoURL[0]}	
{/if}

{/if}