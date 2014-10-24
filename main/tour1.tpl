{config_load file="static.tour.conf" scope="global"}
{** Code that overwrites the image folder if language is selected **}
{assign var="image_folder" value=#imagedir#}
{if isset($root.page.languages_attr[0].id)}
 {assign var="languageid" value=$root.page.languages_attr[0].id}
 {foreach from=$root.page.languages.language item=language}
 {if ($language.Id[0] == $languageid) && ($language.ImageFolder[0] != "")}
 {assign var="image_folder" value=$language.ImageFolder[0]}
 {/if}
 {/foreach}
{/if}
{global put="image_folder" value=$image_folder}
<!DOCTYPE html>
<HTML>
<HEAD>
{** If SEO optimized URLs are enabled, use a base href **}

{assign var="areaurl" value=#areaurl#}
{assign var="areaurl" value=$areaurl|@full_url}
{global put="areaurl" value=$areaurl}

{if $root.seo_urls == "1"}
<base href="{$areaurl}" />
{/if}
<TITLE>{$templateconf.tourtxttitle}</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
<meta name="RATING" content="RTA-5042-1996-1400-1577-RTA" />
<link rel="stylesheet" type="text/css" href="style.css" />

{** Code that shows the meta keywords and description on tour pages **}
{strip}
{assign var=seokey value=""}
{assign var=seodesc value=""}

{if isset($root.page.current)}
	{assign var=seokey value=$root.page.current.SEOkey[0]}
	{assign var=seodesc value=$root.page.current.SEOdesc[0]}
{/if}
	
{if $seokey}
	<meta name="keywords" content="{$seokey}" />
{elseif $templateconf.tourdefaultmetakeywords}
	<meta name="keywords" content="{$templateconf.tourdefaultmetakeywords}" />
{/if}
{if $seodesc}
	<meta name="description" content="{$seodesc}" />
{elseif $templateconf.tourdefaultmetadescription}
	<meta name="description" content="{$templateconf.tourdefaultmetadescription}" />
{/if}
{/strip}

<script>
dayslimit =  {$root.config.NumDaysLimit[0]};
maxClicks  = {$root.config.NumClickLimit[0]} ;
{literal}
ctlimit_name = 'tlimit';
function tlimit(){

	if(!(limit = getCookieTLimit(ctlimit_name))) //counter for this user doesn't exist
	{
		setCookieTLimit(ctlimit_name,1,dayslimit);
		return true;
	}
	else //counter for the user exist 
	{

		if(parseInt(getCookieTLimit(ctlimit_name)) == maxClicks) // the limit of the counter is reached 
		{
			window.location = {/literal}"{$root.page.tour.JoinUrl}";{literal}
			return false;
		}
		else	//increase the limit of the counter redirect to the members page  
		{
		
			setCookieTLimit(ctlimit_name,parseInt(getCookieTLimit(ctlimit_name))+1,dayslimit);
			return true;
		}
	}
}
	
	
function setCookieTLimit(c_name,value,expiredays)
{
	var exdate=new Date();
	exdate.setDate(exdate.getDate()+expiredays);
	document.cookie = c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString())+";path=/";
}

function getCookieTLimit(c_name)
{
	if (document.cookie.length !=0)
	  {
		  c_start=document.cookie.indexOf(c_name + "=");
		  if (c_start!=-1)
		    { 
		    	c_start=c_start + c_name.length+1; 
		    	c_end=document.cookie.indexOf(";",c_start);
		    if (c_end==-1) c_end=document.cookie.length;
		    return unescape(document.cookie.substring(c_start,c_end));
	    	} 
	  }
	return false;
}
</script>



<!-- JQuery include -->

<script type="text/javascript" src="js/jquery.min.js"></script>

<!-- jCarousel library -->
<script type="text/javascript" src="js/jquery.jcarousel.pack.js"></script>
<!-- jCarousel core stylesheet -->
<link rel="stylesheet" type="text/css" href="js/jquery.jcarousel.css" />
<!-- jCarousel skin stylesheet -->
<link rel="stylesheet" type="text/css" href="js/tango/skin.css" />

<!-- AutoComplete -->
<script type="text/javascript" src="js/jquery.autocomplete.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/jquery.autocomplete.css" />

{/literal}

{include file="$spath/$tourname/social_headers.tpl" title=$templateconf.tourtxttitle seokey=$seokey seodesc=$seodesc areaurl=$areaurl}

{if $templateconf.googleanalyticscode != ''}
<!-- Google Analytics code -->
{literal}
<script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', '{/literal}{$templateconf.googleanalyticscode}{literal}']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>
{/literal}
{/if}

</HEAD>


<BODY>
{if !empty($templateconf.splashtxtwarning)}
	{include file="$tourname/splash.tpl"}
{/if}

{if !isset($templateconf.tourtxttitle)}
 <div style="color:black; border:5px solid red; padding:20px; background-color:white; text-align:left;">
	 <b style="color:red;">Warning</b>: Template fields have not been set up for this area.
	 <br />Please go into your admin panel and make sure to fix any warnings that show up.
 </div>
{/if}




<!--Page Top and Universal Navbar-->
{include file="$tourname/page_top.tpl" pos=$key}

<div class="wrapper" align="center">


<!--Header-->
{include file="$tourname/header.tpl" pos=$key}



<!--Top Navbar-->
{include file="$tourname/topnav.tpl" pos=$key}





<div class="body">


{if !isset($root.page.current)}
<!--Most Popular Updates-->
<div class="most_popular_title">{$templateconf.txtmostpopularupdates}</div>
<div class="most_popular ">{include file="$tourname/toplist.tpl" pos=$key}</div>

<img src="images/rough_edge_bottom_title.gif" class="rough_edge_bottom_image" border="0" alt=""/>
{/if}




{if !isset($root.page.current)}
<!--Latest Updates-->
<div class="title_bar_center">{$templateconf.txtlatestupdates}</div>
{/if}


{if isset($root.page.current)}
{include file="$tourname/episode.tpl" item=$root.page.current}
{else}

<!--Update Episodes-->
{if isset($root.page.tourcontent.item)}
{foreach from=$root.page.tourcontent.item item="item" key="key"} 
{include file="$tourname/episode.tpl" item=$item}

<!--Text/Join Link Under Each Episode-->
{include file="$tourname/episode_undertext.tpl" pos=$key}
{/foreach}
{/if}
{/if}


<!--Upcoming Updates-->
{if !isset($root.page.current) && ($root.page.futurecontent.item|@count != 0)}


<script type="text/javascript">
{literal}
function mycarousel_initCallback(carousel)
{
    // Disable autoscrolling if the user clicks the prev or next button.
    carousel.buttonNext.bind('click', function() {
        carousel.startAuto(0);
    });

    carousel.buttonPrev.bind('click', function() {
        carousel.startAuto(0);
    });

    // Pause autoscrolling if the user moves with the cursor over the clip.
    carousel.clip.hover(function() {
        carousel.stopAuto();
    }, function() {
        carousel.startAuto();
    });
};

jQuery(document).ready(function() {
    jQuery('#mycarousel').jcarousel({
       auto: 0,
       // wrap: 'last',
	   visible: 3,
        initCallback: mycarousel_initCallback
    });
});

{/literal}
</script>


<!--Coming Soon Carousel-->
<div class="coming_soon_title_heading">{$templateconf.txtupcoming}</div>
<div class="coming_soon">
<ul id="mycarousel" class="jcarousel-skin-tango">
{foreach from=$root.page.futurecontent.item item=item}
<li class="coming_soon_item">{include file="$tourname/comingsoon_item.tpl" item=$item }</li>
{/foreach}

</ul>
</div>

<img src="images/rough_edge_bottom_title.gif" class="rough_edge_bottom_image" border="0" alt=""/>
 
<p>

{/if}


<!--Join/Next Page Links-->
<table align="center" cellspacing="2" cellpadding="2" border="0">
<tr>
<td><a href="{$root.page.tour.JoinUrl}"><img src="{$image_folder}/joinnow.png" width="400" height="150" alt="" border="0" /></a></td>


{if !isset($root.page.current)}

{if isset($root.page.pages.page) } 
{if $root.page.pages_attr[0].onpage < $root.page.pages.page|@count}
<td>{math equation="el1+1" el1=$root.page.pages_attr[0].onpage assign="p"}	
<a href="{include file="$tourname/pg_tour.tpl" page=$p}"><img style="margin-left:15px;" src="{$image_folder}/continue.png" width="400" height="150" alt="" border="0" /></a>
</td>
{/if}
{/if}
{/if}


</tr>
</table>




<!--More Updates-->
<div class="title_bar_center">{$templateconf.txtmoreupdates}</div>
{include file="$tourname/moreupdates.tpl"}
</div>

<p>

<a class="join_links_big" href="{$root.page.tour.JoinUrl}">{$templateconf.tourtxtjoinlink}</a>











<br />





</div>

<!--Footer-->
<div class="footer">{include file="$tourname/footer.tpl"}</div>
