{** Getting the List of categories available **} 
{foreach from=$categories item=cat}
{foreach from=$cat.cats.cat item=cat2 }
{if ($cat2.Title[0] == 'Models') || ($cat2.MainLanguage_Title[0] =='Models' )}
	{assign var="modelsCat" value=$cat2.Id[0]}
	{assign var="modelsNode" value=$cat2}
{/if}
{if ($cat2.Title[0] == 'Photos') || ($cat2.MainLanguage_Title[0] =='Photos' )}
	{assign var="photosCat" value=$cat2.Id[0]}
	{assign var="photosNode" value=$cat2}
{/if}
{if ($cat2.Title[0] == 'Movies') || ($cat2.MainLanguage_Title[0] =='Movies' )}
	{assign var="moviesCat" value=$cat2.Id[0]}
	{assign var="moviesNode" value=$cat2}
{/if}
{/foreach}
{/foreach}
{** End Getting the categories available **} 

{if $position == "bottom"}
 {assign var="searchpos" value="bot"}
{else}
 {assign var="searchpos" value="top"}
{/if}


<ul class="quicknav" id="nav">
{foreach from=$categories item=cat}
{foreach from=$cat.cats.cat item=cat2 }
{if ($cat2.Title[0] == 'Models') || ($cat2.MainLanguage_Title[0] =='Models' )}
	{assign var="modelsCat" value=$cat2.Id[0]}
	{assign var="modelsNode" value=$cat2}
{/if}
{if ($cat2.Title[0] == 'Photos') || ($cat2.MainLanguage_Title[0] =='Photos' )}
	{assign var="photosCat" value=$cat2.Id[0]}
	{assign var="photosNode" value=$cat2}
{/if}
{if ($cat2.Title[0] == 'Movies') || ($cat2.MainLanguage_Title[0] =='Movies' )}
	{assign var="moviesCat" value=$cat2.Id[0]}
	{assign var="moviesNode" value=$cat2}
{/if}
{if ($cat2.Title[0] == 'Episodes') || ($cat2.MainLanguage_Title[0] =='Episodes' )}
	{assign var="episodesCat" value=$cat2.Id[0]}
	{assign var="episodesNode" value=$cat2}
{/if}
{if ($cat2.Title[0] == 'Clips') || ($cat2.MainLanguage_Title[0] =='Clips' )}
	{assign var="clipsCat" value=$cat2.Id[0]}
	{assign var="clipsNode" value=$cat2}
{/if}
{/foreach}
{/foreach}

<li><a href="pages.php?id=listen" {if $item=='listen' } class="hilite" {/if} ><i class="bono-microphone"></i>Live</a></li>

{if isset($clipsCat)}
<li><a href="{include file="$spath/general/pg_category.tpl" id=$clipsCat seoname=$photosNode.SEOname[0] item=$clipsNode}" {if $item=='clips' } class="hilite" {/if} ><i class="bono-film2"></i>{$templateconf.navtxtclips}</a></li>
{/if}

{if isset($episodesCat)}
<li><a href="{include file="$spath/general/pg_category.tpl" id=$episodesCat seoname=$photosNode.SEOname[0] item=$episodesNode}" {if $item=='episodes' } class="hilite" {/if} ><i class="bono-ticket3"></i>{$templateconf.navtxtepisodes}</a></li>
{/if}
{if isset($photosCat)}
<li><a href="{include file="$spath/general/pg_category.tpl" id=$photosCat seoname=$photosNode.SEOname[0] item=$photosNode}" {if $item=='photos' } class="hilite" {/if} ><i class="bono-film3"></i>{$templateconf.navtxtphotos}</a></li>
{/if}



	{strip}
	<li><a href="./?mobile=0">
		{$templateconf.txtviewfullsite}
	</a></li>	
	{/strip}
	
</ul>

