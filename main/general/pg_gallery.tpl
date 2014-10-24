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
 {$areaurl}scenes/{$seoname}
 {if $type}_{$type}{/if}
 {if $page && is_numeric($page) && ($page != 1)}
   _{$page}
 {elseif $mt}
  _1 
 {/if}
 {if $mt}_{$mt}{/if}
 .html
{else}
  gallery.php?
  {if ($id)}id={$id}&amp;{/if}
  {if ($type)}type={$type}&amp;{/if}
  {if $page && is_numeric($page)}page={$page}{/if}
  {if ($mt)}&amp;mt={$mt}{/if}
{/if}
{/strip}