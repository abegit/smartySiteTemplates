{** If we're on page 1, show 3 columns, otherwise show 4 columns **}

{if $root.page.onpage[0] == 1}
{assign var="numcolumns" value="3"}
{else}
{assign var="numcolumns" value="4"}
{/if}

{** Show page navigation on any other page except page 1 **}

{if $root.page.onpage[0] != 1}
<!--Page Navigation-->
{include file="$spath/index/pagenav.tpl"}
{/if}


{assign var="tableobject" value=$content.item}
{assign var="tabletemplate" value="$spath/index/update_item.tpl"}

{if sizeof($tableobject)}
<table border="0" cellspacing="2" cellpadding="0" align="center">

{foreach from=$tableobject item="itemC" key="kex"}
{if ($kex % $numcolumns) == 0}
<tr>
	{** To adjust the number of columns, change the value of numcolumns at the top of this page **}
	{section name=columns start=0 loop=$numcolumns step=1}
		{assign var="tmpk" value=$kex+$smarty.section.columns.index}

		<td valign="top">
			{if isset($content.item[$tmpk])}
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
<!--Page Navigation-->
{include file="$spath/index/pagenav.tpl" content=$content}
