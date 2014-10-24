{** Determines how many big thumbs to show **}
{assign var="num_bigthumbs" value="1"}

{** Determines how many columns to show for the little thumbs **}
{assign var="numcolumns" value="2"}


{assign var="topratednode" value=""}

{foreach from=$root.page.toprated_attr item="topratedA" key="trA"}
{if isset($topratedA.set) && $topratedA.set==1 }
{if isset($root.page.toprated[$trA]) && isset($root.page.toprated[$trA].item)}
  {assign var="topratednode" value=$root.page.toprated[$trA].item}
{/if}
{/if}
{/foreach}

{** Only show the table when the node is available. **}

{if is_array($topratednode)}
<div class="column_background">

{if count($topratednode) == 0}

{** If there aren't any models voted on, show this **}
<table width="100%" cellspacing="0" cellpadding="2">
<tr>
 <td colspan="{$numcolumns}">
   Please rate models to get this toplist to appear.
 </td>
</tr>
</table>

{else}

<table width="100%" cellspacing="0" cellpadding="2">

{** The number of big thumbs to show is set as num_bigthumbs up above **}

{section name=columns start=0 loop=$num_bigthumbs step=1}
<tr>
 <td colspan="{$numcolumns}">
	{assign var="topratedX" value=$topratednode[$smarty.section.columns.index]}
	{include file="$spath/general/showmodel.tpl" topratedX=$topratedX priority=16 pos="0"}
 </td>
</tr>
{/section}


{** The number of columns to show is set as numcolumns up above **}

{foreach from=$topratednode item="topratedM" key="trKey"}
{if $trKey >= $num_bigthumbs}
{if ($trKey - $num_bigthumbs) % $numcolumns == 0}
<tr>

	{section name=columns start=0 loop=$numcolumns step=1}
		{assign var="tmpk" value=$trKey+$smarty.section.columns.index}
		{math equation="x%y" x=$smarty.section.columns.index y=$numcolumns assign=pos}
		<td>
			{if isset($topratednode[$tmpk])}
				{include file="$spath/general/showmodel.tpl" topratedX=$topratednode[$tmpk] priority=17 pos=$pos}
			{/if}
		</td>
	{/section}
</tr>

{/if}
{/if}
{/foreach}

</table>
{/if}

</div>
{/if}