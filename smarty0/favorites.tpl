{** show 3 columns for favorites **}
{assign var="numcolumns" value="3"}

{include file='general/page_top.tpl' pagename="" item='favorites' title = $templateconf.titletxtfavorites}

<div class="wrapper" align="center">

<!--Header-->
{include file="$spath/general/header.tpl"}


<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl"}</div>



<!--Tags-->
{if $cms_pro && isset($root.page.usertags) && sizeof($root.page.usertags) }
<!--Title Bar-->
<div class="title_bar">{$templateconf.txtcategorytags}</div>
{include file="favorites/taglist.tpl" }
<br>
{/if}	


<!--Title Bar-->
{if $cms_pro && isset($root.page.utag) && sizeof($root.page.utag) }
<div class="title_bar">Tag: {$root.page.tagName[0]}</div>
{else}
<div class="title_bar">{$templateconf.txtfavorites}</div>
{/if}

<table width="100%" cellpadding="2" cellspacing="0">
<tr>
<td valign="top" width="100%">
<!--Left Column-->

{if $cms_pro && isset($root.page.utag) && sizeof($root.page.utag) }
{include file="favorites/viewtags.tpl"}
<br>

{else}



<table cellspacing="2" cellpadding="0" border="0">
<tr>

<td>
<div {if $root.page.favorites.sort == "f"} class="sort_link_current" {else} class="sort_link" {/if}><a id=$root.page.favorites.Id[0] s="f" href="favorites.php?s=f">{$templateconf.txtdateadded}</a></div>
</td>

<td>
<div {if $root.page.favorites.sort == "d"} class="sort_link_current" {else} class="sort_link" {/if}><a id=$root.page.favorites.Id[0] s="d" href="favorites.php?s=d">{$templateconf.txtmostrecent}</a></div>
</td>

<td>
<div {if $root.page.favorites.sort == "p"} class="sort_link_current" {else} class="sort_link" {/if}><a id=$root.page.favorites.Id[0] s="p" href="favorites.php?s=p">{$templateconf.txtmostpopular}</a></div>
</td>

<td>
<div {if $root.page.favorites.sort == "n"} class="sort_link_current" {else} class="sort_link" {/if}><a id=$root.page.favorites.Id[0] s="n" href="favorites.php?s=n">{$templateconf.txtnametitle}</a></div>
</td>


</tr>
</table>





{assign var="tableobject" value=$root.page.favorites.item}
{assign var="tabletemplate" value="favorites/favorites_item.tpl"}

<!--Favorites-->
<table cellspacing="2" cellpadding="2" border="0">
{foreach from=$tableobject item="itemC" key="kex"}
{if ($kex % $numcolumns) == 0}
<tr>
	{** To adjust the number of columns, change the value of numcolumns at the top of this page **}
	{section name=columns start=0 loop=$numcolumns step=1}
		{assign var="tmpk" value=$kex+$smarty.section.columns.index}

		<td valign="top">
			{if isset($tableobject[$tmpk])}
				{include file="$tabletemplate" item=$tableobject[$tmpk]} 
			{else} 
				&nbsp;
			{/if}
		</td>

	{/section}
</tr>

{assign var="kexv" value=$kex+$numcolumns}
{if isset($tableobject[$kexv])}
<tr><td colspan="{$numcolumns}"><hr class="favorites_hr" /></td></tr>
{/if}

{/if}



{/foreach}


</table>




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

{if in_array('banners',$pluginsdata.plugins) && $pluginsdata.enabled.banners == 1 }
<!--Suggested Site-->
<div class="title_bar">{$templateconf.txtsuggestedsite}</div>
<div id="suggested_site_index">
{include file="$spath/general/showbanner.tpl" zone="favorites_suggested" allmodels="1" allcats="1"}
</div>
{/if}

<br />

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