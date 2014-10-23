{** Those are deafult variables **}
{** DO NOT CHANGE THEM unless you know what are you doing **}
{assign var="onpage" value=$root.page.onpage[0]}
{assign var="numperpage" value=$root.page.numperpage[0]}
{math equation="((el1-1)*el2+1)" el1=$onpage el2=$numperpage assign="startpos"}
{math equation="((el1)*el2+1)" el1=$onpage el2=$numperpage assign="endpos"}

{assign var=cg value=$root.page.contentgroup}


{literal}

<style>
.hid
{
  display:none;
}
</style>

<script type='text/javascript' src="jwplayer.js"></script>
<script type="text/javascript">jwplayer.key="qLzynSodouEg2o+gukjzO+6P0dzyHYq1TqcHaUF9cJE=";</script>

<script>

try
{
	// starting the script on page load
	$(document).ready(function(){

		if (typeof jwplayer !== 'function')
		{
			alert("Warning: File jwplayer.js not found.");
		}
	});
}
catch(e)
{
  alert("Warning: File js/jquery.min.js not found.");
}

</script>

<noscript>
<style>
.playrow
{
  display:none;
}
</style>
</noscript>
{/literal}

{literal}
<script>

function playmovie(fle, imgg, changeloc, autoplay, wdth, hdth)
{
	if (changeloc == 1)
	{
		$('html,body').animate({scrollTop: $("#playertag").offset().top},'slow');
	}

	if (autoplay == "1")
	{
		aup = true;
	}
	else
	{
		aup = false;
	}

	$("#mediaplayer").show();

	passobj = {};
	passobj.file = fle;
	if (imgg != '')
	{
		passobj.image = imgg;
	}
	
	passobj.width = parseInt($(".content_wrapper").width());
	passobj.height = parseInt($(".content_wrapper").width() * hdth / wdth);
	passobj.autostart = aup;
	
	passobj.primary = "flash";

	jwplayer('mediaplayer').setup(passobj);

}

$(window).resize(function() {

	if ( $("#mediaplayer").length )
	{	
		jw_wdth = jwplayer('mediaplayer').getWidth();
		jw_hdth = jwplayer('mediaplayer').getHeight();
	
		wdth = parseInt($(".content_wrapper").width());
		hdth = parseInt(wdth * jw_hdth / jw_wdth);

		try
		{	
			jwplayer('mediaplayer').resize( wdth, hdth );
		}
		catch(e)
		{
			console.log(wdth + "x" + hdth + " " + jw_wdth + "x" + jw_hdth);
		}
	}

	

});


</script>
{/literal}




