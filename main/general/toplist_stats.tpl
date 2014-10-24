<div class="column_background">

{foreach from=$root.page.stats.view item=item}

{if $item.attributes.Id !=28 && $item.attributes.Id[0] !=29 && $item.attributes.Id[0] !=30}	

{if $item.list.item|@count > 0}


	<div class="subtitle">{$item.attributes.default_name[0]}<br />
- - - - - - - - - - - - - - - - - - -

</div>
	 
		<ol>
		 {foreach from=$item.list.item key=k item=item2}
		  <li>
		   {if isset($item2.url[0]) && $item2.url[0] !=""}
		    <a class="toplist_link" href="{$item2.url[0]}"> 
			{if isset($item2.ModelName[0])}
				{$item2.ModelName[0]}
			{else}
				{$item2.Title[0]} 
			{/if}
		    </a>
		   {else}
                        {if isset($item2.ModelName[0])}
                                {$item2.ModelName[0]}
                        {else}
                                {$item2.Title[0]}
                        {/if}
		   {/if}
		 </li>
	 	{/foreach}
	 </ol>
	
{/if}
{/if}
{/foreach}

</div>
