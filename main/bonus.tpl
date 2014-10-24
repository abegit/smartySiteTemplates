{strip}

	{if $root.page.bonuscat[0] == 1 }
		{assign var="title" value=$templateconf.navtxtbonussites}{assign var="navbar" value="bonussites"}
	{elseif $root.page.bonuscat[0] == 2 }
		{assign var="title" value=$templateconf.navtxtvideofeeds}
		{assign var="navbar" value="bonusfeeds"}
	{elseif $root.page.bonuscat[0] == 3 }
		{assign var="title" value=$templateconf.navtxteroticstories}
		{assign var="navbar" value="bonusstories"}
	{elseif $root.page.bonuscat[0] == 4 }
		{assign var="title" value=$templateconf.navtxtaudiofiles}
		{assign var="navbar" value="audiofiles"}
	{elseif $root.page.bonuscat[0] == 5 }
		{assign var="title" value=$templateconf.navtxtlivecams}
		{assign var="navbar" value="livecamsandfeeds"}
	{elseif $root.page.bonuscat[0] == 6 }
		{assign var="title" value=$templateconf.navtxtfriends}
		{assign var="navbar" value="friends"}
	{elseif $root.page.bonuscat[0] == 7 }
		{assign var="title" value=$templateconf.navtxtxmlfeed}
		{assign var="navbar" value="bonusxmlfeeds"}
	{else}
		{assign var="title" value="Bonus Content"}
		{assign var="navbar" value=""}
	{/if}

	{if $root.page.Id}
		{assign var="seokey"  value=$root.page.content.item[0].SEOkey[0]}
		{assign var="seodesc" value=$root.page.content.item[0].SEOdesc[0]}
	{/if}


{/strip}{include file='general/page_top.tpl' pagename="index" title = $title seokey=$seokey seodesc=$seodesc}

<div class="wrapper" align="center">

<!--Header-->
{include file="$spath/general/header.tpl"}


<!--Top Navbar-->
<div class="nav_fixed_width">{include file='general/topnav.tpl' item=$navbar}</div>


<table width="100%" cellpadding="0" cellspacing="0">
<tr>
<td valign="top" width="100%">
<!--Left Column-->

<!--Title-->
<div class="title_bar">{if $root.page.bonuscat[0] == 1 }
	{$templateconf.navtxtbonussites}
{elseif $root.page.bonuscat[0] == 2 }
	{$templateconf.navtxtvideofeeds}

{elseif $root.page.bonuscat[0] == 3 }
	{$templateconf.navtxteroticstories}

{elseif $root.page.bonuscat[0] == 4 }
	{$templateconf.navtxtaudiofiles}

{elseif $root.page.bonuscat[0] == 5 }
	{$templateconf.navtxtlivecams}

{elseif $root.page.bonuscat[0] == 6 }
	{$templateconf.navtxtfriends}

{elseif $root.page.bonuscat[0] == 7 && !isset($root.page.Id)}
	{$templateconf.navtxtxmlfeed}

{elseif $root.page.bonuscat[0] == 7 && isset($root.page.Id)}
	{$templateconf.navtxtxmlfeed} - {$root.page.bonuscatTitle[0]}	
{/if}
</div>


<!--Filter Content Form-->
{if count($root.page.bonuscategories.item)}
<div id="bonus_filter_form">
<table cellpadding="0" cellspacing="0" border="0">
<tr>
<td>{$templateconf.txtfiltersitesby}</td>
	<td>
<form method="GET" style="margin:0;">
<input type="hidden" name="fc" value="{$root.page.bonuscat[0]}" />
<select name="cat" onchange="submit()">
 <option value="">{$templateconf.txtallbonuscategories}</option>
{foreach from=$root.page.bonuscategories.item item=item }
	{if $item.Id[0]}
	  <option value="{$item.Id[0]}"
	  {if $item.Id[0] == $root.page.catfilter[0]}
	   	selected="selected"  
	  {/if} >
	  {$item.Title[0]}
	</option>
	{/if}
{/foreach}
</select>
</form>

</td>
	</tr>
</table>
</div>
{/if}



<!--Bonus-->
{include file="bonus/bonustable.tpl" }




</td>
<td valign="top" class="right_col">
<!--Right Column-->

{if ($pluginsdata.enabled.contentasc == 1) && ($pluginsdata.enabled.ratings == 1) }
<!--Most Popular Girls-->
<div class="title_bar">{$templateconf.txtmostpopulargirls}</div>
{include file="$spath/general/toplist_models.tpl"}
{/if}



{if in_array('banners',$pluginsdata.plugins) && $pluginsdata.enabled.banners == 1 }
{if $useb == 1}
<!--Suggested Site-->
<div class="title_bar">{$templateconf.txtsuggestedsite}</div>

<div id="suggested_site_index">
{include file="$spath/general/showbanner.tpl" zone="bonus_suggested" allmodels="1" allcats="1"}
</div>

<br />
{/if}



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