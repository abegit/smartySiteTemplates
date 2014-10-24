{global get="image_folder" assign="image_folder"}
{if (isset($item) && $item neq "") } 



{strip}
<table class="coming_soon_wrapper" cellpadding="1" cellspacing="0" border="0">		
<tr><td>
{include file="$tourname/stdimage.tpl" width="297" height="230" item=$item class="thumbs" priority="5" style="margin-bottom:1px;"}
</td></tr>
<tr><td align="left" class="coming_soon_info">

<table width="100%" cellpadding="2" cellspacing="0" border="0">

<tr>
<td valign="top" class="coming_soon_title">
<!--Site Name-->
{include file="$tourname/sitelink.tpl" item=$item}

<br />

<!--Title-->
<span class="coming_soon_title">{$item.Title[0]}</span>

</td>
<td valign="top" class="date" align="right">

<!--Date-->
{$templateconf.txtcoming} {$item.DateDisplay[0]}

</td>
</tr>

<tr>
<td colspan="2" class="update_info">


	{$templateconf.txtfeaturedmodels}&nbsp;


	{if isset($item.PreviewXML.sets.set[0]) }
		{assign var="cnt" value="0"}

		{foreach item=i from=$item.PreviewXML.sets.set name=sets}
		{if $cnt <= 2}
		{if $i.Gender[0] == "F"}
			{if $cnt != 0}, {/if}
			{assign var="cnt" value=$cnt+1}
			{$i.ModelName[0]}
		{/if}
		{/if}
		{/foreach}


		{if $cnt < 2}
			{foreach item=i from=$item.PreviewXML.sets.set name=sets}
			{if $cnt <= 2}
			{if $i.Gender[0] != "F"}
				{if $cnt != 0}, {/if}
				{assign var="cnt" value=$cnt+1}
				{$i.ModelName[0]}
			{/if}
			{/if}
			{/foreach}
		{/if}

	{else}
		{$item.PreviewXML.sets.set.ModelName[0]}
	{/if}
		
		

</td>
</tr>
</table>


</td></tr>
</table>


{/strip}



{/if}
