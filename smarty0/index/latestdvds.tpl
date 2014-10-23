{** Show 4 columns of DVD updates **}
{assign var="numcolumns" value="4"}

<table cellpadding="2" cellspacing="0" border="0">

{if isset($root.page.dvdasc.newdvds.dvd)}
{foreach from=$root.page.dvdasc.newdvds.dvd item="item" key="kex"}
{if $kex % $numcolumns == 0 }
<tr>
	{** To adjust the number of columns, change the value of numcolumns at the top of this page **}
	{section name=columns start=0 loop=$numcolumns step=1}
		{assign var="tmpk" value=$kex+$smarty.section.columns.index}

		<td valign="top">
			{if isset($root.page.dvdasc.newdvds.dvd[$tmpk])}
				{include file="$spath/index/dvd_item.tpl" item=$root.page.dvdasc.newdvds.dvd[$tmpk]} 
			{else} 
				&nbsp;
			{/if}
		</td>
	{/section}
</tr>    	
{/if}
{/foreach}
{/if}
</table>