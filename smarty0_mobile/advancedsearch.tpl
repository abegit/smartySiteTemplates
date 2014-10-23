{include file='general/page_top.tpl' pagename="index" title = $templateconf.titletxtadvancedsearch }

{include file="general/topnav.tpl" item=search}


<!--Title Bar-->
<div id="section_title">{$templateconf.txtadvancedsearch}</div>

<!--Search Form-->
{include file="search/advancedsearch_box.tpl"}



<!--Footer-->
{include file="$spath/general/page_bottom.tpl" item=search}
