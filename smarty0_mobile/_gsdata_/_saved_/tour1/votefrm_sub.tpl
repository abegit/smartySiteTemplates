{**
@param rating
@param pos
**}

{math equation="el/2" el=$rating assign=p2}

{if $rating == ((($pos - 1) * 2) + 1)}
	<img alt="Average Rating: {$p2}" src="{#imagedir#}/icons/star-half.png" class="absmiddle" height="18" width="18" />
{elseif $rating < ($pos*2)}
	<img alt="Average Rating: {$p2}" src="{#imagedir#}/icons/star-faded.png" class="absmiddle" height="18" width="18" />
{else}
	<img alt="Average Rating: {$p2}" src="{#imagedir#}/icons/star.png" class="absmiddle" height="18" width="18" />
{/if}
