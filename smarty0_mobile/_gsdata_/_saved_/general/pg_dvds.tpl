{**
* This is the Page News File
* - It is called from news.ptl to create a page Link fro the pagination 
* @param $page - the page that is requested 
*}
{strip}

{assign var="useseo" value=$root.seo_urls}

{if ($useseo)}
  {if $id && $item.SEOname[0]}
    {assign var="seoname" value=$item.SEOname[0]}
    {assign var="seoname" value="$seoname.html"}
  {elseif ($page) && !is_array($page) && ($page == '1' || $page == '')}
    {assign var="seoname" value="dvds.html"}
  {elseif ($page) && !is_array($page)}
    {assign var="seoname" value="dvds_page_$page.html"}
  {elseif ($id)}
    {assign var="useseo" value="0"}
  {else}
    {assign var="seoname" value="dvds.html"}
  {/if}
{/if}

{if $useseo}
  {global get="areaurl" assign=areaurl}
  {$areaurl}dvds/
  {if ($seoname)}{$seoname}{/if}
{else}
	dvds.php?
		{if ($page) && !is_array($page) && $page != '1' }page={$page}{/if}
		{if ($id) }&id={$id}{/if}		
{/if}

{/strip}
