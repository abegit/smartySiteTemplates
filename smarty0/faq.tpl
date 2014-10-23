{include file='general/page_top.tpl'  item='faq' title = $templateconf.navtxtfaq }

<div class="wrapper" align="center">

<!--Header-->
{include file="$spath/general/header.tpl"}


<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl"}</div>


<table width="100%" cellpadding="2" cellspacing="0">
<tr>
<td valign="top" width="100%">
<!--Left Column-->


<!--Title Bar-->
<div class="title_bar">{$templateconf.txtfaqs}</div>

<!--FAQ List-->
{include file="$spath/faq/faq1.tpl"}






</td>
<td valign="top" class="right_col">
<!--Right Column-->

{if ($pluginsdata.enabled.contentasc == 1) && ($pluginsdata.enabled.ratings == 1) }
<!--Most Popular Girls-->
<div class="title_bar">{$templateconf.txtmostpopulargirls}</div>
{include file="$spath/general/toplist_models.tpl"}
{/if}



{if $root.page.news.item|@count > 0}
<!--News-->
<div class="title_bar">{$templateconf.txtlatestnews}</div>
{include file="$spath/general/news_small.tpl"}
{/if}
<!--Suggested Site-->
<div class="title_bar_center">{$templateconf.txtsuggestedsite}</div>

<div id="suggested_site_index">
{include file="$spath/general/showbanner.tpl" zone="index_suggested"}
</div>


<br />

<!--Mailing List-->
<div class="title_bar">{$templateconf.txtnewsletter}</div>
{include file="$spath/general/mailinglistform.tpl" item=$root.mailinglist.item }


<br />

{if in_array('stats',$pluginsdata.plugins) && $pluginsdata.enabled.stats == 1 }
<!--Most Viewed Updates Toplist-->
<div class="title_bar">{$templateconf.txtmostviewed}</div>
{include file="$spath/general/toplist_stats.tpl"}
{/if}

{if in_array('ratings',$pluginsdata.plugins) && $pluginsdata.enabled.ratings == 1 }
<div class="title_bar">{$templateconf.txtmostpopularupdates}</div>
{include file="$spath/general/toplist_updates.tpl"}
{/if}




</td>
</tr>

</table>




</div>

<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl"}</div>


