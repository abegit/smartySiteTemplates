{***
* This is the XML Feed individual item 
*	@param $item - the individual item 
**}

<table cellspacing="2" cellpadding="2" border="0">
	<tr>
	<td valign="top">	
		{if $item.Link[0]}
		<img class="thumbs" src="{$item.Image[0]}"/>
		{else} &nbsp; {/if}
	</td>
	<td class="plaintext" valign="top" align="left">
	
	<!--This displays the title of the Bonus item-->		
	<span class="content-title">{$item.Title[0]}</span><br />
	
	
	<!--This displays the description of the Bonus item-->
	{$item.Description[0]}<br />
	<a class="content-link1" href="{$item.Link[0]}">{$item.Title[0]}</a>
	</td>
	</tr>
</table>
