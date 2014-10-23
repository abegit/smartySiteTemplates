{if isset($item) && $item!=""}

	
<table width="100%">
<tr>
<td id="title_center">
<!--Title-->


{$item.Title[0]}

</td>
</tr>
<tr>
<td>

<!--This displays a thumbnail for the story item-->	

	
	<span class="plaintext">{$templateconf.txtadded}
	<!--This displays the release date of the content set-->
		
	{$item.DateDisplay[0]}</span>
	
	<br />
	
	<a href="bonus.php?fc=3&amp;id={$item.Id[0]}">
	<img class="thumbs" src="{#contentdir#}/contentthumbs/{$item.PreviewXML.element.item_attr[0].Id}-bonus.jpg" alt="" /></a>


</td>
</tr>
</table>

	
	
{/if}
