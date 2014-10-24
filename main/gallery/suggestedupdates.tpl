{** Show 4 columns for the number of updates **}
{assign var="numcolumns" value="4"}

<!--Title-->
<div class="title_bar">{$templateconf.txtupdatesyoumightlike}</div>

<div class="updates">
<table border="0" cellpadding="1" cellspacing="0">
{foreach from=$root.page.relevant.item item="item" key="kex"}
{if ($kex % $numcolumns) == 0}
<tr>
	{** To adjust the number of columns, change the value of numcolumns at the top of this page **}
	{section name=columns start=0 loop=$numcolumns step=1}
		{assign var="tmpk" value=$kex+$smarty.section.columns.index}

		<td valign="top">
			{if isset($root.page.relevant.item[$tmpk])}
				{include file="$spath/gallery/update_item.tpl" item=$root.page.relevant.item[$tmpk]}
			{else}
				&nbsp
			{/if}
		</td>

	{/section}
</tr>
{/if}
{/foreach}
</table></div>