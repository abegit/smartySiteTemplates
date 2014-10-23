<!--Title-->
<div class="title_bar">{$root.page.dvd[0].ModelName[0]}</div>


{assign var="cdir" value=#contentdir#}


<table id="dvd_info" cellspacing="2" cellpadding="2" border="0">
<tr>
	<td valign="top" align="center">

	<!--DVD Box/Thumbnail-->
	<img src="{$cdir}/contentthumbs/{$root.page.dvd[0].PreviewXML.thumbs.item_attr[0].Id}-dvdasc.jpg" class="thumbs"/>

</td>

{** The code below embeds Extra Fields so that additional data can be added for each set or model within the admin panel under Plug-Ins/Extra Fields **}
{foreach from=$root.page.dvd[0].PreviewXML.extrafields.item_attr item="item"}
	{assign var="varname" value=$item.ElementName}
	{assign var="varname" value="extra_$varname"}
	{assign var=$varname value=$item.Value}
{/foreach}

	<td width="100%" align="left" valign="top">

<span class="section_title">{$templateconf.txtdvdinfo}</span>
<br />
<br />
{if $extra_description}
<span class="dvd_description">{$extra_description}</span>
{/if}

<p>

<span class="dvd_title_info">
{if $extra_releasedate}
Release Date: {$extra_releasedate} <br />
{/if}

{if $root.page.dvd[0].StudioName[0]}
Studio: {$root.page.dvd[0].StudioName[0]}
{/if}

<p>

{if $extra_vodlink}
<a class="buy_links" href="{$extra_vodlink}">{$templateconf.txtwatchvideoondemand}</a> 
<br />
{/if}

{if $extra_buylink}
<a class="buy_links" href="{$extra_buylink}">{$templateconf.txtbuydvd}</a>
{/if}

</span>





</td>
</tr>
</table>
	




<!--Scenes Title-->
<div class="title_bar">{$templateconf.txtscenesfrom} {$root.page.dvd[0].ModelName[0]}</div>







<!--Page Navigation-->
{if count($root.page.pages.page) > 1}
	{include file="$spath/dvds/sets_pagenav.tpl"}
{/if}


<table cellpadding="0" cellspacing="0" width="100%">
{foreach from=$root.page.results.result item="item" key="key"}
{assign var="pos" value=$key+1}

{if $pos >= ($root.page.onpage[0] -1)*$root.page.numperpage[0] && $pos <= $root.page.onpage[0]*$root.page.numperpage[0]}
<tr>	
	<td valign="top">
	{include file="$spath/dvds/scene_item.tpl" item=$item}

<hr class="dvd_hr" /> 

	</td>
</tr>
{/if}    	
{/foreach}

</table>



<!--Page Navigation-->
{if count($root.page.pages.page) > 1}
<br />
	{include file="$spath/dvds/sets_pagenav.tpl"}
{/if}


{if in_array('comments',$pluginsdata.plugins) && $pluginsdata.enabled.comments == 1}
<div class="title_bar">{$templateconf.txtcomments}</div>
<a name="comments"></a>
<!--Comments-->
{include file="$spath/dvds/commentsui.tpl"}
{/if}





