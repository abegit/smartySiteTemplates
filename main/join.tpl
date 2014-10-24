{config_load file="static.tour.conf"}
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
<link rel="stylesheet" type="text/css" href="joinstyle.css" />

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

<!--Top Navbar-->
{include file="$tourname/topnav.tpl" item="models" pos=$key}



{** 

	NOTES FOR EDITING:
	------------------
	
	Instances of tags with "$templateconf" in them represent text or data that can be edited from inside the CMS admin panel.
	
	These fields support multi-language functionality.
	
	Edit the text for these tags under Plug-Ins/Template Fields in CMS admin.


**}


<br />

<div class="join_body_container">

	<div class="join_left">

		<div class="option_heading">{$templateconf.txtpaymenttype}</div>

		<div class="payment_option_wrapper">				
			<input type="radio"> {$templateconf.txtpaybycreditcard}
			<div class="payment_icon"><img src="images/join_images/credit.png" width="48" height="48"></div>
		</div>

		<div class="payment_option_wrapper">				
			<input type="radio"> {$templateconf.txtpaybycheck}
			<div class="payment_icon"><img src="images/join_images/check.png" width="48" height="48"></div>
		</div>
		
		<div class="payment_option_wrapper">
			<input type="radio"> {$templateconf.txtpaybyphone}
			<div class="payment_icon"><img src="images/join_images/mobile.png" width="48" height="48"></div>					
		</div>
		
		<div class="payment_option_wrapper">				
			<input type="radio"> {$templateconf.txtalternativepayment}
			<div class="payment_icon"><img src="images/join_images/alternative.png" width="48" height="48"></div>
		</div>
	</div>


	<div class="join_right">

		<div class="secure_wrapper">
		
			<div class="secure_badge"></div>
			
			<div class="secure_text">
				{$templateconf.txtsecure}<br>
				<span class="secure_text_2">{$templateconf.txtdiscreet}</span>
			</div>

		</div>

		<br clear="all" />

		{** Join Image **}		
		<div>
			{include file="$tourname/join_update.tpl" l="tour"}
		</div>

	</div>


	<div class="join_middle">

		<div class="option_heading">{$templateconf.txtmembershiptype}</div>

		<div class="membership_type_wrapper">				
			<input type="radio"> {$templateconf.txtpaymentoption1}
		</div>

		<div class="membership_type_wrapper">
			<input type="radio"> {$templateconf.txtpaymentoption2}
		</div>


		<a href="{$root.config.JoinUrl[0]}">
			<div class="join_submit_button">
				{$templateconf.txtjoinpagepurchase}
			</div>
		</a>
	</div>


	<br clear="all" />
	<br />
	
	{** More Updates **}
	{include file="$tourname/join_page_footer_updates.tpl"}
	
	<br clear="all" />
	<br />
	
	<div class="join_footer">		
		{$templateconf.txtbillingdetails}
	
		<br clear="all" />
		<br />
		
		{$templateconf.txtbillingsupport}
		
		<br clear="all" />
		<br />
		
		{$templateconf.txtbillingfooter}
	
	</div>

</div>
	
<!--Footer-->
<div class="footer">{include file="$tourname/footer.tpl"}</div>
