{**
* Vote For Model File 
* @param hover 1 or 0 
* @param $rating -default x
*}

{if !isset($rating)}
	{assign var="rating" value="x"}
{/if}

<!-- If the model is unrated, show 5 stars -->
	{if $rating !='x' || $rating !=0}
		{assign var="rate" value=$rating}
	{else}
	 	{assign var="rate" value=$root.page.ratings_attr[0].defaultrating}
	{/if}


<!--Start Rating Table-->
<table cellspacing="0" cellpadding="0" border="0">
<tr>
	{include file="$spath/general/votefrm_model_sub.tpl" rating=$rate pos=1 id=$root.page.models.model.Id[0] hover=$hover}
	{include file="$spath/general/votefrm_model_sub.tpl" rating=$rate pos=2 id=$root.page.models.model.Id[0] hover=$hover}
	{include file="$spath/general/votefrm_model_sub.tpl" rating=$rate pos=3 id=$root.page.models.model.Id[0] hover=$hover}
	{include file="$spath/general/votefrm_model_sub.tpl" rating=$rate pos=4 id=$root.page.models.model.Id[0] hover=$hover}
	{include file="$spath/general/votefrm_model_sub.tpl" rating=$rate pos=5 id=$root.page.models.model.Id[0] hover=$hover}
</tr>
</table>
<!--End Rating Table-->