{global get="image_folder" assign="image_folder"}
{if (isset($item) && $item neq "") } 




<table cellpadding="0" cellspacing="0" border="0">	
<tr><td>{include file="$spath/general/stdimage.tpl" item=$item usepriority="13" alt="Coming Soon" style="margin-bottom:1px;" class="" postfix="comingsoon"}</td></tr>
<tr><td class="coming_soon_info">

<table width="100%" cellpadding="2" cellspacing="0" border="0">

<tr>
<td valign="top">
<!--Site Name-->
{include file="$spath/general/sitelink.tpl" item=$item}

<br />

<!--Title-->
<span class="coming_soon_title">{$item.Title[0]}</span>

</td>
<td valign="top" class="date" align="right">

<!--Date-->
{$templateconf.txtcoming} {$item.DateDisplay[0]}

</td>
</tr>

{if in_array('contentasc',$pluginsdata.plugins) && $pluginsdata.enabled.contentasc == 1}
<tr>
<td colspan="2" class="update_info">


	{$templateconf.txtfeaturedmodels}

	{if isset($item.PreviewXML.sets.set[0]) }
		{assign var="cnt" value=0}
		{foreach item=i from=$item.PreviewXML.sets.set name=sets}
		{assign var="cnt" value=$cnt+1}

		{if $cnt <= 2}
			<a class="model_category_link" href="{include file="$spath/general/pg_sets.tpl" id=$i.Id[0] seoname=$i.SEOname[0] item=$i}">{$i.ModelName[0]}</a>
			{if !($smarty.foreach.sets.last) && ($cnt != 2) }, {/if}
		{/if}
		{/foreach}
	{else}
		{assign var="i" value=$item.PreviewXML.sets.set}

		<a class="model_category_link" href="{include file="$spath/general/pg_sets.tpl" id=$i.Id[0] seoname=$i.SEOname[0] item=$i}">{$i.ModelName[0]}</a>
	{/if}
		

</td>
</tr>
{/if}

</table>


</td></tr>
</table>

{/if}
