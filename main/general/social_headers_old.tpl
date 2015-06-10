{strip}
{array var="image_list" new="1"}
{assign var="usepriority" value="10"}

{if $root.page_attr[0].name == "index" && !isset($root.page.tourcontent)}
	{** Transparent tour / members area index page **}

	{if isset($root.page.content[0])}
		{assign var="node" value=$root.page.content[0]}
	{else}
		{assign var="node" value=$root.page.content}	
	{/if}
	
	{foreach from=$node.item item=item}
		{foreach from=$item.PreviewXML.element.item_attr item=item_attr}
			{if $item_attr.priority == $usepriority}
				{capture assign="img"}{$areaurl}content/contentthumbs/{$item_attr.Id}.{$item_attr.Extension}{/capture}
				{array var="image_list" value=$img}
			{/if}
		{/foreach}
	{/foreach}	

{elseif $root.page_attr[0].name == "index" && isset($root.page.current)}

	{** Index page, with tour item selected **}

	{capture assign="img"}{$areaurl}content/{$root.page.current.Directory[0]}/0.jpg{/capture}
	{array var="image_list" value=$img}

	{capture assign="img"}{$areaurl}content/{$root.page.current.Directory[0]}/1.jpg{/capture}
	{array var="image_list" value=$img}

	{capture assign="img"}{$areaurl}content/{$root.page.current.Directory[0]}/2.jpg{/capture}
	{array var="image_list" value=$img}
	
	{capture assign="img"}{$areaurl}content/{$root.page.current.Directory[0]}/3.jpg{/capture}
	{array var="image_list" value=$img}


{elseif $root.page_attr[0].name == "index"}

	{** Index page, no individual tour item selected **}

	{foreach from=$root.page.tourcontent.item item=item}
		{capture assign="img"}{$areaurl}content/{$item.Directory[0]}/0.jpg{/capture}
		{array var="image_list" value=$img}
	{/foreach}	

{elseif $root.page_attr[0].name == "search"}
	{** Search Page **}
	
	{foreach from=$root.page.results.result item=item}
		{foreach from=$item.PreviewXML.element.item_attr item=item_attr}
			{if $item_attr.priority == $usepriority}
				{capture assign="img"}{$areaurl}content/contentthumbs/{$item_attr.Id}.{$item_attr.Extension}{/capture}
				{array var="image_list" value=$img}
			{/if}
		{/foreach}
	{/foreach}	

{elseif $root.page_attr[0].name == "trailer"}

	{** Trailer page **}

	{capture assign="img"}{$areaurl}content/{$root.page.current.Directory[0]}/0.jpg{/capture}
	{array var="image_list" value=$img}

	{capture assign="img"}{$areaurl}content/{$root.page.current.Directory[0]}/1.jpg{/capture}
	{array var="image_list" value=$img}

	{capture assign="img"}{$areaurl}content/{$root.page.current.Directory[0]}/2.jpg{/capture}
	{array var="image_list" value=$img}
	
	{capture assign="img"}{$areaurl}content/{$root.page.current.Directory[0]}/3.jpg{/capture}
	{array var="image_list" value=$img}

{elseif $root.page_attr[0].name == "dvds"}
	{** DVD page **}

	{foreach from=$root.page.dvd item=item}
		{foreach from=$item.PreviewXML.thumbs.item_attr item=item_attr}				
			{capture assign="img"}{$areaurl}content/contentthumbs/{$item_attr.Id}-dvdasc.jpg{/capture}
			{array var="image_list" value=$img}
		{/foreach}
	{/foreach}	


{elseif ($root.page_attr[0].name == "category" && $root.page.content_attr[0].contentasc == 1) || ($root.page_attr[0].name == "sets" && $root.page.content_attr[0].contentasc == 1)}

	{** Models listing page **}

	{assign var="usepriority" value="16"}

	{foreach from=$root.page.content.item item=item}
		{foreach from=$item.ModelXML.element.item_attr item=item_attr}		
			{if $item_attr.priority == $usepriority}
				{capture assign="img"}{$areaurl}content/contentthumbs/{$item_attr.Id}-set.jpg{/capture}
				{array var="image_list" value=$img}
			{/if}
		{/foreach}
	{/foreach}	

{elseif $root.page_attr[0].name == "sets"}

	{** Individual Model page **}

	{assign var="usepriority" value="16"}	
	
	{foreach from=$root.page.models.model.PreviewXML.element.item_attr item=item_attr}
		{if $item_attr.priority == $usepriority}
			{capture assign="img"}{$areaurl}content/contentthumbs/{$item_attr.Id}-set.jpg{/capture}
			{array var="image_list" value=$img}
		{/if}
	{/foreach}

{elseif $root.page_attr[0].name == "category"}

	{** Category List Page **}

	{foreach from=$root.page.content.item item=item}
		{foreach from=$item.PreviewXML.element.item_attr item=item_attr}
			{if $item_attr.priority == $usepriority}
				{capture assign="img"}{$areaurl}content/contentthumbs/{$item_attr.Id}.{$item_attr.Extension}{/capture}
				{array var="image_list" value=$img}
			{/if}
		{/foreach}
	{/foreach}	

{elseif $root.page_attr[0].name == "gallery"}

	{** Gallery page (gallery.php) **}

	{foreach from=$root.page.contentgroup.PreviewXML.element.item_attr item=item_attr}
		{if $item_attr.priority == $usepriority}		
			{capture assign="img"}{$areaurl}content/contentthumbs/{$item_attr.Id}.{$item_attr.Extension}{/capture}
			{array var="image_list" value=$img}
		{/if}
	{/foreach}

{/if}

<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="{$title}" />
<meta property="og:title" content="{$title}"/>

{** Uncomment this if you want to associate the account with a specific twitter handle
    <meta name="twitter:creator" content="@hackweek">
    <meta name="twitter:site" content="@flickr">
**}


{if $seodesc}
    <meta name="twitter:description" content="{$seodesc}" />
	<meta property="og:description" content="{$seodesc}"/>
{elseif $templateconf.defaultmetadescription}
    <meta name="twitter:description" content="{$templateconf.defaultmetadescription}" />
	<meta property="og:description" content="{$templateconf.defaultmetadescription}"/>
{/if}

{assign var="cnt" value=0}

{if $image_list|@count >= 4}
  <meta name="twitter:card" content="gallery">
  {assign var="maxcount" value="4"}
{else}
  <meta name="twitter:card" content="summary">
  {assign var="maxcount" value="1"}
{/if}

{if $image_list|@count > 0}
<meta property="og:image" content="{$areaurl}img/ogimagefacebook.png" />
  <meta property="og:image" content="{$areaurl}content/contentthumbs/{$item_attr.Id}.{$item_attr.Extension}" />
{/if}

{assign var="cnt" value=0}
{foreach from=$image_list item="image" key=kex}
  {if $cnt < $maxcount}
    {if $maxcount > 1}
    	<meta name="twitter:image{$kex}" content="{$image}" />
    {else}
	    <meta name="twitter:image" content="{$image}" />
    {/if}
  {/if}
  {assign var="cnt" value=$cnt+1}
{/foreach}

<meta property="og:description" content="Tune In Live Every SATURDAY Night @ 10:30 PM California Time to watch the Most Unique, Uncensored, and Unscripted Show of All-Time on DrSuzy.tv! "/>



{/strip}