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

<TITLE>{$templateconf.tourtxttitle}</TITLE>
{** If SEO optimized URLs are enabled, use a base href **}
{if $root.seo_urls == "1"}
{assign var="areaurl" value=#areaurl#}
{assign var="areaurl" value=$areaurl|@full_url}
{global put="areaurl" value=$areaurl}
<base href="{$areaurl}" />
{/if}


<link rel="stylesheet" type="text/css" href="style.css" />

{** Code that shows the meta keywords and description on tour pages **}
{strip}
	{assign var="seokey"  value=$root.page.models.model.SEOkey[0]}
	{assign var="seodesc" value=$root.page.models.model.SEOdesc[0]}
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

<!-- JQuery include -->
<script type="text/javascript" src="js/jquery.min.js"></script>


<!--Page Top and Universal Navbar-->
{include file="$tourname/page_top.tpl" pos=$key}

<div class="wrapper" align="center">



<!--Header-->
{include file="$tourname/header.tpl" pos=$key}






<script>



cookiename = "ex_offers_{$root.page.offers.offer.Id[0]}"
cookieexp = {$root.page.offers.offer.CookieExpires[0]}
oid = {$root.page.offers.offer.Id[0]}

{literal}

function nothanks()
{
  exos = getCookie("ex_offers_thissesion");
  if (exos == undefined)
  {
    exos = 0;
  }
  exos = parseInt(exos);
  exos++;
  
  setCookie("ex_offers_thissesion", exos, 0);

  setCookie(cookiename, 1, cookieexp);
  document.location = "./";
  return;
}

function trackclick()
{
	var xmlhttp;
	if (window.XMLHttpRequest)
	{
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else if (window.ActiveXObject)
	{
		// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	else
	{
	     return true;
	}

	xmlhttp.open("GET","offers.php?track=" + oid,false);
	resp = xmlhttp.send(null);

	setCookie(cookiename, 1, cookieexp);
	return true
}

function setCookie(c_name,value,expiredays)
{
var exdate=new Date();
exdate.setDate(exdate.getDate()+expiredays);
document.cookie=c_name+ "=" +escape(value)+
((expiredays == 0) ? "" : ";expires="+exdate.toGMTString())+
";path=/";
}

function getCookie(c_name)
{
var i,x,y,ARRcookies=document.cookie.split(";");
for (i=0;i<ARRcookies.length;i++)
{
  x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
  y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
  x=x.replace(/^\s+|\s+$/g,"");
  if (x==c_name)
    {
    return unescape(y);
    }
  }
}

{/literal}

</script>



<div align="center" id="index_offer">


			{if $root.page.offers.offer.OfferType[0] == 0}
				{assign var="cdir" value=#contentdir#}

				{assign var="width" value=$root.page.offers.offer.Width[0]}
				{assign var="height" value=$root.page.offers.offer.Height[0]}

				<a target="_blank" href="{$root.page.offers.offer.URL[0]}" onclick="return trackclick()"><img 
				{if $width  != 0}width="{$width}"{/if}
				{if $height != 0}height="{$height}"{/if}
				src="{$cdir}/contentthumbs/{$root.page.offers.offer.Id[0]}-offer.jpg" /></a>
			{/if}
			{if $root.page.offers.offer.OfferType[0] == 1}
				{$root.page.offers.offer.Code[0]}
			{/if}

			<br />
<a class="index_offer_nothanks" href="javascript:nothanks()">{$root.page.templateconf.txtnothanks}</a>


</div>

</div>

<!--Footer-->




<!--Footer-->
<div class="footer">{include file="$tourname/footer.tpl"}</div>
