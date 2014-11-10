<div class="container header"><div class="site_logobar">

<a href="./">	<img src="http://drsusanblock.tv/main/images/drsusanblocktv.png" style="width: 300px; float:left;" height="57" width="300"></a>




<ul class="quicknav">
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

<li><a href="./" {if $item=='home' } class="hilite" {/if} ><i class="bono-lamp"></i>Home</a></li>


<li><a href="pages.php?id=drsuzytv" {if $item=='drsuzytv' } class="hilite" {/if} ><i class="bono-microphone"></i>LIVE</a></li>


{if isset($episodesCat)}
<li><a href="{include file="$spath/general/pg_category.tpl" id=$episodesCat seoname=$photosNode.SEOname[0] item=$episodesNode}" {if $item=='episodes' } class="hilite" {/if} ><i class="bono-ticket3"></i>{$templateconf.navtxtepisodes}</a></li>
{/if}
{if isset($photosCat)}
<li><a href="{include file="$spath/general/pg_category.tpl" id=$photosCat seoname=$photosNode.SEOname[0] item=$photosNode}" {if $item=='photos' } class="hilite" {/if} ><i class="bono-film3"></i>{$templateconf.navtxtphotos}</a></li>
{/if}

{if isset($clipsCat)}
<li>
<a href="{include file="$spath/general/pg_category.tpl" id=$clipsCat seoname=$photosNode.SEOname[0] item=$clipsNode}" {if $item=='clips' } class="hilite" {/if} ><i class="bono-film2"></i>{$templateconf.navtxtclips}</a></li>
{/if}



<!-- <li><a href="pages.php?id=listen" {if $item=='listen' } class="hilite" {/if} ><i class="bono-radio2"></i>Listen</a></li> --></ul>
	<div class="sublogo">
  Tune In Live Every <b>SATURDAY Night @ 10:30 PM</b> California Time on DrSuzy.tv!
</div>
</div></div>