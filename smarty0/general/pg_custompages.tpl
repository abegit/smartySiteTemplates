{**
* This is the Page News File
* - It is called from news.ptl to create a page Link fro the pagination 
* @param $page - the page that is requested 
*}
{strip}

{assign var="useseo" value=$root.seo_urls}

{if ($useseo)}
   {assign var="seoname" value="`$item.SEOname[0]`.html"}
{/if}

{if $useseo}
  {global get="areaurl" assign=areaurl}
  {$areaurl}pages/
  {if ($seoname)}{$seoname}{/if}
{else}
	pages.php?id={$item.SEOname[0]}		
{/if}

{/strip}