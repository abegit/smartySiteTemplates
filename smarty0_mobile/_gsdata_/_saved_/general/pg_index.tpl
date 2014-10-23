{**
* Index page Pagination links 
* @param $page - the given page #
*}
{strip}

{assign var="useseo" value=$root.seo_urls}

{if ($useseo)}
  {if ($page) && !is_array($page) && $page == '1'}
   {assign var="seoname" value=""}
  {elseif ($page) && !is_array($page)}
   {assign var="seoname" value="updates/page_$page.html"}
  {elseif $template != ""}
   {assign var="seoname" value="$template/"}
  {/if}
{/if}

{if $useseo}
  {global get="areaurl" assign=areaurl}
  {$areaurl}
  {if ($seoname)}{$seoname}{/if}
{else}
   index.php
   {if $page > 1 && !is_array($page)}?page={$page}{/if}

	{if $template != ""}
	?template={$template}
	{/if}
{/if}

{if $mobile != ""}
?mobile={$mobile}
{/if}
{/strip}