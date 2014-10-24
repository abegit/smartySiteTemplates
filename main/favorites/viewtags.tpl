{** Show 2 columns for the tag list **}
{assign var="numcolumns" value="2"}


{literal}
<script type="text/JavaScript">
	function confirmSdelete(id,setid)
	{
		g = confirm("Are you sure you want to delete this set!");

   if (g)
   {
       document.location="favorites.php?deleteset=1&id="+id+"&setid="+setid;
   }

	return false;
	}	
</script>
{/literal}


{assign var="tagname" value=$root.page.tagName[0]}
{assign var="tagid" value=$root.page.TagId[0]}

{assign var="tabletemplate" value="favorites/tag_item.tpl"}
{assign var="tableobject" value=$root.page.utag.item}

	<table cellspacing="0" cellpadding="0" border="0">
	{foreach from=$tableobject item="item" key=kex}
		{if ($kex % $numcolumns) == 0}
		<tr>
			{section name=columns start=0 loop=$numcolumns step=1}
				{assign var="tmpk" value=$kex+$smarty.section.columns.index}
		
				<td valign="top">
					{if isset($tableobject[$tmpk])}
						{include file="$tabletemplate" item=$tableobject[$tmpk] tagid=$tagid tagname=$tagname} 
					{else} 
						&nbsp;
					{/if}
				</td>
		
				{if $smarty.section.columns.index < $numcolumns - 1}
				<td style="padding:2px;"></td>
				{/if}
			{/section}			
		</tr>
		{/if}
	{/foreach}
	
	</table>

	
