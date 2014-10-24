{**
*  Vote For Model Sub Element 
* 	@param $rating 
*	@param pos 
*	@param id
*	@param hover
*}
{global get="image_folder" assign="image_folder"}
{if $rating==''}
	{assign var="rating" value=0} {/if}

<td>


	{if $hover==1}
		{math equation="el*2" el=$pos  assign=tmp}
		<a onmouseover="changevote2({$tmp})" onmouseout="changevote2({$rating})" href="javascript:domodelvote({$tmp},{$id})">	
	{else} <a>  {/if}


		{math equation="$rating/2" el=$rating  assign=tmp2}
		{if  $rating == (($pos - 1) * 2)+1}
			<img alt="Average Rating: {$tmp2|@string_format:"%.1f"}" title="Average Rating: {$tmp2|@string_format:"%.1f"}" id="vote_{$pos}" src="{$image_folder}/icons/star-half.png" align="absmiddle" border="0" height="18" width="18"/>
		{elseif $rating < ($pos*2) }
			<img alt="Average Rating: {$tmp2|@string_format:"%.1f"}" title="Average Rating: {$tmp2|@string_format:"%.1f"}" id="vote_{$pos}" src="{$image_folder}/icons/star-faded.png" align="absmiddle" border="0" height="18" width="18"/>
		{else}
			<img alt="Average Rating: {$tmp2|@string_format:"%.1f"}" title="Average Rating: {$tmp2|@string_format:"%.1f"}" id="vote_{$pos}" src="{$image_folder}/icons/star.png" align="absmiddle" border="0" height="18" width="18"/>
		{/if}
</a>
</td>
