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
  {/if}
  {if $fc == 2}
	{assign var="seon" value="video-feeds/"}
  {/if}
  {if $fc == 4}
	{assign var="seon" value="audio-files/"}
  {/if}
  {if $fc == 3}
	{assign var="seon" value="erotic-stories/"}
  {/if}
  {if $fc == 5}
	{assign var="seon" value="live-cams/"}
  {/if}
  {if $fc == 6}
	{assign var="seon" value="friends/"}
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
