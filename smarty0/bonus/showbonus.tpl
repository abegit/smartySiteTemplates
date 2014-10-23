{if isset($root.page.trial)} {assign var="contentdir" value="/trial/content"}
{else}{assign var="contentdir" value="/members/content/"}{/if}

<table cellspacing="2" cellpadding="2" border="0">
<tr>
<td valign="top">

<!--Thumbnail-->
<a class="bonus_title"
{if isset($root.page.trial) && $root.page.trial.AllowBonus[0] == 0}
	href="{$root.page.trial.BonusURL[0]}" >
{elseif  $item.BonusCat[0] ==7 }
	href="bonus.php?fc=7&id={$item.Id[0]}&pg={$root.page.pages_attr[0].onpage}" >	
{else}
	href="{$item.URL[0]}" target="_blank" >
{/if}

{if $item.PreviewXML.element.item_attr}
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
<img class="thumbs" src="{#contentdir#}/contentthumbs/{$imageId}-bonus.{$imageExt}"/>
{/if}
</a>
</td>
<td class="bonus_description" valign="top">

<!--Title-->
<a class="bonus_title"
{if isset($root.page.trial) && $root.page.trial.AllowBonus[0] == 0}
	href="{$root.page.trial.BonusURL[0]}" >
{elseif  $item.BonusCat[0] ==7 }
	href="bonus.php?fc=7&id={$item.Id[0]}&pg={$root.page.pages_attr[0].onpage}" >	
{else}
	href="{$item.URL[0]}" target="_blank" >
{/if}

{$item.Title[0]}</a>


<br />		

<!--Date-->
<span class="date">{$templateconf.txtadded} {$item.DateDisplay[0]}</span>

<br />
<br />		

<!--Description-->
{if sizeof($item.Description[0])}
  {$item.Description[0]}{if $item.BodyLength > $item.MaxLength}...{/if}
{/if}

</td>
</tr>
</table>