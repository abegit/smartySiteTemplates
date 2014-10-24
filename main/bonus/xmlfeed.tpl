{**
*  The XML Feeds Template In Order To Use this template an user has to View the XML Feed Page with selected Id for a XML Feed-->
* -- no parameters passed 
*
*}

	<!--This displays the Page Navigation table-->
	
	{if isset($root.page.pages.page)>1}
		{include file="bonus_pagenav.tpl"}
	{/if}
	<!--End Page Navigation Table -->

	{if isset($root.page.content.item)}
	<table>
		{foreach from=$root.page.content.item item="item" key="k"}
			{if ($k % 2) == 0}
			<tr>
			<td valign="top" width="50%" align="left">
				{include file="xmlfeeditem.tpl" item=$item} 
			</td>
			
			<td valign="top" width="50%" align="left">
			{assign var="tmpi" value=$k+1}
			{if isset($root.page.content.item[$tmpi]) } {include file="xmlfeeditem.tpl" item=$root.page.content.item[$tmpi]}
			{else}	&nbsp  {/if}
			</td>
			</tr>
			{/if}
		{/foreach}
	</table>
		{if count($root.page.content.item) % 2 != 0 }
			<br clear="all" style="font-size: 1px;" />
		{/if}
	{else}
	
		<p align="center">{$templateconf.txtnobonuscontent}</p>
	{/if}
	<br />
	


	<!--This displays the Page Navigation table-->
	
	{if isset($root.page.pages.page)>1}
		{include file="bonus_pagenav.tpl"}
	{/if}
