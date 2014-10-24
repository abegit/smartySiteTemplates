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

{assign var="qmark" value="0"}

{if $useseo}
  {global get="areaurl" assign=areaurl}
  {$areaurl}dvds/
  {if ($seoname)}{$seoname}{/if}

  {if ($sw) }
    {if !$qmark}{assign var="qmark" value="1"}?{else}&{/if}
    sw={$sw}
  {/if}
  {if ($sid)}
    {if !$qmark}{assign var="qmark" value="1"}?{else}&{/if}
    sid={$sid}
  {/if}
  {if ($s != "n" && $s != "")}
    {if !$qmark}{assign var="qmark" value="1"}?{else}&{/if}
    s={$s}
  {/if}
  
{else}

  dvds.php
  {if ($page) && !is_array($page) && $page != '1' }
    {if !$qmark}{assign var="qmark" value="1"}?{else}&{/if}
  	page={$page}
  {/if}
  {if ($id) }
    {if !$qmark}{assign var="qmark" value="1"}?{else}&{/if}
    id={$id}
  {/if}
  {if ($sw) }
    {if !$qmark}{assign var="qmark" value="1"}?{else}&{/if}
    sw={$sw}
  {/if}
  {if ($sid)}
    {if !$qmark}{assign var="qmark" value="1"}?{else}&{/if}
    sid={$sid}
  {/if}
  {if ($s != "n" && $s != "")}
    {if !$qmark}{assign var="qmark" value="1"}?{else}&{/if}
    s={$s}
  {/if}
{/if}

{/strip}
