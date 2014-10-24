{if isset($root.page.usertags)}
{literal}
<script type="text/JavaScript">
function deleteTag(id,name)
{
g = confirm("Are you sure you want to delete tag '" + name + "' ?It will permanetly delete the tag and all sets associated with it");
return g;
if (g)
{
document.location="favorites.php?deletetag=1&amp;id="+id;
}
}	
</script>
{/literal}
<table border="0" cellpadding="0" cellspacing="0">

	<tr>
	<td>

	<table  cellspacing="2" cellpadding="2" border="0">



{foreach from=$root.page.usertags.item item="item"}
<tr>
				<td><a class="tag_link" href="favorites.php?browsetag=1&amp;id={$item.Id[0]}">{$item.TagName[0]}</a> <span class="tag_info">({$item.NumSets[0]})</span>				</td>

		
				<td style="padding-left:10px;"><a class="content-link1 ">
	<a class="delete_tag_link" href="favorites.php?deletetag=1&amp;id={$item.Id[0]}" onClick="return deleteTag('{$item.Id[0]}','{$item.TagName[0]}')">
	{$templateconf.txtdeletetag}</a></td>
			</tr>
{/foreach}	
	</table>
	</td>

	</tr>

	
	</table>
{/if}