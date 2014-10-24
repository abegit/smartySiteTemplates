{strip}
{if $item}
<!-- Most Popular Updates Item -->
<a href="{include file="$tourname/pg_trailer.tpl" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">
	{include file="$tourname/stdimage.tpl" width="190" height="142" item=$item class="thumbs" priority="6"}
</a>

<a class="most_popular_update_title" href="{include file="$tourname/pg_trailer.tpl" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}"
 onclick="return tlimit()"
>{$item.Title[0]}</a>

{/if}
{/strip}