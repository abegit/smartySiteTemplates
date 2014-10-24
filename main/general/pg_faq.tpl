{**
* Index page Pagination links 
* @param $page - the given page #
*}
{strip}

{assign var="useseo" value=$root.seo_urls}

{if ($useseo)}
  {global get="areaurl" assign=areaurl}
  {$areaurl}faq/faq.html
{else}
  faq.php
{/if}

{/strip}
