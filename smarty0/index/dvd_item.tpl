{assign var="cdir" value=#contentdir#}

<a class="dvd_title" href="{include file="$spath/general/pg_dvds.tpl" id=$item.Id[0] item=$item}">{$item.ModelName[0]}<br />
{if isset($item.PreviewXML.thumbs.item_attr[0])}
<img class="dvd_box_index" src="{$cdir}/contentthumbs/{$item.PreviewXML.thumbs.item_attr[0].Id}-dvdasc.jpg"/>{else}Details{/if}
</a>
