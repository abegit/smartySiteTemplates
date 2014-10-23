{**
* Index page Pagination links 
* @param $page - the given page #
*}
{strip}

{assign var="useseo" value=$root.seo_urls}

{if ($useseo)}
   {assign var="seon" value="calendar"}
   {if ($month) && ($year)}
      {assign var="seon" value="`$seon`/`$year`_`$month`.html"}
   {elseif $id && $seoname}
	{assign var="seon" value="$seon/$seoname.html"}
   {elseif ($id)}
	{assign var="useseo" value="0"}
   {else}
        {assign var="seon" value="calendar/"}
   {/if}
{/if}

{if $useseo}
  {global get="areaurl" assign=areaurl}
  {$areaurl}
  {if ($seon)}{$seon}{/if}
{else}
   calendar.php?
   {if $year}year={$year}{/if}
   {if $month}&month={$month}{/if}
   {if $id}id={$id}{/if}
{/if}

{/strip}
