{**
* This file creates an link to a video file 
* Called from gallery_showlink.tpl
* @param type
* @param id" 
* @param cg" default = $root.page.contentgroup.Id[0]
* @param mt" default = lmpg
* @param pos deafult = $pos  
* @param surl
**}

{assign var="citem" value=""}
{foreach from=$root.page.contenttypesub.type item=cii}
{if $cii.Name[0] == $mt && $cii.Type[0] == $type}
  {assign var="citem" value=$cii}
{/if}
{/foreach}

{if $citem}

{if (!isset($root.page.trial))}
	{$surl}
{elseif $citem.ShowPlay[0] == 2 && in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)}
	{$surl}
{elseif $citem.ShowPlay[0] == 1 && (in_array($pos, $root.page.trial.AccessClips.page)) or ($root.page.trial.AccessClips.page[0] == 0) or in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)}
	{$surl}
{else} return trialfail() {/if}

{/if}