{include file='general/page_top.tpl'  item='custompages' title=$root.page.content.item[0].Title[0]}


<div class="wrapper" align="center">
{include file="$spath/general/header.tpl" item='listen'}


<div class="container content">
<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl" item='listen'}</div>



<table width="100%" cellpadding="2" cellspacing="0" border="0">
<tr>
<td valign="top" width="100%">
<!--Left Column-->

<!--Title-->
<div class="title_bar">Watch & Listen to RadioSuzy1 LIVE SHOWS Every Saturday Night! Since 1987</div>


{assign var="item" value=$root.page.content.item[0]}
{if isset($item)}

	<div class="custompages">
	{global get="image_folder" assign="image_folder"}
		
	
	<br>
	
	<!-- Extra Pages Entry-->
	<span class="custompages_info">
	
	
		<span class="custompages_info">
	
	
		{$item.Body[0]}
	
	
	<br>
	<br>

	
	</span>
	</div>
	
	
{/if}
	

</td>
<td valign="top">
<!--Right Column-->

{if ($root.page.mailinglist.item|@count > 0)}
<!--Mailing List-->
<div class="title_bar">{$templateconf.txtnewsletter}</div>
{include file="$spath/general/mailinglistform.tpl" item=$root.mailinglist.item }
<br>
{/if}

	
{** Should the banner code show? **}
{assign var="useb" value="0"}
{foreach from=$page.banners.banner item=banner}
 {if ($banner.ZoneId[0] == "custompages_suggested") && ($useb == "0")}
 {assign var="useb" value="1"}
		{/if}
{/foreach}

{** If a banner exists, show the spot for it **}
{if $useb == 1}
<!--Suggested Site-->
<div class="title_bar">{$templateconf.txtsuggestedsite}</div>
<div id="suggested_site_index">
{include file="$spath/general/showbanner.tpl" zone="custompages_suggested" allmodels="1" allcats="1"}
</div>
{/if}


<!--Twitter Posts-->
{if ($root.page.twitter|@count > 0)}
<div class="title_bar">{$templateconf.txtlatesttweets}</div>
{include file="$spath/general/twitter.tpl"}
<br />
	{/if}	
	
	
<br>
	
	
	
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
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl" item='listen'}</div>
