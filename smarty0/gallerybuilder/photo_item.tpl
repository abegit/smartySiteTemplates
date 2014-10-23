{**
 The Item update element

  @param - $index: The index # of the item that should be shown (starting with 1)

**}
{strip}
{assign var="cnt" value="0"}
{assign var="show" value=0}
{assign var="type" value="image"}
{assign var="item" value=$root.content.item}

{foreach from=$item item=n}
  {if $n.type == $type}
    {assign var="cnt" value=$cnt+1}

	{if $cnt == $index}
	  {foreach from=$n.files item=nn}
		{if $nn.name == "jpg"}
			{assign var="jpg" value=$nn}
		{/if}
		{if $nn.name == "thumb"}
			{assign var="thumb" value=$nn}			
		{/if}
	  {/foreach}

      {assign var="show" value=1}

	  <a href=".{$jpg.path}" rel="prettyPhoto[gallery]">
	  <img class="thumb" border="0" src=".{$thumb.path}" />
	  </a>
	{/if}
  {/if}
{/foreach}
{if $show == 0}&nbsp;{/if}
{/strip}