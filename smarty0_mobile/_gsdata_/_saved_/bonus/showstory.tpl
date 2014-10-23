{if !isset($root.page.Id)}
	<div class="element_wrapper">
	{foreach from=$root.page.content.item item="item" key="k" }
		<div class="element" style="border:1px solid black;">
		{include file="$spath/bonus/story_cell.tpl" item=$item}
		</div>
	{/foreach}
	</div>
{else}

	{foreach from=$root.page.content.item item="item" }
		{if $item.Id[0] == $root.page.Id[0] }
			{assign var="curitem" value=$item}
		{/if}
	{/foreach}




<div id="bonus">

<table width="100%"><tr><td id="title_center">

<!--This displays the title of the Erotic Story-->
{$curitem.Title[0]}

</td>
</tr>
</table>


<!--Date-->
{$templateconf.txtpostedon} {$curitem.DateDisplay[0]}
<br />
<br />


	<div id="story">
		
	<!--This displays a thumbnail for the Story-->	
			{if $curitem.PreviewXML.element.item_attr[0].Id}
			<img style="float:left;margin-right:10px;" class="thumbs" align="left" src="{#contentdir#}/contentthumbs/{$curitem.PreviewXML.element.item_attr[0].Id}-bonus.jpg" alt="" />
				{/if}
	
			
			<!--This displays the body content for the Story or Audio item-->
			{$curitem.Description[0]}
			
		
	</div>
	
</div>


	
{/if}
