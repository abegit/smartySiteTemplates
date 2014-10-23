{** The code below embeds Extra Fields so that additional data can be added for each set or model within the admin panel under Plug-Ins/Extra Fields **}
{foreach from=$root.page.dvd[0].PreviewXML.extrafields.item_attr item="item"}
	{assign var="varname" value=$item.ElementName}
	{assign var="varname" value="extra_$varname"}
	{assign var=$varname value=$item.Value}
{/foreach}

{assign var="cdir" value=#contentdir#}

<div align="center" style="margin-top:3px;" class="content-wrapper">

	<!--Title-->
	
<div class="content_wrapper">

	<div id="title_center">{$root.page.dvd[0].ModelName[0]}</div>

	<div class="dvd_wrapper">

		<div class="dvd_thumb">
			<!--DVD Box/Thumbnail-->
			<img src="{$cdir}/contentthumbs/{$root.page.dvd[0].PreviewXML.thumbs.item_attr[0].Id}-dvdasc.jpg" class="thumbs"/>
		</div>
	
		<div class="dvd_info">
	
		Release Date: {$extra_releasedate} <br />
		{if $root.page.dvd[0].StudioName[0]}
		Studio: {$root.page.dvd[0].StudioName[0]}
		{/if}
	
		<br />
		<br />
	
		{$extra_description}
	
		</div>

	</div>
</div>
	




<!--Scenes Title-->
<div id="section_title">{$templateconf.txtscenesfrom} {$root.page.dvd[0].ModelName[0]}</div>







<!--Page Navigation-->
{if count($root.page.pages.page) > 1}
	{include file="$spath/dvds_outside/pagenav.tpl" id=$root.page.dvd[0].Id[0]}
{/if}


<div>
{foreach from=$root.page.results.result item="item" key="key"}
{assign var="pos" value=$key+1}

{if $pos >= ($root.page.onpage[0] -1)*$root.page.numperpage[0] && $pos <= $root.page.onpage[0]*$root.page.numperpage[0]}

	{include file="$spath/dvds_outside/scene_item.tpl" item=$item}

{/if}    	
{/foreach}
</div>



<!--Page Navigation-->
{if count($root.page.pages.page) > 1}
<br />
	{include file="$spath/dvds_outside/pagenav.tpl" id=$root.page.dvd[0].Id[0]}
{/if}






