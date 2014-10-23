{strip}
{foreach from=$categories item=cat}
{foreach from=$cat.cats.cat item=cat2 }
{if $cat2.Title[0] =='Models' }
  {assign var="modelsCat" value=$cat2.Id[0]}
  {assign var="modelsNode" value=$cat2}  
{/if}
{/foreach}
{/foreach}
{/strip}

<div id="site_navbar">

<a href="{include file="$spath/$tourname/pg_tour.tpl"}">{$templateconf.tourtxthome}</a> <span>|</span>


<a href="../members/">{$templateconf.tourtxtmemberlogin}</a> <span>|</span>

{if in_array('news',$pluginsdata.plugins) && $pluginsdata.enabled.news == 1 }
<a href="{include file="$spath/general/pg_news.tpl"}" {if $item=='news'} class="hilite"{/if}>{$templateconf.tourtxtblog}</a> <span>|</span>
{/if}

{if $modelsCat}
<a href="{include file="$spath/general/pg_category.tpl" id=$modelsCat s="p" seoname=$modelsNode.SEOname[0] item=$modelsNode}" {if $item=='models'} class="hilite"{/if}>{$templateconf.tourtxtmodels}</a> <span>|</span>
{/if}

<a href="{$root.page.tour.JoinUrl}">{$templateconf.tourtxtjoin}</a>

</div>

<img src="images/menubar_bottom.gif" class="menubar_image" border="0" alt=""/>