{**
* This is the Page News File
* - It is called from news.ptl to create a page Link fro the pagination 
* @param $page - the page that is requested 
*}
{strip}

{assign var="useseo" value=$root.seo_urls}

{if ($useseo)}
  {if $tag}
   {if ($page) && !is_array($page) && $page != '1'}
   {assign var="seoname" value="tags/$tag-page$page.html"}
   {else}
   {assign var="seoname" value="tags/$tag.html"}
   {/if}
  {elseif $id && $item.SEOname[0]}
   {assign var="seoname" value=$item.SEOname[0]}
   {assign var="seoname" value="$seoname.html"}
  {elseif ($page) && !is_array($page) && $page == '1'}
   {assign var="seoname" value="news.html"}
  {elseif ($page) && !is_array($page)}
   {assign var="seoname" value="news_page_$page.html"}
  {elseif ($id)}
   {assign var="useseo" value="0"}
  {else}
   {assign var="seoname" value="news.html"}
  {/if}
{/if}

{if $useseo}
  {global get="areaurl" assign=areaurl}
  {$areaurl}news/
  {if ($seoname)}{$seoname}{/if}
{else}
	news.php?
		{if ($page) && !is_array($page) && $page != '1' }page={$page}&{/if}
		{if ($id) }id={$id}&{/if}
		{if ($tag) }tag={$tag}&{/if}
{/if}

{/strip}