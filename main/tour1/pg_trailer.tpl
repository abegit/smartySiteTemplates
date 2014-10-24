{**
@param id
@param page
@param anchor
**}
{strip}


{assign var="useseo" value=$root.seo_urls}
{global get="areaurl" assign=areaurl}

{if ($useseo)}
  {if $id && $item.SEOname[0]}
   {assign var="seoname" value=$item.SEOname[0]}	   
   {assign var="seoname" value="trailers/$seoname.html"}
  {else}
   {assign var="useseo" value="0"}
  {/if}
{/if}

{if $useseo}
  {$areaurl}
  {if ($seoname)}{$seoname}{/if}
  {if $anchor != ''}#{$anchor}{/if}
{else}
	trailer.php?{if $id}id={$id}{/if}
{/if}


{/strip}
