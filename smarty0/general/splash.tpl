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
.container.header, #universal_navbar {position: relative; z-index: 90;}
.container.content {position: relative; z-index: 20;}

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
width: 90%;
height: 210px;
margin-bottom: 8px;
padding: 10px;
margin-top: 10px;
border: 2px solid;
border-color: #C3C3C3;
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
margin-top: 10px;
width: 278px;
height: 66px;
line-height: 66px;
text-align: center;
font-family: Arial;
font-size: 28px;
font-weight: bold;
text-decoration: none;
color: #FFFFFF;
background: rgb(133, 0, 0);
border-radius: 14px;
box-shadow: inset 0 -12px 20px rgb(182, 0, 0);
filter:alpha(opacity=70);
-moz-opacity:0.7;
-khtml-opacity: 0.7;
opacity: 0.7;
}

.enter_button:hover {
filter:alpha(opacity=100);
-moz-opacity:1;
-khtml-opacity: 1;
opacity: 1;
}




/************** DO NOT RENAME - BACKUP BEFORE EDITING *******************/


#mask {
	background:rgba(0,0,0,.8);
	position: absolute; left: 0; top: 0; 
	z-index: 10;
	width: 100%; height: 100%;
	z-index: 50;
}
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html, body{
  background: linear-gradient(to bottom, rgb(30,30,33), rgb(23,23,27));
  height: 100%;
}

.center{
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%,-50%);
  transform: translate(-50%,-50%);
}

.bouncywrap{
  position: relative;
}


.dotcon{
  display: block;
  float: left;
  width: 50px;
  position: absolute;
}

.dc1{
  -webkit-animation: bouncy1 1.5s infinite;
  left: -40px;
  animation: bouncy1 1.5s infinite;
}

.dc2{
  -webkit-animation: bouncy2 1.5s infinite;
  animation: bouncy2 1.5s infinite;
  left: 0;
}

.dc3{
  -webkit-animation: bouncy3 1.5s infinite;
  animation: bouncy3 1.5s infinite;
  left: 40px;
}

.dot{
  height: 10px;
  width: 10px;
  border-radius: 50%;
  background: red;
}


@-webkit-keyframes bouncy1{
  0% {-webkit-transform: translate(0px,0px) rotate(0deg);}
  50% {-webkit-transform: translate(0px,0px) rotate(180deg);}
  100% {-webkit-transform: translate(40px,0px) rotate(-180deg);}
}

@keyframes bouncy1{
  0% {transform: translate(0px,0px) rotate(0deg);}
  50% {transform: translate(0px,0px) rotate(180deg);}
  100% {transform: translate(40px,0px) rotate(-180deg);}
}

@-webkit-keyframes bouncy2{
  0% {-webkit-transform: translateX(0px);}
  50% {-webkit-transform: translateX(-40px);}
  100% {-webkit-transform: translateX(-40px);}
}

@keyframes bouncy2{
  0% {transform: translateX(0px);}
  50% {transform: translateX(-40px);}
  100% {transform: translateX(-40px);}
}

@-webkit-keyframes bouncy3{
  0% {-webkit-transform: translateX(0px);}
  50% {-webkit-transform: translateX(0px);}
  100% {-webkit-transform: translateX(-40px);}
}

@keyframes bouncy3{
  0% {transform: translateX(0px);}
  50% {transform: translateX(0px);}
  100% {transform: translateX(-40px);}
}

.login-popup {
	line-height:18px;
	color:#000000;
	width:740px;
	padding:0;
	min-height:588px;
	background: #4B4B4B;
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
		if (jQone('#mask').size() == 0)
		{
			jQone('#login-box').attr('closed', 1);
			return false;
		}
		
		// If there's a warning cookie in place, fade out the mask.
		var warn=getCookie("warn");
		if (warn!=null && warn!="")
		{
			jQone('#mask').fadeOut('100');
			jQone('#login-box').attr('closed', 1);
			return false;
		}		
		
		//Fade in the Popup
				
		if (jQone('#login-box').attr('closed') != "1")
		{
			jQone('#login-box').fadeIn(300);
		}
		return false;
	});
	
	// When clicking on the button close or the mask layer the popup closed
	jQone('a.close').click(function() { 

      jQone('#login-box').attr('closed', 1);

	  jQone('#mask , .login-popup').fadeOut(300 , function() {
		 setCookie("warn",1,30);
	     jQone('#mask').fadeOut('1000');
	  });
	  return false;
	});
	
});

{/literal}
</script>


	
	
	
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
			<img src="/members/join.jpg" style="float:left;width:50%;margin-right: 1%;">
<div style="width:49%;float:right;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;padding: 0 20px;">
								<img src="http://drsusanblock.tv/main/images/drsusanblocktv.png" style="width: 190px; text-align: center; display: inline-block; margin-top: 20px; ">
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
	</div>

{/if}