<div id="join_links">
{if !isset($pos)} {assign var="pos" value=0} {/if}
<a href='{$root.page.tour.JoinUrl}'>
{if $pos == 1}
	{$templateconf.mobiletourtxtjoin1}
{elseif $pos==2 }
	{$templateconf.tourtxtjoin2}

{elseif $pos == 3}
	{$templateconf.tourtxtjoin3}
{/if}
</a>
</div>

<br />
