{global get="image_folder" value=image_folder}

{** If SEO optimized URLs are enabled, use a base href **}

{assign var="areaurl" value=#areaurl#}
{assign var="areaurl" value=$areaurl|@full_url}
{global put="areaurl" value=$areaurl}
{if $root.seo_urls == "1"}
<base href="{$areaurl}" />
{/if}

{assign var="go" value=0}
{foreach from=$root.page.movietabs.item item="mtab" key="k"} 
	{if $root.page.settype[0]==$mtab } {assign var="go" value=1} {/if}
{/foreach}
{if $go==1 }
	{capture assign="title"}
		{$root.page.contentgroup.Title[0]} - {$templateconf.txtMovies} 
	{/capture} 
{else}
	{capture assign="title"}
		{$root.page.contentgroup.Title[0]} - {$templateconf.txtphotogallery}
	{/capture}
{/if}


{** Code that shows the meta keywords and description on tour pages **}
{strip}
	{assign var=seokey value=$root.page.contentgroup.SEOkey[0]}
	{assign var=seodesc value=$root.page.contentgroup.SEOdesc[0]}
	{if $seokey}
		<meta name="keywords" content="{$seokey}" />
	{elseif $templateconf.tourdefaultmetakeywords}
		<meta name="keywords" content="{$templateconf.tourdefaultmetakeywords}" />
	{/if}
	{if $seodesc}
		<meta name="description" content="{$seodesc}" />
	{elseif $templateconf.tourdefaultmetadescription}
		<meta name="description" content="{$tmpleateconf.tourdefaultmetadescription}" />
	{/if}
{/strip}

{include file="$spath/$tourname/social_headers.tpl" title=$title seokey=$seokey seodesc=$seodesc areaurl=$areaurl}

{literal}
<!--JS required by rating form-->
<script type="text/JavaScript">
function frmsubmit(u, v) {
if (document.all)	{
u.form.submit()
} else {
document.forms[v].submit()
}
}
{/literal}
{literal}
function trialfail()
{
  document.location = "{/literal}{$root.page.trial.VideoURL[0]}"
  return false
}
</script>




<title>{$title}</title>

<script>
dayslimit =  {$root.config.NumDaysLimit[0]};
maxClicks  = {$root.config.NumClickLimit[0]} ;

{literal}
ctlimit_name = 'tlimit';
function tlimit(){

	if (maxClicks == "0")
	{
		return true;
	}

	if(!(limit = getCookieTLimit(ctlimit_name))) //counter for this user doesn't exist
	{
		setCookieTLimit(ctlimit_name,1,dayslimit);
		return true;
	}
	else //counter for the user exist 
	{

		if(parseInt(getCookieTLimit(ctlimit_name)) >= maxClicks) // the limit of the counter is reached 
		{
	        document.getElementById('preview').style.display = 'none';
			document.getElementById('hpromo').style.display = 'block';
			document.getElementById("clicksremaining").innerHTML = "0";

//			window.location = {/literal}"{$root.page.tour.JoinUrl}";{literal}
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

{/literal}
</script>


<link rel="stylesheet" type="text/css" href="style.css" />


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

<!--Page Top and Universal Navbar-->
{include file="$tourname/page_top.tpl" pos=$key}

{literal}
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
{/literal}

<div class="wrapper" align="center">



<!--Header-->
{include file="$tourname/header.tpl" pos=$key}



<!--Top Navbar-->
{include file="$tourname/topnav.tpl" item="" pos=$key}

<div class="body">


<!--Update Episode-->
{include file="$tourname/episode_trailer.tpl" item=$root.page.current}



<!--More Updates-->
<div class="title_bar_center">{$templateconf.txtmoreupdates}</div>
{include file="$tourname/moreupdates.tpl"}
</div>

<p>


<a class="join_links_big" href="{$root.page.tour.JoinUrl}">{$templateconf.tourtxtjoinlink}</a>

<p>


<!--Page Navigation-->
{if count($root.page.pages.page)>1 }{include file="category_outside/pagenav.tpl"}{/if}


<br />




</div>
</div>



<!--Footer-->
<div class="footer">{include file="$tourname/footer.tpl"}</div>