<!--Start Full Download Table-->
{if in_array($root.page.settype[0], $root.page.movietabs.item)}
		{foreach from=$root.page.contenttypesub.type item="item"}
			{foreach from=$root.page.content.item item="tmp1"}
				{foreach from =$tmp1.Files.file_attr item=tmp2 key="k2"}
					{if $tmp2.name == $item.Name[0]}
						{assign var="pass12" value=1}
					{/if}
				{/foreach}
			{/foreach}
		{/foreach}

	{if $root.page.contentgroup.wc_id[0]}
		{assign var="pass12" value=1}	
	{/if}

	{if isset($pass12)}

		<a name="player" id="playertag"></a>
		<div align="center" class="playrow">
		<div class="playrow hid" id="mediaplayer" align="center"></div>
		</div>
	

	
	
		{assign var="count" value= 0}
		{assign var="c" value=-1}
		{foreach from=$root.page.contenttypesub.type item="item" key="tmpIK"}
		{if $item.FullVideo[0] > 0 && $item.ShowPlay[0] >= 1}
			{foreach from=$root.page.content.item item="tmp1" key="tmp1K"}
				{foreach from =$tmp1.Files.file_attr item=tmp2 key="k2"}
					{if $tmp2.name == $item.Name[0] &&  $c!=$tmpIK }
						{assign var="c" value=$tmpIK}
					
						{assign var="count" value=$count+1}	
					{/if}
				{/foreach}
			{/foreach}
		{/if}
		{/foreach}
	
	
		{if $count > 0}
		<div class="playrow">
		
		
			<div id="section_title">
			<table align="center">
			<tr>
			<td><img src="{#imagedir#}/icons/save2.gif" width="16" height="16" alt="" /></td>
			<td class="sub-heading">{$templateconf.txtplaymobile}</td>
			</tr>
			</table>
			</div>
		
			<script>
			{literal}
			picarr = []
			
			$(document).ready(function() {
			
				$("#mediaplayer").show();
			
				passobj = {}	
				var lst = [];
				var titl = ""
					
				for (var cntx=0; cntx < picarr.length; cntx++)
				{
					pa = picarr[cntx]
					listitem = {}
			
					if (pa.label)
					{
						listitem.label = pa.label;
					}
					
					if (pa.image)
					{
						passobj.image = pa.image;
					}
			
					listitem.file = pa.file;
			
					if (pa.vtt)
					{
						passobj.tracks = [{ 
					            file: pa.vtt, 
					            kind: "thumbnails"
					        }];
					}
					
					lst[lst.length] = listitem;		  
				}
					
				passobj.autostart = false;
				
				passobj.sources = lst;
				
				if (picarr.length)
				{				
					passobj.width = parseInt($(".content_wrapper").width());
					passobj.height = parseInt($(".content_wrapper").width() * picarr[0].height / picarr[0].width);
				}
				
				passobj.primary = "flash";
				
				jwplayer("mediaplayer").setup(passobj);
			});
			{/literal}
			
			{strip}
			{assign var="c" value=-1}
			{foreach from=$root.page.contenttypesub.type item="item" key="tmpIK"}

				{if $item.FullVideo[0] == 2 && $item.ShowPlay[0] != 2}
					{foreach from=$root.page.content.item item="tmp1" key="tmp1K"}
						{assign var="thumbfile" value=""}
						
						{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
							{if $tmp2.cname == "Video Thumbnails"}
								{assign var="thumbfile" value=$tmp1.Files.file[$k2]}
							{/if}
						{/foreach}								
					
						{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}								
							{if $tmp2.name == $item.Name[0] &&  $c!=$tmpIK}
								{assign var="c" value=$tmpIK}
								
								picarr.push({literal}{{/literal}
									file: "{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$tmp1.Files.file[$k2]}",
									image: "{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$thumbfile}",
									label: "{$item.Label[0]}",
									width: {if $tmp2.movie_width}{$tmp2.movie_width}{else}640{/if},
									height: {if $tmp2.movie_height}{$tmp2.movie_height}{else}480{/if}
									{if $tmp1.Files.file_attr[$k2].vtt_file}
									,vtt: "{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$tmp1.Files.file_attr[$k2].vtt_file}"
									{/if}
								{literal}}{/literal});
							{/if}
						{/foreach}
					{/foreach}
				{/if}
			{/foreach}
			{/strip}
			
			</script>
		
			{strip}
			<div id="content_links">
			
				{** Generating the download links **}

					{assign var="c" value=-1}
					{foreach from=$root.page.contenttypesub.type item="item" key="tmpIK"}
		
						{if $item.FullVideo[0] > 0 && $item.ShowPlay[0] >= 1}
							{foreach from=$root.page.content.item item="tmp1" key="tmp1K"}
								{assign var="thumbfile" value=""}
								
								{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
									{if $tmp2.cname == "Video Thumbnails"}
										{assign var="thumbfile" value=$tmp1.Files.file[$k2]}
									{/if}
								{/foreach}								
							
								{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}								
									{if $tmp2.name == $item.Name[0] &&  $c!=$tmpIK}
										{assign var="count" value=$count-1 }
										{assign var="c" value=$tmpIK}
																				
										{capture assign="tname"}{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$thumbfile}{/capture}
										{capture assign="fname"}{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$tmp1.Files.file[$k2]}{/capture}

										{capture assign="width"}{if $tmp2.movie_width}{$tmp2.movie_width}{else}640{/if}{/capture}
										{capture assign="height"}{if $tmp2.movie_height}{$tmp2.movie_height}{else}640{/if}{/capture}
										
										{if $item.ShowPlay[0] == 2}
										<a class="content-links" href="{$root.page.trial.VideoURL[0]}">{$item.Format[0]} {$item.Label[0]}</a>
										{else}
										<a class="content-links" href="javascript:playmovie('{$fname}', '{$tname}', 0, 1, {$width}, {$height})" >{$item.Format[0]} {$item.Label[0]}</a>
										{/if}

										{if $count>0}<br />{/if}
									{/if}
								{/foreach}
							{/foreach}
						{/if}
					{/foreach}
				{** Finished populating the download links **}
		
		
			</div>
			{/strip}
		
	
		{assign var="count" value= 0}
		{assign var="c" value=-1}
		{foreach from=$root.page.contenttypesub.type item="item" key="tmpIK"}
			{if $item.FullVideo[0] > 0 && $item.ShowDownload[0] >= 1}
				{foreach from=$root.page.content.item item="tmp1" key="tmp1K"}
					{foreach from =$tmp1.Files.file_attr item=tmp2 key="k2"}
						{if $tmp2.name == $item.Name[0] &&  $c!=$tmpIK }
							{assign var="c" value=$tmpIK}
						
							{assign var="count" value=$count+1}	
						{/if}
					{/foreach}
				{/foreach}
			{/if}
		{/foreach}
	
		
		</div>
		{** End id="playrow" **}
		{/if}


		{if $count > 0}
			<div id="section_title">
			<table align="center">
			<tr>
			<td><img src="{#imagedir#}/icons/save2.gif" width="16" height="16" alt="" /></td>
			<td class="sub-heading">{$templateconf.txtfulldownloadmobile}</td>
			</tr>
			</table>
			</div>
		
		
			{strip}
			<div id="content_links">
			
				{** Generating the download links **}
					{assign var="c" value=-1}
					{foreach from=$root.page.contenttypesub.type item="item" key="tmpIK"}
						{if $item.FullVideo[0] > 0 && $item.ShowDownload[0] >= 1}
							{foreach from=$root.page.content.item item="tmp1" key="tmp1K"}
								{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
									{if $tmp2.name == $item.Name[0] &&  $c!=$tmpIK}
										{assign var="count" value=$count-1 }
										{assign var="c" value=$tmpIK}
										
										{if $item.ShowDownload[0] == 2}
										<a class="content-links" href="{$root.page.trial.VideoURL[0]}">{$item.Format[0]} {$item.Label[0]}</a>
										{else}
										<a class="content-links" href="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$tmp1.Files.file[$k2]}">{$item.Format[0]} {$item.Label[0]}</a>
										{/if}
										
										{if $count>0}<br />{/if}
									{/if}
								{/foreach}
							{/foreach}
						{/if}
					{/foreach}
				{** Finished populating the download links **}
			</div>
			{/strip}
		{/if}
	



		{if $root.page.contentgroup.wc_id[0]}


			{assign var="wc_id" value=$root.page.contentgroup.wc_id[0]}
			{assign var="wc_uid" value=$root.page.webmaster_central_uid}
			{assign var="wc_datestamp" value=$root.page.webmaster_central_datestamp}
			{assign var="wc_hash" value=$root.page.webmaster_central_hash}
			{assign var="wc_url" value=$root.page.webmaster_central_mobilefile}

			{literal}
			<script>
			$(document).ready(function() {
			{/literal}
				playmovie('{$wc_url}', '', 1, 0, 1920, 1080);
			{literal}
			});
			</script>
			{/literal}

		{/if}

		
	{/if}
	{** End	if isset($pass12) && !isset($root.page.trial) **}


	
{/if}
<!--End Full Download Table-->





<table class="content_wrapper">
<tr>
<td id="title_center">

<!--This displays the title for the content set-->
{$cg.Title[0]}</div>


</td></tr>
<tr>
<td id="section_title">
{$templateconf.txtinsidethisupdate}

</td>
</tr>
<tr>
<td id="content_links">
<!--This displays the content links-->
{assign var="pipespacer" value=0}



{** This is the photo Tab **}
{strip}
{foreach from=$root.page.movietabs.item item="item" key="k"} 
	{assign var="go" value="0"}
	{foreach from=$cg.PreviewXML.content.types.type_attr item="titem"}
     {foreach from=$root.page.contenttypesub.type item="mitem"}
	 {if ($titem.type == $item) and ($mitem.Type[0] == $titem.type)}
		{assign var="go" value="1"}
	 {/if}
     {/foreach}
	{/foreach}	
	{if $go == "1"}	
		{if $pipespacer==1}
		&nbsp;&nbsp;|&nbsp;&nbsp;
		{/if}

		{assign var="pipespacer" value=1}

		<a  href="{include file="$spath/general/pg_gallery.tpl" id=$cg.Id[0] type=$item mt='' seoname=$cg.SEOname[0] item=$cg}">
		{assign var="fld" value="txtnav$item"}	
		{$templateconf[$fld]|@trim}
		</a>
	{/if}
{/foreach}

{foreach from=$root.page.movietabs.item item="mtab" key="mtabkey"}

 {assign var="go" value="0"}
 {foreach from=$cg.PreviewXML.content.type_attr item="cmtype"}
 	{if $ctype.type == $mtab} {assign var="go" value=1} {/if}
 {/foreach}
{if $go == 1 }
	{if $pipespacer==1}
	&nbsp;&nbsp;|&nbsp;&nbsp;
	{/if}

	{assign var="pipespacer" value=1}

	{assign var="fld" value="txtnav$item"}	

	<a
	 href="{include file="$spath/general/pg_gallery.tpl" id=$cg.Id[0] type=$mtab mt='' seoname=$cg.SEOname[0] item=$cg}">
        {$templateconf[$fld]|@trim}</a>
{/if}
{/foreach}
{/strip}



{foreach from=$root.page.contenttypesub.type item="conttitem"}

	{assign var="go1" value=1}

	{if ($conttitem.Label[0] == '')}
	  {assign var="go1" value=0}
	{/if}

	{foreach from=$root.page.movietabs.item item="mtab" key="mtabkey"}
	 {if $conttitem.Type[0] == $mtab} 
	   {assign var="go1" value=0}
	 {/if}
	{/foreach}

	{foreach from=$cg.PreviewXML.content.types.type_attr item="contitem"}
		{if $contitem.type == $conttitem.Type[0] && $go2==0} {assign var="go2" value=1}{/if}
	{/foreach}

	{if ($go1 == 1)}
	   {assign var="go1" value=0}		

	   {foreach from=$cg.PreviewXML.content.types.type_attr item="contitem"}
	      {if $contitem.type == $conttitem.Type[0]}
			{assign var="go1" value=1}
		{/if}
	   {/foreach}
		

	{/if}


	{if ($go1 ==1) }
		{if $pipespacer==1}
		&nbsp;&nbsp;|&nbsp;&nbsp;
		{/if}

		{assign var="pipespacer" value=1}

		{capture assign="fld"}txtnav{$conttitem.Type[0]}{/capture}

		<a
		 href="{include file="$spath/general/pg_gallery.tpl" id=$cg.Id[0] type=$conttitem.Type[0] mt='' seoname=$cg.SEOname[0] item=$cg}">
	        {$templateconf[$fld]|@trim}</a>
	{/if}
{/foreach}

</td>
</tr>




{assign var="count" value=0}
{foreach from=$cg.PreviewXML.category.item_attr item=item}
  {foreach from=$categories item=item2 }
	{if $item2.Title[0] == 'Tags'}
	{foreach from=$item2.cats.cat item=item3}
		{if $item3.Id[0] == $item.category } 
			{assign var="count" value=$count+1}
		{/if}
	{/foreach}
	{/if}
  {/foreach}
{/foreach}


{if $count || $cg.PreviewXML.sets.set|@count}
<tr>
<td class="info">


	{if $cg.PreviewXML.sets.set|@count}
		{$templateconf.txtfeaturedmodels}
		
		
		{foreach from=$cg.PreviewXML.sets.set item="item" name="loopCN"}
			<a class="model-category-links" href="{include file="$spath/general/pg_sets.tpl" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{$item.ModelName[0]}</a>{if 
				!$smarty.foreach.loopCN.last },&nbsp;{/if}
		{/foreach}
		
		<br />
	{/if}

	{if $count}
		{$templateconf.txtcategories}
	
	
	
		{foreach from=$cg.PreviewXML.category.item_attr item=item}
		  {foreach from=$categories item=item2 }
			{if $item2.Title[0] == 'Tags'}
			{foreach from=$item2.cats.cat item=item3}
			{if $item3.Id[0] == $item.category } {assign var="count" value=$count-1}<a class="model-category-links" href="{include file="$spath/general/pg_category.tpl" id=$item3.Id[0] seoname=$item3.SEOname[0] item=$item3}">{$item3.Title[0]}</a>{if $count >0 },&nbsp;{/if}{/if}
			{/foreach}
			{/if}
		  {/foreach}
		{/foreach}
	{/if}

</td></tr>
{/if}


{if $cg.Description[0]}
<tr><td class="description">{$cg.Description[0]}</td></tr>
{/if}

</table>








{if in_array($root.page.settype[0],$root.page.movietabs.item)}

	{assign var="c" value=-1}
	{assign var="count" value=0}

	{foreach from=$root.page.content.item item="item" key="k" }
		{foreach from=$item.Files.file_attr item="fattr" }
			{foreach from=$root.page.contenttypesub.type item="cttype"}
				{if $fattr.name == $cttype.Name[0] && $cttype.FullVideo[0] == "0" && $c!=$k }
					{assign var="c" value=$k}
				  	{if ($k+1)>=$startpos && ($k+1)<$endpos}									
						{assign var ="count" value=$count+1}
					{/if}
				{/if}
			{/foreach}
		{/foreach}
	{/foreach}

	{if $count > 0}

	<div id="section_title">{$templateconf.txtindividualclips}</div>
	
	<div id="clips_wrapper">
		<div class="fulldownload">
		
	
		<!--This displays the Gallery Page Navigation table-->
		{if count($root.page.pages.page) > 1}
			{include file="$spath/gallery/gallerynav.tpl"}
		{/if} 
	
	
			<div class="element_wrapper">
	
			{assign var="c" value=-1}
			{assign var="count" value=0}
	
			{foreach from=$root.page.content.item item="item" key="k" }
				{foreach from=$item.Files.file_attr item="fattr" }
					{foreach from=$root.page.contenttypesub.type item="cttype"}
						{if $fattr.name == $cttype.Name[0] && $cttype.FullVideo[0] == "0" && $c!=$k }
							{assign var="c" value=$k}
						  	{if ($k+1)>=$startpos && ($k+1)<$endpos}
					
							<div class="gallery_element">
								{include file="$spath/gallery/showthumb.tpl" item=$item pos = $k}
							</div>
											
							{assign var ="count" value=$count+1}
							{/if}
						{/if}
					{/foreach}
				{/foreach}
			{/foreach}
	
			</div>
		<!--This displays the Gallery Page Navigation table-->
		{if count($root.page.pages.page) > 1}
			{include file="$spath/gallery/gallerynav.tpl"}
	 	{/if}
		</div>
	
	</div>
	{/if}

{else}
	<!--This displays the Gallery Page Navigation table-->
	{if count($root.page.pages.page) > 1}
	 	{include file="$spath/gallery/gallerynav.tpl"}
	{/if}


	<div class="element_wrapper">
	{foreach from=$root.page.content.item item="item" key="k" }
	 {if ($k+1)>=$startpos && ($k+1)<$endpos}	
	 <div class="gallery_element">
			{include file="$spath/gallery/showthumb.tpl" item=$item pos = $k}
	 </div>
	{/if}
	{/foreach}
	</div>

	<!--This displays the Gallery Page Navigation table-->
	{if count($root.page.pages.page) > 1}
	{include file="$spath/gallery/gallerynav.tpl"}
	{/if}
{/if}
<!--End Gallery Table-->





