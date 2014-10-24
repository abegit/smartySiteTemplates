{** 
* sitelink template  ( used for all access network sites )
* - This template determines if a given set gas a link to another site in the All Access Network
* @param $item - the given set iem for which this is going to be determine 
**}

<!-- Check if the current site allows the link showing -->
{assign var="show" value=1}
{if isset($root.page.sites_attr) && isset($root.page.sites_attr[0].id) }
	{assign var="currsite" value=$root.page.sites_attr[0].id}
	{foreach from=$root.page.sites.site item="s" } 
		{if $s.Id[0] == $currsite && $s.LimitToSite[0] == 1}
			{assign var="show" value=0}
		{/if}
	{/foreach}	
{/if}

<!-- This is the link to the site -->
{if $show == 1 }


{if isset($item.PreviewXML.sites.item_attr)}
{if isset($item.PreviewXML.sites.item_attr[0].siteid) && $item.PreviewXML.sites.item_attr[0].siteid !="" }
	{foreach from=$item.PreviewXML.sites.item_attr item="ss" }
	{assign var="siteid" value=$ss.siteid}
		{assign var="sitename" value=""}
		{assign var="url" value=""}
		{foreach from=$root.page.sites.site item="s" } 
			{if $s.Id[0] != $currsite}
			{** This will display only the first site found. It can be easily implemented to show a list of all sites  **} 
			{if $s.Id[0] == $siteid && $sitename=="" && $url=="" }
				{assign var="sitename" value=$s.Name[0]}
				{assign var="url" value=$s.URL[0]}
				<span class="site_title1">{$sitename}</span>
			{/if}
			{/if}
		{/foreach}
	{/foreach}
{/if}
{/if}

{/if}