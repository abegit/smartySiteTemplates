{assign var="cdir" value=#contentdir#}

<table class="content_wrapper">
<tr>
<td id="title_center">
<!--Title-->
<a href="{include file="$spath/general/pg_dvds.tpl" id=$item.Id[0] item=$item}">{$item.ModelName[0]}</a>
</td>
</tr>
<tr>
<td>
<!--This displays the boxcover for the DVD-->
<a href="{include file="$spath/general/pg_dvds.tpl" id=$item.Id[0] item=$item}">
{if isset($item.PreviewXML.thumbs.item_attr[0])}
<img class="thumbs" src="{$cdir}/contentthumbs/{$item.PreviewXML.thumbs.item_attr[0].Id}-dvdasc.jpg"/>{else}Details{/if}
</a>
</td>
</tr>
</table>

