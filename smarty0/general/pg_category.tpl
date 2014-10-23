{**
* The Category Page Navigation/Pagination Links Creating
* @param id - the set id
* @param page - the current page
* @param sw - the letter selected
* @param s - the sort order 
**}

{strip}
{if $seoname != "" && $root.seo_urls}
 {global get="areaurl" assign=areaurl}

 {$areaurl}categories/{$seoname}
 {if !is_array($page)}
   _{$page}
 {elseif ($s || $sw)}
	_1
 {/if}

 {if ($s)}
   _{$s}
 {elseif ($sw)}
   _
 {/if}

 {if ($sw)}
  _{$sw}
 {/if}

 .html

{else}

category.php?
{if $id!=""}id={$id}&amp;{/if}
{if !is_array($page) && $page != ''}page={$page}&amp;{/if}
{if $s != ''}s={$s}&amp;{/if}
{if $sw != ''}sw={$sw}{/if}
{/if}

{/strip}
