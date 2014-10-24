
<table align="center" cellpadding="2" cellspacing="2">
{if isset($root.page.toprated[0].item)}
	{assign var="tr" value=$root.page.toprated[0]}
	{assign var="fcKey" value=0}

	<tr>
	<td valign="top">
		{assign var="i" value=$fcKey}
		{if isset($tr.item[$i])} {include file="$spath/$tourname/toplist_item.tpl" item=$tr.item[$i]} {else} &nbsp {/if}
	</td>
	<td valign="top">
		{assign var="i" value=$fcKey+1}
		{if isset($tr.item[$i])} {include file="$spath/$tourname/toplist_item.tpl" item=$tr.item[$i]} {else} &nbsp {/if}
	</td>
	<td valign="top">
		{assign var="i" value=$fcKey+2}
		{if isset($tr.item[$i])} {include file="$spath/$tourname/toplist_item.tpl" item=$tr.item[$i]} {else} &nbsp {/if}
	</td>
	<td valign="top">
		{assign var="i" value=$fcKey+3}
		{if isset($tr.item[$i])} {include file="$spath/$tourname/toplist_item.tpl" item=$tr.item[$i]} {else} &nbsp {/if}
	</td>
	<td valign="top">
		{assign var="i" value=$fcKey+4}
		{if isset($tr.item[$i])} {include file="$spath/$tourname/toplist_item.tpl" item=$tr.item[$i]} {else} &nbsp {/if}
	</td>
	</tr>
{/if}
</table>


