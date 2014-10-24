{**
* Index page Pagination links 
* @param $page - the given page #
*}
{strip}

{assign var="useseo" value=$root.seo_urls}
{assign var="qmark" value="0"}

{if ($useseo)}
  {if ($page) && !is_array($page) && $page == '1'}
   {assign var="seoname" value=""}
  {elseif ($page) && !is_array($page)}
   {assign var="seoname" value="updates/page_$page.html"}
  {/if}
{/if}

{if $useseo}
  {global get="areaurl" assign=areaurl}
  {$areaurl}
  {if ($seoname)}{$seoname}{/if}
{else}
   index.php
   {if $page > 1 && !is_array($page)}
    {if $qmark}&{else}?{/if}
   	page={$page}
    {assign var="qmark" value="1"}
   {/if}
   
   {if $root.page.template_attr[0].value}
    {if $qmark}&{else}?{/if}
   	template={$root.page.template_attr[0].value}
    {assign var="qmark" value="1"}
   {/if}
{/if}

{if $mobile != ""}
?mobile={$mobile}
{/if}
{/strip}