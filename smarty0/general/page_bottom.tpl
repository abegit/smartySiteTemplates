
<span id="footer">

<div class="info">

	<img src="http://drsusanblock.tv/main/images/drsusanblocktv.png" style="width: 180px; float:left;" height="34" width="180">
{strip}
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

<li><a href="./" {if $item=='home' } class="hilite" {/if} >Home</a></li>


<li><a href="pages.php?id=drsuzytv2" {if $item=='drsuzytv' } class="hilite" {/if} >LIVE</a></li>


{if isset($episodesCat)}
<li><a href="{include file="$spath/general/pg_category.tpl" id=$episodesCat seoname=$photosNode.SEOname[0] item=$episodesNode}" {if $item=='episodes' } class="hilite" {/if} >{$templateconf.navtxtepisodes}</a></li>
{/if}
{if isset($photosCat)}
<li><a href="{include file="$spath/general/pg_category.tpl" id=$photosCat seoname=$photosNode.SEOname[0] item=$photosNode}" {if $item=='photos' } class="hilite" {/if} >{$templateconf.navtxtphotos}</a></li>
{/if}

{if isset($clipsCat)}
<li>
<a href="{include file="$spath/general/pg_category.tpl" id=$clipsCat seoname=$photosNode.SEOname[0] item=$clipsNode}" {if $item=='clips' } class="hilite" {/if} >{$templateconf.navtxtclips}</a></li>
{/if}

<li><a href="search.php?" {if $item=='search' } class="hilite" {/if} >Search</a></li>

<!-- <li><a href="pages.php?id=listen" {if $item=='listen' } class="hilite" {/if} ><i class="bono-radio2"></i>Listen</a></li> --></ul>
</div>
{/strip}


<div class="totals">
{if $h2}
<strong>{$h2}</strong>&nbsp;{$templateconf.tourtxthighresphotos}
{/if}

{if $h2 && ($h1 || $h3)}
, 
{/if}

{if $h3}
<strong>{$h3}</strong>&nbsp;{$templateconf.tourtxtfulllengthmovies}
{/if}

{if $h1 && ($h2 || $h3)}
, 
{/if}

{if $h1}
<strong>{$h1}</strong> + {$templateconf.tourtxthotgirls}
{/if}

</div>





<br />

{** The code below embeds a Template Field so that a 2257 link can be edited from within the admin panel under Plug-Ins/Template Fields **}

{** The following if statement displays a 2257 link only if one has been entered for the 2257url Template Field in the admin panel **}


<!--
{** This adds the text specified in the contacttext Template Field in the admin panel **}
{$templateconf.contacttext}

 {** This adds the URL specified in the contactemailurl Template Field in the admin panel **}
{if $templateconf.contactemailurl != ''}
&nbsp;<a class="footer_link" href="{$templateconf.contactemailurl}">{$templateconf.contactemail}</a>
{/if} -->

{** This adds anything specified in the feedbacklink1 Template Field in the admin panel **}
{if $templateconf.feedbacklink1}&nbsp;&nbsp;&nbsp;{$templateconf.feedbacklink1}{/if}


{** This adds anything specified in the feedbacklink2 Template Field in the admin panel **}
{if $templateconf.feedbacklink2}&nbsp;&nbsp;&nbsp;{$templateconf.feedbacklink2}{/if}

<br />

{if $templateconf.subfootertext != ''}
<span class="subfooter">{$templateconf.subfootertext}</span>
{/if}


<br />

 <a class="footer_link" href="{$templateconf.usc2257}">{$templateconf.usc2257linktext}</a>

<br />
<br />

</span>





<!-- Start of StatCounter Code for Default Guide -->
<script type="text/javascript">
var sc_project=8070905;
var sc_invisible=1;
var sc_security="91b71359";
var sc_https=1;
var scJsHost = (("https:" == document.location.protocol) ?
"https://secure." : "http://www.");
document.write("<sc"+"ript type='text/javascript' src='" +
scJsHost +
"statcounter.com/counter/counter.js'></"+"script>");</script>
<noscript><div class="statcounter"><a title="web statistics"
href="http://statcounter.com/free-web-stats/"
target="_blank"><img class="statcounter"
src="https://c.statcounter.com/8070905/0/91b71359/1/"
alt="web statistics"></a></div></noscript>
<!-- End of StatCounter Code for Default Guide -->

		<!-- JS -->
		<script src="js/jquery-1.js"></script>
		
		<!-- iosSlider plugin -->
		<script src="js/script.js"></script>
</body>
</html>
