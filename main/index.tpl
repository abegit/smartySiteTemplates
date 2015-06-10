{strip}
{assign var="title" value=$templateconf.titletxtindex}

{if isset($root.page.sites.site)}
{foreach from=$root.page.sites.site item=site}
{if $site.Id[0] == $root.page.sites_attr[0].id}
{assign var=title value=$site.Name[0]}
{/if}
{/foreach}
{/if}

{/strip}
{include file="$spath/general/page_top.tpl" pagename="index" title=$title}

<div class="wrapper" align="center">

{include file="$spath/general/header.tpl" item='home'}

<div class="container content">
<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl" item='home'}</div>


<!--Latest Updates-->
{if $root.page.onpage[0] == 1 }

<!--Slider Code-->

<div style="position: relative; top: 0px; left: 0px; overflow: hidden; z-index: 1; width: 1024px; height: 540px;" class="iosSlider">
				
					{include file="$spath/sliders/1.tpl"}
</div>
<div id="sliderNav"><span class="next">Next</span>
<span class="prev"> Prev</span>
</div>

{/if}


{if $root.page.onpage[0] == 1 }

{assign var="h3" value="0"}
{if isset($root.totals.item)}
{foreach from=$root.totals.item_attr item="tmp"}
{if $tmp.MajorType =='models'}
{assign var="h1" value=$tmp.Num}
{/if}
{if $tmp.MajorType =='types' && $tmp.MinorType == 'highres'}
{assign var="h2" value=$tmp.Num}
{/if}
{if $tmp.MajorType =='videos' && $tmp.MinorType == 'fullvideo'}
{assign var="h3" value=$tmp.Num}
{/if}
{/foreach}
{/if}


<table width="100%" cellpadding="2" cellspacing="0">
<tr>
<td valign="top" width="100%" class="lefty">
<!--Left Column-->



<!--Latest Updates-->
{if isset($root.page.content[0])}
	{foreach from=$root.page.content_attr item=content_attr key=kex}

	{if sizeof($root.page.content[$kex].item)}
	{if $content_attr[0].allsites == "1"}
	<div class="title_bar">{$templateconf.txtlatestnetworkupdates}</div>
	{else}
	<div class="title_bar">{$templateconf.txtlatestupdates|@strtoupper}</div>
	{/if}

	<div class="updates">
	{include file="$spath/index/latestupdates.tpl" content=$root.page.content[$kex]}
	</div>
	<br />
	{/if}
	{/foreach}
{else}
	<div class="title_bar">{$templateconf.txtlatestupdates}</div>
		<div class="updates">
	{include file="$spath/index/latestupdates.tpl" content=$root.page.content}
	</div>
{/if}




{if $root.page.dvdasc.newdvds.dvd|@count > 0}
<!--Latest DVD Updates-->
<div class="title_bar">{$templateconf.txtlatestdvds}</div>
{include file="$spath/index/latestdvds.tpl"}
{/if}



