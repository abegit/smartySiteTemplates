{include file='general/page_top.tpl'  item='custompages' title=$root.page.content.item[0].Title[0]}


<div class="wrapper" align="center">

<!--Header-->
{include file="$spath/general/header.tpl"}

<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl"  item='drsuzytv'}</div>




<table width="100%" cellpadding="2" cellspacing="0" border="0">
<tr>
<td valign="top" width="100%">
<!--Left Column-->

<!--Title-->
<div class="title_bar">{$root.page.content.item[0].Title[0]}</div>


{assign var="item" value=$root.page.content.item[0]}
{if isset($item)}

	<div class="custompages">
	{global get="image_folder" assign="image_folder"}
		
	
	<br>
	
	<!-- Extra Pages Entry-->
	<span class="custompages_info">
	
	
		{$item.Body[0]}
	
	
	<br>
	<br>


	<!--Number of Comments-->
	{if in_array('comments',$pluginsdata.plugins) && $item.NumComments[0]}

	
		{if $item.CommentNew[0] == 1 }
		<img src="{$image_folder}/icons/new.gif" />
		{/if}

	{/if}	
	
	
	
	<br><br /><hr class="custompages_hr" /><br>
	
	</span>
	</div>
	
	<!--Comments-->
	<div class="title_bar">{$templateconf.txtcomments|@strtoupper}</div>
	{include file="custompages/commentsui.tpl"}
{/if}


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


<br>

{if ($root.page.mailinglist.item|@count > 0)}
<!--Mailing List-->
<div class="title_bar">{$templateconf.txtnewsletter}</div>
{include file="$spath/general/mailinglistform.tpl" item=$root.mailinglist.item }
<br>
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
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl" item='drsuzytv'}</div>
