{global get="image_folder" assign="image_folder"}
<table cellspacing="2" cellpadding="2" border="0">
<tr>
{foreach from=$root.page.favorites.item item="fitem"}
{if $fitem.Id[0] == $root.page.contentgroup.Id[0]}
{assign var="isFav" value=1}
{/if}
{/foreach}

{if isset($isFav)}
<td><img src="{$image_folder}/icons/remove.gif" width="16" height="16" alt=""/></td>
<td>
<a class="content-link3" href="favorites.php?del={$root.page.contentgroup.Id[0]}&amp;type={$root.page.settype[0]}&amp;ret=1">
{$templateconf.txtremovefromfavorites}</a>
</td>
{else}
<td><img src="{$image_folder}/icons/add.gif" width="16" height="16" alt=""/></td>
<td>
<a class="content-link3" href="favorites.php?add={$root.page.contentgroup.Id[0]}&amp;type={$root.page.settype[0]}">
{$templateconf.txtaddtofavorites}
</a>
</td>
{/if}

</tr>
</table>
