{**
@param id
@param page
@param anchor
**}
{strip}

{if isset($root.page_attr[0].static) && $root.page_attr[0].static == 1}
	index
	{if $id!=""}-set{$id}{/if}
	{if $page !='' && is_numeric($page) && $page !=1}-{$page}{/if}
	{$root.page.tour.Extension}
	{if $anchor != ''}#{$anchor}{/if}
{else}

	{assign var="useseo" value=$root.seo_urls}
	{global get="areaurl" assign=areaurl}
	
	{if ($useseo)}
	  {if $id && $item.SEOname[0]}
	   {assign var="seoname" value=$item.SEOname[0]}	   
	   {assign var="seoname" value="updates/$seoname.html"}
	  {elseif ($page) && !is_array($page) && $page == '1'}
	   {assign var="seoname" value="updates/"}
	  {elseif ($page) && !is_array($page)}
	   {assign var="seoname" value="updates/page_$page.html"}
	  {elseif ($id)}
	   {assign var="useseo" value="0"}
	  {/if}
	{/if}
	
	{if $useseo}
	  {$areaurl}
	  {if ($seoname)}{$seoname}{/if}
	  {if $anchor != ''}#{$anchor}{/if}
	{else}
		index.php?
		{if $id}id={$id}{/if}
		{if $id!="" && $page!="" && is_numeric($page)}&amp;{/if}
		{if $page!="" && is_numeric($page)}page={$page}{/if}
		{if $anchor != ''}#{$anchor}{/if}	
	{/if}

{/if}

{/strip}