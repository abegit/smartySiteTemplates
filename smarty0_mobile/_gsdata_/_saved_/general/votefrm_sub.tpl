{**
@param rating
@param pos
@param id
@param hover
**}

{math assign="pos2" el=$pos equation="el*2"}
<a
{if $hover == 1}
	onmouseover="changevote2({$pos2})"
	onmouseout="changevote2({$rating})"
	href="javascript:dovote({$pos2},{$id},'{$root.page.settype[0]}')"
{/if}
>

{math assign="r2" el=$rating equation="el/2"}
{if $rating == ((($pos - 1) * 2) + 1)}<img alt="Average Rating: {$r2}" src="{#imagedir#}/icons/star-half.png" height="18" width="18"/>{elseif $rating < ($pos2)}<img alt="Average Rating: {$r2}" src="{#imagedir#}/icons/star-faded.png" class="absmiddle" height="18" width="18"/>{else}<img alt="Average Rating: {$r2}" src="{#imagedir#}/icons/star.png" class="absmiddle" height="18" width="18"/>
{/if}

</a>
