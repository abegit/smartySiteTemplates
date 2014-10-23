{** Show 4 columns **}
{assign var="numcolumns" value="4"}


{assign var="tableobject" value=$root.page.tourthumbs.item}
{assign var="tabletemplate" value="$spath/$tourname/moreupdates_item.tpl"}

{if sizeof($tableobject)}
<table align="center">
{foreach from=$tableobject item="itemC" key="kex"}
{if ($kex % $numcolumns) == 0}
<tr>
	{** To adjust the number of columns, change the value of numcolumns at the top of this page **}
	{section name=columns start=0 loop=$numcolumns step=1}
		{assign var="tmpk" value=$kex+$smarty.section.columns.index}

		<td valign="top">
			{if isset($tableobject[$tmpk])}
				{include file="$tabletemplate" item=$tableobject[$tmpk]} 
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

