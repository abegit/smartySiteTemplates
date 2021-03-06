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

<style>
{literal}
/* SPLASH PAGE POPUP WINDOW - ADULT CONTENT AGE WARNING */

.splash_popup_wrapper {
width:100%;
text-align:left; 
position:relative;
margin:0px auto;
}

.splash_header {
margin:2px;
line-height:50px;
font-family:Arial;
font-size:26px;
font-weight:bold;
color:#FFFFFF;
text-align:center;
vertical-align:middle;
background-color:#272626;
}

.red {
color:#FF0000;
}

.splash_warning_wrapper {
width:550px;
margin-left:auto;
margin-right:auto;
}

.splash_warning_title {
margin-top:20px;
font-family:Arial;
font-size:16px;
font-weight:bold;
color:#000000;
text-align:center;
vertical-align:middle;
}

.splash_warning_icon {
float:left;
width:30px;
height:30px;
margin:10px;
background-image: url(images/splash_images/warning_icon.png);
}

.splash_warning_message {
width:85%;
height:310px;
margin-bottom:8px;
padding:10px;
border:2px solid;
border-color:#C3C3C3;
}

.exit {
color:#000000;
text-decoration:underline;
}

.enter {
width:278px;
margin-left:auto;
margin-right:auto;
}

.enter a {
text-decoration:none;
}

.enter_button {
margin-top:10px;
width:278px;
height:66px;
line-height:66px;
text-align:center;
font-family:Arial;
font-size:28px;
font-weight:bold;
text-decoration:none;
color:#FFFFFF;
background-image: url(images/splash_images/enter_button.png);
}

.enter_button:hover {
filter:alpha(opacity=70);
-moz-opacity:0.7;
-khtml-opacity: 0.7;
opacity: 0.7;
}




/************** DO NOT RENAME - BACKUP BEFORE EDITING *******************/


#mask {
	background: rgb(0,0,0); /* The Fallback */
	background:rgba(0,0,0,0.95) repeat;
	position: fixed; left: 0; top: 0; 
	z-index: 10;
	width: 100%; height: 100%;
	z-index: 200;
}

.login-popup {
	line-height:18px;
	color:#000000;
	width:740px;
	padding:0;
	min-height:588px;
	background: #D9D9D9;
	padding:0; 	
	float: left;
	text-align:center;
	position: fixed;
	top: 50%;
	left: 50%;
	z-index: 99999;
	box-shadow: 0 0px 15px rgba(0,0,0,0.4);
	-moz-box-shadow: 0 0px 15px rgba(0,0,0,0.4);
	-webkit-box-shadow: 0 0px 15px rgba(0,0,0,0.4);
	margin-top: -306px;
	margin-left: -382px;
}
{/literal}
</style>

<script>
{literal}


$(document).ready(function() {

	/** Splash page stuff **/

	$(window).load(function() {

		try
		{
			// If there's no mask, don't run any of this code.
			if ($('#mask').size() == 0)
			{
				$('#login-box').attr('closed', 1);
				return false;
			}
			
			// If there's a warning cookie in place, fade out the mask.
			var warn=getCookie("warn");
			if (warn!=null && warn!="")
			{
				$('#mask').fadeOut('100');
				$('#login-box').attr('closed', 1);
				return false;
			}		
			
			//Fade in the Popup
					
			if ($('#login-box').attr('closed') != "1")
			{
				$('#login-box').fadeIn(300);
			}
			
			return false;
		}
		catch(e)
		{		
			alert("Error: " + e.message + ".");
			$('#mask').fadeOut('100');
			$('#login-box').attr('closed', 1);
			return false;
		}

	});
	
	// When clicking on the button close or the mask layer the popup closed
	$('a.close').click(function() { 

      $('#login-box').attr('closed', 1);

	  $('#mask , .login-popup').fadeOut(300 , function() {
		 setCookie("warn",1,30);
	     $('#mask').remove();
	  });
	  return false;
	});
	
});

{/literal}
</script>


	<div id="mask"></div>
	
	
	<div class="splash_popup_wrapper">
	
	    <div id="login-box" class="login-popup"
			{if (($cachestore == "html") || $smarty.cookies.warn)}
				style="display:none;"
			{/if}
	    >
	
			<div class="splash_header">
			
				<div class="splash_warning_wrapper">
				
					<div class="splash_warning_icon"></div>
				
					<span class="red">	{$templateconf.splashtxtwarning}</span>
					
					{$templateconf.splashtxtadultsonly}
					
				</div>
			
			</div>
	
			<div class="splash_warning_title">{$templateconf.splashtxtheading}</div>
			
			<br />
			
			<textarea class="splash_warning_message" readonly>{$templateconf.splashtxtmessage}</textarea>
			
			<div class="enter">
				<a href="#" class="close"><div class="enter_button">{$templateconf.splashtxtenter}</div></a>
			</div>
			
			<br />
			{$templateconf.splashtxtdisagree} <a href="http://www.google.com" class="exit">{$templateconf.splashtxtexit}</a>
		
		</div>		
	</div>

{/if}
