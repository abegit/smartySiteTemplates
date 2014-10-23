{include file='general/page_top.tpl' pagename="mailinglist" title=$templateconf.titletxtindex}

<div class="wrapper" align="center">

<!--Header-->
{include file="$spath/general/header.tpl"}


<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl"}</div>


<div align="center">{$root.page.message}</div>
	

</div>

<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl"}</div>
