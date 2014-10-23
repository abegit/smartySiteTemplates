{** Globals File - DO NOT REMOVE **}
{include file="$tourname/page_top.tpl"  title = $root.page.results.modelname[0] }
{include file="$tourname/topnav.tpl" item=$root.page.current}

{** 

NOTES FOR EDITING:
------------------

Instances of tags with "$templateconf" in them represent text or data that can be edited from inside the CMS admin panel.

These fields support multi-language functionality.

Edit the text for these tags under Plug-Ins/Template Fields in CMS admin.


 **}

<div class="join_body_container">

		<div class="secure_wrapper">
		
			<div class="secure_badge"></div>
			
			<div class="secure_text">
				{$templateconf.txtsecure}<br />
				<span class="secure_text_2">{$templateconf.txtdiscreet}</span>
			</div>

		</div>

	<br clear="all" />


		<div class="option_heading">{$templateconf.txtpaymenttype}</div>


		<div class="payment_option_wrapper">				
			<input type="radio"> {$templateconf.txtalternativepayment}
			<div class="payment_icon"><img src="images/join_images/alternative.png" width="48" height="48"></div>
		</div>






	<br clear="all" />
	<br />






		<div class="option_heading">{$templateconf.txtmembershiptype}</div>

		<div class="membership_type_wrapper">				
			<input type="radio"> {$templateconf.txtpaymentoption1}
		</div>

		<div class="membership_type_wrapper">
			<input type="radio"> {$templateconf.txtpaymentoption1}
		</div>


		<div class="join_submit_button_wrapper a">
		<a href="{$root.config.JoinUrl[0]}">
			<div class="join_submit_button">
				{$templateconf.txtjoinpagepurchase}
			</div>
		</a>
		</div>

	
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

	<br />

{include file="$tourname/page_bottom.tpl"}
