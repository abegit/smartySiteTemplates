{** 

	NOTES FOR EDITING:
	------------------
	
	Instances of tags with "$templateconf" in them represent text or data that can be edited from inside the CMS admin panel.
	
	These fields support multi-language functionality.
	
	Edit the text for these tags under Plug-Ins/Template Fields in CMS admin.

**}


{** 
	This div will mask the whole page
	The IF condition here is based on what's being stored in caching.
	If HTML is being stored, always show the HTML div. Otherwise, only show the div if warn hasn't already been selected.
**}

{if ($cachestore == "html") || (($cachestore != "html") && !$smarty.cookies.warn)}

<script>
{literal}


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
if (document.cookie.length>0)
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
return "";
}
var jQone = jQuery.noConflict();
jQone(document).ready(function() {

	/** Splash page stuff **/
	jQone(window).load(function() {

		// If there's no mask, don't run any of this code.
		if (jQone('#splash').size() == 0)
		{
			jQone('#splash').attr('closed', 1);
			return false;
		}
		
		// If there's a warning cookie in place, fade out the mask.
		var warn=getCookie("warn");
		if (warn!=null && warn!="")
		{
			jQone('#splash').fadeOut('100');
			jQone('#splash').attr('closed', 1);
			return false;
		}		
		
		//Fade in the Popup
		if (jQone('#splash').attr('closed') != "1")
		{
			jQone('#splash').fadeIn(300);

		}
		return false;
	});		

	// When clicking on the button close or the mask layer the popup closed
	jQone('a.close').click(function() { 
      jQone('#splash').attr('closed', 1);
			jQone('#splash').fadeOut(1500 , function() {
		 setCookie("warn",1,30);
	  });
	  return false;
	});

});
{/literal}
</script>


	<div class="popup_wrapper" id="splash" {if (($cachestore == "html") || $smarty.cookies.warn)}
				style="display:none;"
			{/if} >
		
	    <div class="popup">
	
			<div class="header">
			
				<div class="splash_warning_wrapper">
				
					<span class="red">	{$templateconf.splashtxtwarning}</span>
					
					{$templateconf.splashtxtadultsonly}
					
				</div>
			
			</div>
			<img src="img/join.jpg" style="float:left;width:50%;margin-right: 1%;">
<div style="width:49%;float:right;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;padding: 0 20px;">
								<img src="http://drsusanblock.tv/main/images/drsusanblocktv.png" style="width: 190px; text-align: center; display: inline-block; margin-top: 20px; ">
								<div class="splash_warning_title">{$templateconf.splashtxtheading}</div>
								
								<br />
								
								<textarea class="splash_warning_message" readonly>18 U.S.C. 2257 STATEMENT
All individuals shown on this web site are 18 years of age or older and are not paid as models, actors or producers. They are the interview guests and audience members of the Dr. Susan Block Show, a Public ( not for profit) Access Community TV service, part of a personal 10 year reasearch project of Dr. Susan Block. Documentation relevent to 18 U.S.C. 2257 is maintained by The Custodian of Records at 8306 Wilshire Blvd, Beverly Hills, California 90211. Some visual depictions of actual sexually explicit conduct appearing on this website are from private archives prior to July 3, 1995 and are exempt from the requirements of 18 U.S.C. 2257 and 28 C.F. R. 75 and updates. The date of reproduction or republication of non-exempt visual depictions of actual sexually explicit conduct is current as of the date of the visitor's entry into this! website.

 

PRIVACY POLICY
We protect the private rights and confidentiality of all our clients, readers, subscribers, contributors, confidential sources, and patients to the full extent of the law. Should you have any questions please call us at: 1 (213) 291-9497


COPYRIGHTS & INTELLECTUAL PROPERTIES
Some parts of this website are copyrighted by individual artists, writers, performers and educators, and cannot be used without their permission. For clearance and permission to use any material herein, please call Jay Gardner, Jr. in SBI Business Affairs at 213.749.1330. Our purpose is to disseminate and inseminate information as freely as possible. We make it easy for you. Just call us or e-mail us at rights@blockbooks.com

 

DISCLAIMERS
This site is neither endorsed, nor sponsored by, nor a ffiliated with HBO. HBO® and Radio Sex TV® (starring D r. Susan Block ) and Radio Sex TV2: Off the Dial® ( starring Dr. Susan Block ) are registered trademarks of HBO. This site is neither endorsed, nor sponsored by, nor affiliated with Yale University. Yale ® and Yale University ® and Lux et Veritas ® are registered trademarks of Yale University. Dr. Susan Block graduated with a bachelor's degree from Yale University magna cum laude in 1977</textarea>
								
								<div class="enter">
									<a href="#" class="close"><div class="enter_button">{$templateconf.splashtxtenter}</div></a>
								</div>
								
								<br />
								{$templateconf.splashtxtdisagree} <a href="http://www.recreatingwithkids.com/wp-content/uploads/2012/01/Great-Outdoors-1024x768.jpg" class="exit">{$templateconf.splashtxtexit}</a>
								</div>
		
		</div>
	</div>
<div class="popup_wrapper" id="advsearch" style="display:none;">
	<div class="popup">
	    	<div class="header">Advanced Search <a href="#" id="close">Close</a></div>
    	{include file="$spath/general/toplist_models.tpl"}
		{include file="search/advancedsearch_box.tpl"}

	    </div>	
</div>
{/if}