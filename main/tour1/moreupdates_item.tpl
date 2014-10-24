{if $item}
<div class="footer_thumbs">

<!--Title-->

<a 
{strip}
{if $page.tour.LinkThumb == "0"}
  href="{include file="$spath/$tourname/pg_tour.tpl" id=$item.Id[0] anchor='update'}"
{elseif $page.tour.LinkThumb == "1"}
  href="{include file="$tourname/pg_trailer.tpl" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}"
{elseif $page.tour.LinkThumb == "2"}
  href="{$page.tour.JoinUrl}"
{/if}
{/strip}>
{include file="$tourname/stdimage.tpl" width="234" height="176" item=$item class="thumbs" priority="5"}

<span class="update_title">{$item.Title[0]}</span>

</a>
{/if}