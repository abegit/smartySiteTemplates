{**
Page Gallery file 
The passed parameters here are  
@param type
@param id
@param page
@param seoname
**}
{strip}
{** not sure if the media type attribute is media type **}
{if $seoname != "" && $root.seo_urls}
 {global get="areaurl" assign=areaurl}
 {$areaurl}models/{$seoname}
 {if !is_array($page) && $page != 1}_{$page}{/if}
 .html
{else}
  sets.php?
  {if ($id)}id={$id}{/if}
  {if (!is_array($page))}&page={$page}{/if}
{/if}
{/strip}