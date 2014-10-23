{**
* Index page Pagination links 
* @param $page - the given page #
*}
{strip}

{assign var="useseo" value=$root.seo_urls}
{assign var="seon" value=""}

{if ($useseo)}
  {if $fc == 1}
	{assign var="seon" value="our-sites/"}
  {elseif $fc == 2}
	{assign var="seon" value="video-feeds/"}
  {elseif $fc == 4}
	{assign var="seon" value="audio-files/"}
  {elseif $fc == 3}
	{assign var="seon" value="erotic-stories/"}
  {elseif $fc == 5}
	{assign var="seon" value="live-cams/"}
  {elseif $fc == 6}
	{assign var="seon" value="friends/"}
  {else}
	{assign var="seon" value="bonus/"}
  {/if}


  {if ($page) && !is_array($page) && $page != '1'}
   {assign var="pgr" value="page_$page.html"}
   {assign var="seon" value="$seon$pgr"}
  {elseif $id && $seoname}
   {assign var="seon" value="$seon$seoname.html"}
  {elseif $id && !$seoname}
   {assign var="useseo" value="0"}
  {else}
   {assign var="seon" value="$seon"}
  {/if}
{/if}



{if $useseo}
  {global get="areaurl" assign=areaurl}
  {$areaurl}
  {if ($seon)}{$seon}{/if}
{else}
   bonus.php?
   {if $fc}fc={$fc}{/if}
   {if ($page) && !is_array($page) && ($page != '1')}&page={$page}{/if}
   {if ($id)}&id={$id}{/if}
{/if}

{/strip}
