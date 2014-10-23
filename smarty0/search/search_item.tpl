{strip}
search.php?page={$page}
{if $root.page.info.query[0] !='' }&amp;query={$root.page.info.query[0]}{/if}
{if $root.page.searchparam.any !=''}&amp;qany={$root.page.searchparam.any}{/if}
{if $root.page.searchparam.phrase !=''}&amp;qex={$root.page.searchparam.phrase}{/if}
{if $root.page.searchparam.none !=''}&amp;none={$root.page.searchparam.none}{/if}
{if $root.page.searchparam.all !=''}&amp;qall={$root.page.searchparam.all}{/if}
{if $root.page.info.searchtype[0]!=''}&amp;st={$root.page.info.searchtype[0]}{/if}
{foreach from=$root.page.catchoose.cat_attr item=cat}&amp;cat[]={$cat.id}{/foreach}
{foreach from=$root.page.sitechoose.site_attr item=site}&amp;site[]={$site.id}{/foreach}
{/strip}