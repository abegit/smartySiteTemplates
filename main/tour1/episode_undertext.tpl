{**
The following displays text after each episode table
@param pos
**}

{if !isset($pos)} {assign var="pos" value=0} {/if}
<a class="join_links_big" href="{$root.page.tour.JoinUrl}">


{if $pos == 1}
	{$templateconf.tourtxtjoin1}
{elseif $pos==2 }
	{$templateconf.tourtxtjoin2}

{elseif $pos == 3}
	{$templateconf.tourtxtjoin3}
{/if}
</a>

<br />
<br />
