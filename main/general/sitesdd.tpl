{strip}
{if isset($root.page.sites.site[0])}
<div>
{literal}
<script type="text/javascript">
	function gotosite(el)
	{
		window.location.href = el.value;
	}
</script>
{/literal}


{$templateconf.txtnetworksites} &nbsp;

	<select name="site" onchange="gotosite(this)">
		{foreach from=$root.page.sites.site item="site"}
			{if $site.LimitToSite[0] == 0}		
				{if isset($root.page.trial)}
					<option value='{$site.TrialURL[0]}' {if $root.page.sites_attr[0].id == $site.Id[0]}selected='selected'{/if}>{$site.Name[0]}</option>
				{else}
					<option value='{$site.URL[0]}' {if $root.page.sites_attr[0].id == $site.Id[0]}selected='selected'{/if}>{$site.Name[0]}</option>
				{/if}
			{/if}
		{/foreach}
		{foreach from=$root.page.sites.site item="site"}
			{if $site.LimitToSite[0] == 1}		
				{if isset($root.page.trial)}
					<option value='{$site.TrialURL[0]}' {if $root.page.sites_attr[0].id == $site.Id[0]}selected='selected'{/if}>{$site.Name[0]}</option>
				{else}
					<option value='{$site.URL[0]}' {if $root.page.sites_attr[0].id == $site.Id[0]}selected='selected'{/if}>{$site.Name[0]}</option>
				{/if}
			{/if}
		{/foreach}
	</select>

</div>
{/if}
{/strip}