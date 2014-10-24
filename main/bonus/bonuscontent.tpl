{** Show 2 columns for the feeds on this page **}
{assign var="numcolumns" value="2"}

<!--Page Navigation-->
{if $root.page.pages.page|@count > 1}{include file="$spath/bonus/pagenav.tpl"}{/if}

<br />

{if count($root.page.content.item)}
	{if $root.page.bonuscat[0] == 3 }
		{include file="$spath/bonus/showstory.tpl" item=$item}
	{else}

	{assign var="tableobject" value=$root.page.content.item}
	{assign var="tabletemplate" value="$spath/bonus/showbonus.tpl"}

	{if sizeof($tableobject)}
	<table>
		{foreach from=$tableobject item="item" name="elLoop" key=kex}
			{if ($kex % $numcolumns) == 0 }
				<tr>
				{section name=columns start=0 loop=$numcolumns step=1}
					{assign var="tmpk" value=$kex+$smarty.section.columns.index}
					<td valign="top" width="{math equation="floor(100/numcolumns)" numcolumns=$numcolumns}%">
						{if isset($tableobject[$tmpk])}
							{include file="$tabletemplate" item=$tableobject[$tmpk] contentdir=#contentdir#} 
						{else} 
							&nbsp;
						{/if}
					</td>
				{/section}
				</tr>
			{/if}
		{/foreach}
	</table>
	{/if}

	{/if}

{else}
	<p align="center">{$templateconf.txtnobonuscontent}</p>
{/if}



<!--Page Navigation-->
{if $root.page.pages.page|@count > 1}{include file="$spath/bonus/pagenav.tpl"}{/if}
