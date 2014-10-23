<table width="100%">
<tr>
<td id="title_center">
<!--Title-->
	<a {if isset($root.page.trial) && $root.page.trial.AllowBonus == 0}
		href="{$root.page.trial.BonusURL[0]}" >
	{elseif  $item.BonusCat[0] ==7 }
		href="bonus.php?fc=7&id={$item.Id[0]}&pg={$root.page.pages_attr[0].onpage}" >	
	{else}
		href="{$item.URL[0]}">
	{/if}
{$item.Title[0]}
</a>
</td>
</tr>
<tr>
<td id="bonus_info">

<!--This displays a thumbnail for the bonus item-->	
	<a {if isset($root.page.trial) && $root.page.trial.AllowBonus == 0}
		href="{$root.page.trial.BonusURL[0]}" >
	{elseif  $item.BonusCat[0] ==7 }
		href="bonus.php?fc=7&id={$item.Id[0]}&pg={$root.page.pages_attr[0].onpage}" >	
	{else}
		href="{$item.URL[0]}">
	{/if}
	
	{if $root.page.bonuscat[0] == 4} {$templateconf.txtlistentoaudio}
	{else}

{if $item.PreviewXML.element.item_attr}

	{assign var="iw" value="200"}
	{assign var="ih" value="138"}

	{** get the last picture element (if more then 1) **}
	{if count($item.PreviewXML.element.item)>1}
		{foreach from=$item.PreviewXML.element.item_attr item="itemT" key=k name="loopImage"}
			{if $smarty.foreach.loopImage.last}
				{assign var="imageId" value=$itemT.Id }
				{assign var="imageExt" value=$itemT.Extension}
			{/if}
		{/foreach}	
	{else}
		{assign var="imageId" value=$item.PreviewXML.element.item_attr[0].Id }
		{assign var="imageExt" value=$item.PreviewXML.element.item_attr[0].Extension }
	{/if}
	<img class="thumbs" src="{#contentdir#}/contentthumbs/{$imageId}-bonus.{$imageExt}" alt="" />
	{else} &nbsp; {/if}

	{/if}</a>




</td>
</tr>
</table>

<br />

