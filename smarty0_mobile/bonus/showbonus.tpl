{**
* This page shows the individual bonus element 
* @param $item - the item containg the element data 
**}
<span class="title">{$item.Title[0]}</span><br />
	

	{if $item.PreviewXML.element.item_attr}

	{assign var="iw" value="150"}
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
	
	<a class="title" 
	
	{if isset($root.page.trial) && $root.page.trial.AllowBonus == 0}
		href="{$root.page.trial.BonusURL[0]}" >
	{elseif  $item.BonusCat[0] ==7 }
		href="bonus.php?fc=7&id={$item.Id[0]}&pg={$root.page.pages_attr[0].onpage}" >	
	{else}
		href="{$item.URL[0]}">
	{/if}
	
	{if $root.page.bonuscat[0] == 4} {$templateconf.txtlistentoaudio}
	{else}<img class="thumbs" style="max-width: 318px;" src="{#contentdir#}/contentthumbs/{$imageId}-bonus.{$imageExt}" alt="" />
	{/if}</a>



	{else} &nbsp; {/if}
	

	<br />

	<a class="title" 
	
	{if isset($root.page.trial) && $root.page.trial.AllowBonus == 0}
		href="{$root.page.trial.BonusURL[0]}" >
	{elseif  $item.BonusCat[0] ==7 }
		href="bonus.php?fc=7&id={$item.Id[0]}&pg={$root.page.pages_attr[0].onpage}" >	
	{else}
		href="{$item.URL[0]}">
	{/if}
	
	{if $root.page.bonuscat[0] == 4} {$templateconf.txtlistentoaudio}
	{else}{$templateconf.txtvisit}&nbsp;{$item.Title[0]}
	{/if}</a>

<br />
<br />
