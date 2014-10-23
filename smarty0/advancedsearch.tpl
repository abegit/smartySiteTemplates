{include file='general/page_top.tpl' pagename="index" title = $templateconf.titletxtadvancedsearch }


<div class="wrapper" align="center">
<div style="background:#100f10;padding: 20px 10px 30px; height:80px;">
<div id="header_ad">
{include file="$spath/general/headerbannerad.tpl" zone="header_ad" allmodels="1" allcats="1"}
</div>
	<img src="http://drsusanblock.tv/main/images/logo.png">
</div>



<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl"}</div>

<!--Title Bar-->
<div class="title_bar">{$templateconf.txtadvancedsearch}</div>

<!--Search Form-->
{include file="search/advancedsearch_box.tpl"}

</div>

<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl"}</div>
