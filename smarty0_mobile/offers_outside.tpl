{include file="$tourname/page_top.tpl"  title = $root.page.results.modelname[0] }

{include file="$tourname/topnav.tpl" item=$root.page.current}




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

{/literal}

</script>



<div align="center" id="index_offer">


			{if $root.page.offers.offer.OfferType[0] == 0}
				{assign var="cdir" value=#contentdir#}
				{assign var="width" value=$root.page.offers.offer.Width[0]}
				{assign var="height" value=$root.page.offers.offer.Height[0]}

				<a target="_blank" href="{$root.page.offers.offer.URL[0]}" onclick="return trackclick()"><img 
				style="max-width:320px;"
				src="{$cdir}/contentthumbs/{$root.page.offers.offer.Id[0]}-offer.jpg" /></a>
			{/if}
			{if $root.page.offers.offer.OfferType[0] == 1}
				{$root.page.offers.offer.Code[0]}
			{/if}

			<br />
<a class="index_offer_nothanks" href="javascript:nothanks()">{$root.page.templateconf.txtnothanks}</a>


</div>





{include file="$tourname/page_bottom.tpl"}
