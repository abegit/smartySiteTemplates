{include file="general/page_top.tpl" item=$topnav}

{include file="general/topnav.tpl" item=$root.page.current}






{** Choosing What Page to Display **}
{if $root.page.trial && $root.page.settype[0] == 'highres'}
	{if $root.page.trial.AccessPages.page[0] == $root.page.onpage[0] || $root.page.trial.AccessPages.page[0]==0 || $root.page.trial.AllowRecent.Id[0] == $root.page.contentgroup.Id}
		{include file="$spath/gallery/gallery1.tpl"}
	{else}
		<p>{$templateconf.txtnopermission}</p>
	{/if}
{else}
	{include file='gallery/gallery1.tpl'}
{/if}



{include file='general/page_bottom.tpl'}
