{**
@param rating
@param pos
**}
{global get="image_folder" assign="image_folder"}
{math equation="el/2" el=$rating assign=p2}
<td>
{if $rating == ((($pos - 1) * 2) + 1)}
	<img alt="Average Rating: {$p2}" id="vote_{$pos}" src="{$image_folder}/icons/star-half.png" align="absmiddle" border="0" height="18" width="18" />
{elseif $rating < ($pos*2)}
	<img alt="Average Rating: {$p2}" id="vote_{$pos}" src="{$image_folder}/icons/star-faded.png" align="absmiddle" border="0" height="18" width="18" />
{else}
	<img alt="Average Rating: {$p2}" id="vote_{$pos}" src="{$image_folder}/icons/star.png" align="absmiddle" border="0" height="18" width="18" />
{/if}
</td>
