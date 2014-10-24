{** 
* sitelink template  ( used for all access network sites )
* - This template determines if a given set has a link to another site in the All Access Network
* @param $item - the given set iem for which this is going to be determine 
**}






{if isset($root.page.sites_attr) && isset($root.page.sites_attr[0].id) }
	{foreach from=$root.page.sites.site item="s" } 
		{if $s.LimitToSite[0] == "0" && $s.Enabled[0] == "1"}
			{assign var="fullhub" value=$s}
		{/if}
	{/foreach}	
{/if}





<!-- Check if the current site allows the link showing -->
{assign var="show" value=1}
{if !isset($root.page.sites_attr)}
  {assign var="show" value=0}
{else}
{**
	{if isset($root.page.sites_attr) && isset($root.page.sites_attr[0].id) }
		{assign var="currsite" value=$root.page.sites_attr[0].id}
		{foreach from=$root.page.sites.site item="s" } 
			{if $s.Id[0] == $currsite && $s.LimitToSite[0] == 1}
				{assign var="show" value=0}
			{/if}
		{/foreach}	
	{/if}
**}
{/if}

<!-- This is the link to the site -->
{if $show == 1 }
{if isset($fullhub)}
	{if isset($root.page.trial)}
	<a class="site_title2" href="{$fullhub.TrialURL[0]}">{$fullhub.Name[0]}</a> / 
	{else}
	<a class="site_title2" href="{$fullhub.URL[0]}">{$fullhub.Name[0]}</a> / 
	{/if}
{/if}


{if isset($item.PreviewXML.sites.item_attr)}
{if isset($item.PreviewXML.sites.item_attr[0].siteid) && $item.PreviewXML.sites.item_attr[0].siteid !="" }
	{foreach from=$item.PreviewXML.sites.item_attr item="ss" }
	{assign var="siteid" value=$ss.siteid}
		{assign var="sitename" value=""}
		{assign var="url" value=""}
		{foreach from=$root.page.sites.site item="s" } 
			{** This will display only the first site found. It can be easily implemented to show a list of all sites  **} 
			{if $s.Id[0] == $siteid && $sitename=="" && $url=="" && ($s.Id[0] != $fullhub.Id[0])}
				{assign var="sitename" value=$s.Name[0]}
				{if isset($root.page.trial)}
				{assign var="url" value=$s.TrialURL[0]}
				{else}
				{assign var="url" value=$s.URL[0]}
				{/if}
				<a class="site_title2" href="{$url}">{$sitename}</a> /
			{/if}
		{/foreach}
	{/foreach}
{/if}
{/if}

{/if}
