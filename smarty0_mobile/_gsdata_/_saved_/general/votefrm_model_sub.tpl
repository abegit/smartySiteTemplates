{**
*  Vote For Model Sub Element 
* 	@param $rating 
*	@param pos 
*	@param id
*	@param hover
*}
{if $rating==''}
	{assign var="rating" value=0} {/if}




{math equation="$rating/2" el=$rating  assign=tmp2}{if  $rating == (($pos - 1) * 2)+1}<img style="display:in" alt="Average Rating: {$tmp2}" src="{#imagedir#}/icons/star-half.png" class="absmiddle" height="18" width="18"/>{elseif $rating < ($pos*2) }<img alt="Average Rating: {$tmp2}" src="{#imagedir#}/icons/star-faded.png" class="absmiddle" height="18" width="18"/>{else}<img alt="Average Rating: {$tmp2}" src="{#imagedir#}/icons/star.png" class="absmiddle" height="18" width="18"/>{/if}
