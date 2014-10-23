{** 
* sitelink template  ( used for all access network sites )
* - This template determines if a given set gas a link to another site in the All Access Network
* @param $item - the given set item for which this is going to be determine 
**}
{strip}

<!-- This is the link to the site -->
{if $root.page.subsite.LinkOffSite[0] == "1"}


{if isset($item.PreviewXML.sites.item_attr)}
{if isset($item.PreviewXML.sites.item_attr[0].siteid) && $item.PreviewXML.sites.item_attr[0].siteid !="" }
	{foreach from=$item.PreviewXML.sites.item_attr item="ss" }
	{assign var="siteid" value=$ss.siteid}
		{assign var="sitename" value=""}
		{assign var="url" value=""}
		{foreach from=$root.page.sites.site item="s" } 
			{if $s.Id[0] != $root.page.subsite.Id[0]}
			{** This will display only the first site found. It can be easily implemented to show a list of all sites  **} 
			{if $s.Id[0] == $siteid && $sitename=="" && $url=="" }
				{assign var="sitename" value=$s.Name[0]}
				{assign var="url" value=$s.MobileURL[0]}
				{$templateconf.txtsite} 
					{if ($nolink)}
					&nbsp;{$sitename}
					{else}
					&nbsp;{$sitename}
					{/if}
			{/if}
			{/if}
		{/foreach}
	{/foreach}
{/if}
{/if}

{/if}
{/strip}