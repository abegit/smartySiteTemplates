{**
* Index page Pagination links 
* @param $page - the given page #
*}
{if $root.page_attr[0].static == 1}index{if $page != 1 and $page != ''}-{$page}{/if}.html
{else}index.php{if $page > 1}?page={$page}{/if}
{/if}