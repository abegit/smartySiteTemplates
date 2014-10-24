{strip}
<span id="footer">

<div class="info">

	<img src="http://drsusanblock.tv/main/images/drsusanblocktv.png" style="width: 180px; float:left;" height="34" width="180">

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

<style>
	{literal}
/*
----------------------------------------------------------------------------------
Default css 
----------------------------------------------------------------------------------
*/

/* Reset all of the document's element styles to zero... */

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, font, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	font-size: 100%;
	vertical-align: baseline;
	background: transparent;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}

/* remember to define focus styles! */
:focus {
	outline: 0;
}

/* remember to highlight inserts somehow! */
ins {
	text-decoration: none;
}
del {
	text-decoration: line-through;
}

/* tables still need 'cellspacing="0"' in the markup */
table {
	border-collapse: collapse;
	border-spacing: 0;
}



/* Clearing Floats Class STARTS */
.Wrapper {
	display: inline-block;}
.Wrapper:after {
	Content: "."; display: block; height: 0; clear: both; visibility: hidden;}
* html .Wrapper {
	height: 1%; }
.Wrapper {
	display: block;}
/* Clearing Floats Class ENDS  */





/*  */

.hide, .Hide {
	display: none;}
.clear {
	width: 100%; height: 1px; clear: both; display: block; overflow: hidden;}
			

	.iosSlider {
	position: relative;
	top: 0;
	left: 0;
	overflow: hidden;
	width: 1000px;
	height: 300px;
}

.iosSlider .slider {
	width: 100%;
	height: 100%;
}

.iosSlider .slider .item {
	float: left;
	width: 1000px;
	height: 300px;
	left:23552px;
	background-position: center center;
	background-size:cover;
	background-color:#333;
}
	{/literal}
		</style>
		
		<!-- JS -->
		<script src="js/jquery-1.js"></script>
		
		<!-- iosSlider plugin -->
		<script src="js/ioss.js"></script>
		
<script>
{literal}
var braek = jQuery.noConflict();
braek(document).ready(function() {
				
	var arrayOfImages = new Array();
	var bufferDistance = 4;

	braek('.iosSlider').iosSlider({
		snapToChildren: true,
		desktopClickDrag: true,
		autoSlide: true,
		autoSlideTimer: 4000,
		autoSlideTransTimer: 2000,
		autoSlideHoverPause: false,
		infiniteSlider: true,
		navNextSelector: "span.prev",
		navPrevSelector: "span.next",
		onSlideChange: function(args) {
			
			braek('.item:eq(' + (args.currentSlideNumber + bufferDistance - 2) + ')').addClass('item' + (args.currentSlideNumber + bufferDistance - 1));
			
		}
	});
}); 
		
{/literal}
</script>
<script>
{literal}
var braekon = jQuery.noConflict();
braekon(document).ready(function() {
	/** Splash page stuff **/
	braekon(window).load(function() {
		// When clicking on the button close or the mask layer the popup closed
		braekon('a#searchbtn').click(function() { 
			var X=braekon(this).attr('closed');
		      if(X==1){
		        braekon("#advsearch").hide();
		        braekon(this).attr('closed', '0');
		      } else {
		        braekon("#advsearch").show();
		        braekon(this).attr('closed', '1');
		      }
			return false;
		});
	});
});
{/literal}
</script>
</body>
</html>
{/strip}