{** If there's whatshot OR poll, show this table **}
{if ($root.page.whatshot.item|@count > 0) || ($root.page.polls.poll.questions.question|@count > 0)}
<br />
<div class="featured">
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
{if $root.page.whatshot.item|@count > 0}
<td valign="top">
<!--What's Hot Feature Set-->
<div class="title_bar">{$templateconf.txtwhatshot}</div>

{if $root.page.polls.poll.questions.question|@count > 0}
{assign var="numcolumns" value="1"}
{else}
{assign var="numcolumns" value="2"}
{/if}

{assign var="tableobject" value=$root.page.whatshot.item}
{assign var="tabletemplate" value="$spath/index/whatshot.tpl"}
{** Change hardlimit if you want to show more than 1 "What's Hot" entry. **}
{assign var="hardlimit" value=2}

{if sizeof($tableobject)}
<table border="0" cellspacing="2" cellpadding="0" align="center">

{foreach from=$tableobject item="itemC" key="kex"}
{if ($kex % $numcolumns) == 0}
<tr>
	{** To adjust the number of columns, change the value of numcolumns at the top of this page **}
	{section name=columns start=0 loop=$numcolumns step=1}
		{assign var="tmpk" value=$kex+$smarty.section.columns.index}

		<td valign="top">
			{if isset($tableobject[$tmpk]) && $tmpk < $hardlimit}
				{include file="$tabletemplate" item=$tableobject[$tmpk]} 
			{else} 
				&nbsp;
			{/if}
		</td>

	{/section}
</tr>
{/if}
{/foreach}
</table>
{/if}



</td>
{/if}

{if $root.page.polls.poll.questions.question|@count > 0}
<td valign="top" width="100%" style="padding-left:4px;">
<!--Poll-->
<div class="title_bar">{$templateconf.txtthisweekspoll}</div>
{include file="$spath/general/poll.tpl"}
</td>
{/if}
</tr>
</table>
</div>

{/if}








<br />


{** Should the banner code show? **}
{assign var="useb" value="0"}
{foreach from=$page.banners.banner item=banner}
 {if ($banner.ZoneId[0] == "index_special") && ($useb == "0")}
 {assign var="useb" value="1"}
 {/if}
{/foreach}

{** If a banner exists, show the spot for it **}
{if $useb == 1}
<!--Special Offer-->
<div class="title_bar">{$templateconf.txtspecialoffer}</div>
<div id="special_offer_index">
{include file="$spath/general/showtextad.tpl" zone="index_special" allmodels="1" allcats="1"}
</div>
{/if}



</td>
<td valign="top" class="right_col">
<!--Right Column-->



<!--Language-->

{foreach from=$root.page.languages.language item="lang"}
	{if $lang.Id[0]!=0}
		{assign var="langPass" value=1}
	{/if}
{/foreach}
{if isset($langPass)}
<div class="title_bar">{$templateconf.txtlanguage|@strtoupper}</div>
{include file="$spath/general/languagebar.tpl"}
{/if}

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


<!--Twitter Posts-->
{if ($root.page.twitter|@count > 0)}
<div class="title_bar">{$templateconf.txtlatesttweets}</div>
{include file="$spath/general/twitter.tpl"}
<br />
{/if}

<!-- Facebook Posts-->
{if ($root.page.facebook|@count > 0)}
<div class="title_bar">{$templateconf.txtlatestfacebook}</div>
{include file="$spath/general/facebook.tpl"}
<br />
{/if}


{if in_array('banners',$pluginsdata.plugins) && $pluginsdata.enabled.banners == 1 }
{** Should the banner code show? **}
{assign var="useb" value="0"}
{foreach from=$page.banners.banner item=banner}
 {if ($banner.ZoneId[0] == "index_suggested") && ($useb == "0")}
 {assign var="useb" value="1"}
 {/if}
{/foreach}

{** If a banner exists, show the spot for it **}
{if $useb == 1}
<!--Suggested Site-->
<div class="title_bar_center">{$templateconf.txtsuggestedsite}</div>

<div id="suggested_site_index">
{include file="$spath/general/showbanner.tpl" zone="index_suggested" allmodels="1" allcats="1"}
</div>
<br />
{/if}


{/if}


{if ($root.page.mailinglist.item|@count > 0)}
<!--Mailing List-->
<div class="title_bar">{$templateconf.txtnewsletter}</div>
{include file="$spath/general/mailinglistform.tpl" item=$root.page.mailinglist.item }
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

<a href="http://www.live.drsusanblock.com/" targer="_new"><img src="http://banners.videosecrets.com/assets/animated/generic-g-02122015-eml-160x600-005.gif" width="160" height="600" style="margin-top:20px;" border="0" /><br /><p style="font-size:small">Click Here to Start Chatting</font></a>


</td>
</tr>

</table>


<a href="http://www.live.drsusanblock.com/" target="_new">
<img src="http://banners.videosecrets.com/assets/animated/generic-g-02122015-eml-900x120-003.gif" width="750" height="auto" alt="Chat Now! It's Not Cheating It's Webcams" border="0"/></a>






{else}


{if isset($root.page.content[0])}
	{foreach from=$root.page.content_attr item=content_attr key=kex}

	{if sizeof($root.page.content[$kex].item)}
	{if $content_attr[0].allsites == "1"}
	<div class="title_bar">{$templateconf.txtlatestnetworkupdates}</div>
	{else}
	<div class="title_bar">{$templateconf.txtlatestupdates|@strtoupper}</div>
	{/if}
	<div align="center" class="looper">
	{include file="$spath/index/latestupdates.tpl" content=$root.page.content[$kex]}
	<br /></div>
	{/if}

	{/foreach}
{else}
	<div class="title_bar">{$templateconf.txtlatestupdates}</div>
	<div align="center" class="looper">{include file="$spath/index/latestupdates.tpl" content=$root.page.content}</div>
{/if}



{/if}
</div>
</div>
<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl" item='home'}</div>
