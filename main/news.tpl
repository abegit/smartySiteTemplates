{strip}
{if sizeof($root.page.content.item) ==1 && isset($root.page.content.item[0].Id) }
	{assign var="seokey"  value=$root.page.content.item[0].SEOkey[0]}
	{assign var="seodesc" value=$root.page.content.item[0].SEOdesc[0]}
{/if}
{/strip}{include file='general/page_top.tpl'  item='news' title=$templateconf.titletxtnews seokey=$seokey seodesc=$seodesc}


<div class="wrapper" align="center">

<!--Header-->
{include file="$spath/general/header.tpl"}

<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl"}</div>


<table width="100%" cellpadding="2" cellspacing="0" border="0">
<tr>
<td valign="top" width="100%">
<!--Left Column-->

<!--Title-->
{if $root.page.tag}
<div class="title_bar">{$templateconf.txtnewswith} '{$root.page.tag|@strtoupper}' {$templateconf.txttag}</div>
{else}
<div class="title_bar">{$templateconf.txtlatestnews}</div>
{/if}

<!--Page Navigation-->
{if sizeof($root.page.pages.page)>1}{include file="$spath/news/pagenav.tpl" }{/if}


<!--News-->
<div class="news">{include file="$spath/news/news1.tpl" }</div>





<!--Comments-->
{if sizeof($root.page.content.item) ==1 && isset($root.page.content.item[0].Id) && in_array('comments',$pluginsdata.plugins) && $pluginsdata.enabled.comments == 1 && $root.has_username}

<a name="comment"></a><div class="title_bar">{$templateconf.txtcomments|@strtoupper}</div>
 
{include file="news/commentsui.tpl"}

{/if}	



<!--Page Navigation-->
{if sizeof($root.page.pages.page)>1}{include file="$spath/news/pagenav.tpl" }{/if}


</td>
<td valign="top" class="right_col">
<!--Right Column-->

{if ($pluginsdata.enabled.contentasc == 1) && ($pluginsdata.enabled.ratings == 1) }
<!--Most Popular Girls-->
<div class="title_bar">{$templateconf.txtmostpopulargirls}</div>
{include file="$spath/general/toplist_models.tpl"}
{/if}



{if in_array('banners',$pluginsdata.plugins) && $pluginsdata.enabled.banners == 1 }
<!--Suggested Site-->
<div class="title_bar">{$templateconf.txtsuggestedsite}</div>
<div id="suggested_site_index">
{include file="$spath/general/showbanner.tpl" zone="news_suggested" allmodels="1" allcats="1"}
</div>

<br />
{/if}

{if in_array('mailinglist',$pluginsdata.plugins) && $pluginsdata.enabled.mailinglist == 1 }
<!--Mailing List-->
<div class="title_bar">{$templateconf.txtnewsletter}</div>
{include file="$spath/general/mailinglistform.tpl" item=$root.mailinglist.item }
<br />
{/if}

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