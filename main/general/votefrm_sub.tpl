{global get="image_folder" assign="image_folder"}
{math assign="pos2" el=$pos equation="el*2"}
<a
{if $hover == 1}
	onmouseover="changevote({$pos2})"
	onmouseout="changevote({$rating})"
	href="javascript:dovote({$pos2},{$id},'{$root.page.settype[0]}')"
{/if}
>

{math assign="r2" el=$rating equation="el/2"}
{if $rating == ((($pos - 1) * 2) + 1)}
<img alt="Average Rating: {$r2}" id="vote_{$pos}" src="{$image_folder}/icons/star-half.png" align="absmiddle" border="0" height="18" width="18"/>
{elseif $rating < ($pos2)}
<img alt="Average Rating: {$r2}" id="vote_{$pos}" src="{$image_folder}/icons/star-faded.png" align="absmiddle" border="0" height="18" width="18"/>
{else}
<img alt="Average Rating: {$r2}" id="vote_{$pos}" src="{$image_folder}/icons/star.png" align="absmiddle" border="0" height="18" width="18"/>
{/if}

</a>
