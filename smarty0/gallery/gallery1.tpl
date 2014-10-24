{** Set the number of columns for photos **}
{assign var="numcolumns_photo" value="5"}

{** Set the number of columns for video clips **}
{assign var="numcolumns_video" value="4"}

             
{global get="image_folder" assign="image_folder"}
{** These are deafult variables **}
{** DO NOT CHANGE THEM unless you know what are you doing **}
{assign var="onpage" value=$root.page.onpage[0]}
{assign var="numperpage" value=$root.page.numperpage[0]}
{math equation="((el1-1)*el2+1)" el1=$onpage el2=$numperpage assign="startpos"}
{math equation="((el1)*el2+1)" el1=$onpage el2=$numperpage assign="endpos"}
{foreach from=$root.page.contenttypesub.type item=item }
{if $item.FullVideo[0] == 2 && $root.page.settype[0] == $item.Type[0]} 
{if !isset($fullplay) } {assign var="fullplay" value=$item} {/if}
{if (substr_count($item.Name[0],'flv') || substr_count($item.Name[0],'mp4') || substr_count($item.Name[0],'flash')) && !isset($fullplayName)} {assign var="fullplayName" value=$item}{/if}
{/if}
{/foreach}

<script>
{literal}
function TrackDownload(id, cg, type, mt)
{
  spuu = [id, '', '', '', type, mt, cg]
  TrackContent(spuu);
  return true;
}
{/literal}
</script>

{if isset($root.page.trial)}

<script>
{literal}
	var plr = null;


	function replay(){
		document.getElementById('hpromo').style.display = 'none';
        document.getElementById('mediabox').style.display = 'block';

		jw_playerload()
	}

{/literal}
</script>
            

{/if}



<div align="left"><!--Content Tabs-->
{include file="$spath/gallery/contenttabs.tpl"}
</div>


<!--beginning of movie div-->
<div>

{** Code for looping through and showing the full movie **}

{assign var="fpp" value="0"}

{foreach from=$root.page.contenttypesub.type item="item"}
	{if $item.FullVideo[0] == 2 && ($item.ShowPlay[0] != 2 || in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id))}
		{foreach from=$root.page.content.item item="tmp1"}
		{if $tmp1.show[0] == "1"}
			{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
				{if !$fpp && ($tmp2.name == $item.Name[0]) && ($tmp2.type == $item.Type[0]) && ($item.Type[0] == $root.page.settype[0])}
					{assign var="fpp" value="1"}
					{include file="$spath/gallery/playmovie.tpl" name=$item.Name[0] curritem=$tmp1 fullplay=$fullplay trailer=""}
				{/if}
			{/foreach}
		{/if}
		{/foreach}
	{/if}
{/foreach}

{if !$fpp && isset($root.page.contentgroup.extrafields.trailer[0])}
   {include file="$spath/gallery/playmovie.tpl" name="" trailer=$root.page.contentgroup.extrafields.trailer[0]}
{/if}

{if !$fpp && $root.page.contentgroup.wc_id[0]}

	{if !isset($root.page.trial) || (isset($root.page.trial) && in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id))}

	{assign var="wc_id" value=$root.page.contentgroup.wc_id[0]}
	{assign var="wc_uid" value=$root.page.webmaster_central_uid}
	{assign var="wc_datestamp" value=$root.page.webmaster_central_datestamp}
	{assign var="wc_hash" value=$root.page.webmaster_central_hash}
	{assign var="wc_url" value=$root.page.webmaster_central_file}

	
	<div align="center">
	<div id='mediaspacewc'></div>
</div>

	<script src="jwplayer.js"></script>
	<script type="text/javascript">jwplayer.key="qLzynSodouEg2o+gukjzO+6P0dzyHYq1TqcHaUF9cJE=";</script>

	<script>
	{literal}
	    jwplayer("mediaspacewc").setup({
	        file: '{/literal}{$wc_url}{literal}',
	        width: 960,
	        height: 540,
	        autostart: true
	    });
	{/literal}
	</script>

	{else}
	<div align="center">
	<a href="{$root.page.trial.VideoURL[0]}">{$templateconf.wmctrialupgrade}</a>
</div>
	{/if}

{/if}

<div style="text-align:center;">
{include file="$spath/general/headerbannerad.tpl" zone="header_ad" allmodels="1" allcats="1"}
</div>

<div class="title_bar">

<!--Site Name-->
{include file="$spath/general/sitelink_titlebar.tpl" item=$root.page.contentgroup} 

{$root.page.contentgroup.Title[0]}</div>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td valign="top">


<table border="0" cellpadding="2" cellspacing="2">

<tr>
<td class="date">{$templateconf.txtadded} {$root.page.contentgroup.DateDisplay[0]}</td>


<td>

<!--Rating-->
{strip}
{if in_array('ratings',$pluginsdata.plugins) && $pluginsdata.enabled.ratings == 1}
 {if !isset($root.page.trial)}

  {if ($root.page.ratings_attr[0].voted == 0)}
   {assign var="hover" value=1}
  {else}
   {assign var="hover" value=0}
  {/if}

  {if isset($root.page.contentgroup.plg_ratings_total[0]) }
   {if ($root.page.ratings_attr[0].pointstot)==0 }
    {assign var="el2" value=10} 
   {else} 
    {assign var="el2" value=$root.page.contentgroup.plg_ratings_total[0]}
   {/if}
   {math equation ="((el1/el2)*10)" el1=$root.page.contentgroup.plg_ratings_rank[0] el2=$el2 assign=rating}	
  {else}
   {assign var="rating" value=10}
  {/if}
  {include file="$spath/general/votefrm.tpl" rating=$rating hover=$hover }
 {/if}
{/if}
{/strip}

</td>

{if isset($root.page.contentgroup.plg_ratings_total)}
<td class="small_text">{$templateconf.txtaveragerating}: 
{math assign="rtng" equation="x / y * 5 " x=$root.page.contentgroup.plg_ratings_rank[0] y=$root.page.contentgroup.plg_ratings_total[0]}
{$rtng|@string_format:"%.1f"}
</td>
{/if}

{if $root.has_username}
<td><!--Favorites-->
{include file="$spath/gallery/favoriteslink.tpl"}
</td>
{/if}

</tr>
</table>






<div class="gallery_description">

<!--Description-->
{if $root.page.contentgroup.Description[0]!=''}
{$root.page.contentgroup.Description[0]}
{/if}</div>


{strip}
{if $root.page.contentgroup.PreviewXML.sets.set|@count}
<table cellspacing="2" cellpadding="2" border="0">
<tr>
	<td valign="bottom" class="subtitle">{$templateconf.txtfeaturedmodels}</td>
<td align="left">
{foreach from=$root.page.contentgroup.PreviewXML.sets.set item="item" name="loopCN"}
<a class="model_category_link" href="{include file="$spath/general/pg_sets.tpl" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}">{$item.ModelName[0]}</a>
{if !$smarty.foreach.loopCN.last },&nbsp;{/if}{/foreach}
</td>
</tr>
</table>
{/if}
{/strip}

{strip}
{if $root.page.contentgroup.PreviewXML.dvds.dvd|@count != 0}
<table cellspacing="2" cellpadding="2" border="0">
<tr>
	<td valign="bottom" class="subtitle">{$templateconf.txtdvd}:</td>
<td class="plaintext">
	{foreach from=$root.page.contentgroup.PreviewXML.dvds.dvd item="item" name="loopCN"}
	<a class="model_category_link" href="{include file="$spath/general/pg_dvds.tpl" id=$item.Id[0] item=$item}">{$item.ModelName[0]}</a>
	{if !$smarty.foreach.loopCN.last },&nbsp;{/if}
	{/foreach}
</td>
</tr>
</table>
{/if}
{/strip}




{assign var="count" value=0}
{foreach from=$root.page.contentgroup.PreviewXML.category.item_attr item=item}
{foreach from=$tags item=item3}
{if $item3.Id[0] == $item.category } 
{assign var="count" value=$count+1}
{/if}{/foreach}
{/foreach}


{if $count > 0}
<table cellspacing="2" cellpadding="2" border="0">
<tr>
	<td valign="bottom" class="subtitle">{$templateconf.txtcategories}</td>
	<td class="plaintext">


{foreach from=$root.page.contentgroup.PreviewXML.category.item_attr item=item}
{foreach from=$tags item=item3}
{strip}
	{if $item3.Id[0] == $item.category }
		{assign var="count" value=$count-1}
		<a class="model_category_link" href="{include file="$spath/general/pg_category.tpl" id=$item3.Id[0] seoname=$item3.SEOname[0] item=$item3}">{$item3.Title[0]}</a>
		{if $count >0 },&nbsp;{/if}
	{/if}
{/strip}
{/foreach}
{/foreach}
</td>

</tr>
</table>
{/if}




{if $cms_pro}
<!--Suggest Tags-->
{include file="$spath/gallery/suggesttags.tpl"}
{/if}


</td>

{** Only show the grid if it's a movie type **}
{strip}
{assign var="showgrid" value=0}
{foreach from=$root.page.movietabs.item item="mtab" key="k"} 
	{if $root.page.settype[0]==$mtab }
		{foreach item=br from=$root.page.bitrates.item}
		  {foreach item=fm from=$root.page.formats.item} 
				{foreach from=$root.page.contenttypesub.type item="item"}
					{if ($item.Format[0] == $fm.Format[0]) && ($item.Bitrate[0] == $br.Bitrate[0])}
						{foreach from=$root.page.content.item item="tmp1"}
							{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
								{if ($tmp2.name == $item.Name[0]) && ($tmp2.type == $item.Type[0])}
									{assign var="showgrid" value=1}
								{/if}
							{/foreach}
						{/foreach}
					{/if}
				{/foreach}
		  {/foreach}
		{/foreach}
	{/if}
{/foreach}
{/strip}




<!--Download Movie Table-->

<!--Only show if on movie page-->
{if $showgrid == 1}
	<td valign="top" align="right">



{strip}
{assign var="showgrid_download" value=0}
{foreach from=$root.page.movietabs.item item="mtab" key="k"} 
	{if $root.page.settype[0]==$mtab }
		{foreach item=br from=$root.page.bitrates.item}
		  {foreach item=fm from=$root.page.formats.item} 
				{foreach from=$root.page.contenttypesub.type item="item"}
				{if ($item.ShowDownload[0] == "1" || $item.ShowDownload[0] == 2)}
					{if ($item.Format[0] == $fm.Format[0]) && ($item.Bitrate[0] == $br.Bitrate[0])}
						{foreach from=$root.page.content.item item="tmp1"}
							{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
								{if ($tmp2.name == $item.Name[0]) && ($tmp2.type == $item.Type[0])}
									{assign var="showgrid_download" value=1}
								{/if}
							{/foreach}
						{/foreach}
					{/if}
				{/if}
				{/foreach}
		  {/foreach}
		{/foreach}
	{/if}
{/foreach}
{/strip}

{if $showgrid_download == "1"}
<div class="movie_options_title_bar" colspan="{$root.page.formats.item|@count}">{$templateconf.txtfullmoviedownload}</div>

<table class="full_download_table">
<tr>
  {foreach item=fm from=$root.page.formats.item}
	{assign var="showcol" value="0"}

	{foreach item=br from=$root.page.bitrates.item}
			{foreach from=$root.page.contenttypesub.type item="item"}
				{if ($item.Format[0] == $fm.Format[0]) && ($item.Bitrate[0] == $br.Bitrate[0]) && ($item.Type[0] == $root.page.settype[0])}
					{foreach from=$root.page.content.item item="tmp1"}
						{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
							{if ($item.ShowDownload[0] == 1 || $item.ShowDownload[0] == 2) && ($tmp2.name == $item.Name[0]) && ($tmp2.type == $item.Type[0])}
							    {assign var="showcol" value="1"}
							{/if}
						{/foreach}
					{/foreach}
				{/if}
			{/foreach}
	{/foreach}

	{if $showcol == 1}
	<td class="full_download_option_title">
	{$fm.Format[0]}
	</td>
	{/if}

  {/foreach}
</tr>

{foreach item=br from=$root.page.bitrates.item}

	{assign var="showrow" value="0"}

	{foreach item=fm from=$root.page.formats.item}
	{strip}
	{assign var="showcol" value="0"}
		{foreach from=$root.page.contenttypesub.type item="item"}
			{if ($item.Format[0] == $fm.Format[0]) && ($item.Bitrate[0] == $br.Bitrate[0]) && ($item.Type[0] == $root.page.settype[0])}
				{foreach from=$root.page.content.item item="tmp1"}
					{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
						{if ($item.ShowDownload[0] == 1 || $item.ShowDownload[0] == 2) && ($tmp2.name == $item.Name[0]) && ($tmp2.type == $item.Type[0])}
						    {assign var="showrow" value="1"}
						{/if}
					{/foreach}
				{/foreach}
			{/if}
		{/foreach}
	{/strip}
	{/foreach}


{if $showrow == "1"}
<tr>
  {foreach item=fm from=$root.page.formats.item}
	{strip}
	{assign var="showcol" value="0"}
	{foreach item=brx from=$root.page.bitrates.item}
			{foreach from=$root.page.contenttypesub.type item="item"}
				{if ($item.Format[0] == $fm.Format[0]) && ($item.Bitrate[0] == $brx.Bitrate[0]) && ($item.Type[0] == $root.page.settype[0])}
					{foreach from=$root.page.content.item item="tmp1"}
						{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
							{if ($item.ShowDownload[0] == 1 || $item.ShowDownload[0] == 2) && ($tmp2.name == $item.Name[0]) && ($tmp2.type == $item.Type[0])}
							    {assign var="showcol" value="1"}
							{/if}
						{/foreach}
					{/foreach}
				{/if}
			{/foreach}
	{/foreach}
	{/strip}

	{if $showcol == "1"}
	{strip}
	   <td class="full_download_option" nowrap>
		{assign var="once" value="0"}
			{foreach from=$root.page.contenttypesub.type item="item"}
				{if ($item.Format[0] == $fm.Format[0]) && ($item.Bitrate[0] == $br.Bitrate[0])}
					{foreach from=$root.page.content.item item="tmp1"}
						{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
							{if ($item.ShowDownload[0] == 1 || $item.ShowDownload[0] == 2) && ($tmp2.name == $item.Name[0]) && ($tmp2.type == $item.Type[0])}

								{if $once == 1}<br />{/if}
								{assign var="once" value="1"}


								{if $tmp1.show[0] == 1}
									<a class="full_download_link" 
									 {if isset($root.page.trial) && $item.ShowDownload[0] == 2 && !in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)}
									 href="{$root.page.trial.VideoURL[0]}"
									 {else}
									 href="{#contentdir#}/upload/{$page.contentgroup.Directory[0]}/{$tmp1.Files.file[$k2]}"
							 		 onclick="return TrackDownload('{$tmp1.Id[0]}','{$root.page.contentgroup.Id[0]}','{$root.page.settype[0]}','{$item.Name[0]}')"
									 {/if}
									>
									{$item.Label[0]}
									</a>
								{else}
									<a href="javascript:alert('{$templateconf.txtcoming} {$tmp1.DateDisplay[0]}')" class="full_download_link" title="{$templateconf.txtcoming} {$tmp1.DateDisplay[0]}"><acro {$item.Label[0]}</span>
									{$item.Label[0]}</a>
								{/if}

							{/if}
						{/foreach}
					{/foreach}
				{/if}
			{/foreach}
	   </td>
	{/strip}
	{/if}
  {/foreach}
</tr>
{/if}
{/foreach}

</table>

{/if}



{strip}
{assign var="showgrid_play" value=0}
{foreach from=$root.page.movietabs.item item="mtab" key="k"} 
	{if $root.page.settype[0]==$mtab }
		{foreach item=br from=$root.page.bitrates.item}
		  {foreach item=fm from=$root.page.formats.item} 
				{foreach from=$root.page.contenttypesub.type item="item"}
				{if $item.ShowPlay[0] == "1" || $item.ShowPlay[0] == "2"}
					{if ($item.Format[0] == $fm.Format[0]) && ($item.Bitrate[0] == $br.Bitrate[0])}
						{foreach from=$root.page.content.item item="tmp1"}
							{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
								{if ($item.ShowPlay[0] == 1 || $item.ShowPlay[0] == 2) && ($tmp2.name == $item.Name[0]) && ($tmp2.type == $item.Type[0])}
									{assign var="showgrid_play" value=1}
								{/if}
							{/foreach}
						{/foreach}
					{/if}
				{/if}
				{/foreach}
		  {/foreach}
		{/foreach}
	{/if}
{/foreach}
{/strip}

{if $showgrid_play == "1"}


<!--Watch Movie Table-->
<div class="movie_options_title_bar" colspan="{$root.page.formats.item|@count}">{$templateconf.txtwatchmovie}</div>



<table class="full_download_table">
<tr>
  {foreach item=fm from=$root.page.formats.item}
	{assign var="showcol" value="0"}

	{foreach item=br from=$root.page.bitrates.item}
			{foreach from=$root.page.contenttypesub.type item="item"}
				{if ($item.Format[0] == $fm.Format[0]) && ($item.Bitrate[0] == $br.Bitrate[0]) && ($item.Type[0] == $root.page.settype[0])}
					{foreach from=$root.page.content.item item="tmp1"}
						{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
							{if ($item.ShowPlay[0] == 1 || $item.ShowPlay[0] == 2) && ($tmp2.name == $item.Name[0]) && ($tmp2.type == $item.Type[0])}
							    {assign var="showcol" value="1"}
							{/if}
						{/foreach}
					{/foreach}
				{/if}
			{/foreach}
	{/foreach}

	{if $showcol == 1}
	<td class="full_download_option_title">
	{$fm.Format[0]}
	</td>
	{/if}

  {/foreach}
</tr>

{foreach item=br from=$root.page.bitrates.item}

	{assign var="showrow" value="0"}

	{foreach item=fm from=$root.page.formats.item}
	{strip}
	{assign var="showcol" value="0"}
		{foreach from=$root.page.contenttypesub.type item="item"}
			{if ($item.Format[0] == $fm.Format[0]) && ($item.Bitrate[0] == $br.Bitrate[0]) && ($item.Type[0] == $root.page.settype[0])}
				{foreach from=$root.page.content.item item="tmp1"}
					{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
						{if ($item.ShowPlay[0] == 1 || $item.ShowPlay[0] == 2) && ($tmp2.name == $item.Name[0]) && ($tmp2.type == $item.Type[0])}
						    {assign var="showrow" value="1"}
						{/if}
					{/foreach}
				{/foreach}
			{/if}
		{/foreach}
	{/strip}
	{/foreach}


{if $showrow == "1"}
<tr>
  {foreach item=fm from=$root.page.formats.item}
	{strip}
	{assign var="showcol" value="0"}
	{foreach item=brx from=$root.page.bitrates.item}
			{foreach from=$root.page.contenttypesub.type item="item"}
				{if ($item.Format[0] == $fm.Format[0]) && ($item.Bitrate[0] == $brx.Bitrate[0]) && ($item.Type[0] == $root.page.settype[0])}
					{foreach from=$root.page.content.item item="tmp1"}
						{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
							{if ($item.ShowPlay[0] == 1 || $item.ShowPlay[0] == 2) && ($tmp2.name == $item.Name[0]) && ($tmp2.type == $item.Type[0])}
							    {assign var="showcol" value="1"}
							{/if}
						{/foreach}
					{/foreach}
				{/if}
			{/foreach}
	{/foreach}
	{/strip}

	{if $showcol == "1"}
	{strip}
	   <td class="full_download_option" nowrap>
		{assign var="once" value="0"}
			{foreach from=$root.page.contenttypesub.type item="item"}
				{if ($item.Format[0] == $fm.Format[0]) && ($item.Bitrate[0] == $br.Bitrate[0])}
					{foreach from=$root.page.content.item item="tmp1"}
						{foreach from=$tmp1.Files.file_attr item=tmp2 key="k2"}
							{if ($item.ShowPlay[0] == 1 || $item.ShowPlay[0] == 2) && ($tmp2.name == $item.Name[0]) && ($tmp2.type == $item.Type[0])}

								{if $once == 1}<br />{/if}
								{assign var="once" value="1"}


								{if $tmp1.show[0] == 1}
									<a class="full_download_link"
									 {if isset($root.page.trial) && $item.ShowPlay[0] == 2 && !in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)}
										 href="{$root.page.trial.VideoURL[0]}"
									 {else}
										 href="{include file="$spath/general/pg_image.tpl" type=$root.page.settype[0] id=$tmp1.Id[0] cg=$root.page.contentgroup.Id[0] mt=$tmp2.name}"
									 {/if}
									 >
									{$item.Label[0]}
									</a>
								{else}
									<a href="javascript:alert('{$templateconf.txtcoming} {$tmp1.DateDisplay[0]}')" class="full_download_link" title="{$templateconf.txtcoming} {$tmp1.DateDisplay[0]}"><acro {$item.Label[0]}</span>
									{$item.Label[0]}</a>
								{/if}
							{/if}
						{/foreach}
					{/foreach}
				{/if}
			{/foreach}
	   </td>
	{/strip}
	{/if}
  {/foreach}
</tr>
{/if}
{/foreach}

</table>

{/if}


</td>
{/if}





<!--Only show if on photo page-->
{if $root.page.settype[0] == "highres"}
	<td valign="top">

<!--Photo and Zip Table Shown if on Photos Page-->



{if isset($root.page.contentgroup.PreviewXML.zip) && $root.page.contentgroup.PreviewXML.zip|@count}
<div class="movie_options_title_bar" colspan="{$root.page.formats.item|@count}">{$templateconf.txtdownloadphotos}</div>
<table class="full_download_table">

<tr>
	{foreach from=$root.page.contentgroup.PreviewXML.zip item="zip" key="k"} 
	<td class="full_download_option" valign="top">				
		<table cellspacing="2" cellpadding="2" border="0">
		<tr>
		<td><img src="{$image_folder}/icons/save.gif" width="16" height="16" alt=""/></td>
			<td nowrap>
		<a class="zip_link" 
		{if !isset($root.page.trial) || ($root.page.trial.AllowZips[0] == 1)}
			href="{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$zip}" >
		{else}
			href="{$root.page.trial.ZipURL[0]}" >
		{/if}
	 	   {$root.page.contentgroup.PreviewXML.zip_attr[$k].id}</a>
	
		</td>
		</tr></table>
	
	</td>	
	{/foreach}
</tr>
</table>
{/if}





<div class="movie_options_title_bar" colspan="{$root.page.formats.item|@count}">{$templateconf.txtviewphotos}</div>


<table class="full_download_table">
<tr>

	{if isset($root.page.mediatype_attr[0].value)}

		 {foreach from=$root.page.watermark.item item="itemw"}
			{if $itemw.Wtype[0] == 'watermark' && $itemw.sourceType[0] == $root.page.settype[0]}
				{assign var="mt" value=$itemw.Name[0]}


		{assign var="showcol" value="0"}
		{foreach from=$root.page.contentgroup.PreviewXML.content.watermarks.name_attr item=wattr}
		{if $wattr.name == $itemw.Name[0]}
		  {assign var="showcol" value="1"}
		{/if}
		{/foreach}

		{if $showcol == "1"}
		<td class="full_download_option_title">
		<a class="photo_sizes_link" href="{include file="$spath/general/pg_gallery.tpl" id=$root.page.contentgroup.Id[0] type=$root.page.settype[0] page=$root.page.onpage[0] mt=$mt seoname=$root.page.contentgroup.SEOname[0] item=$root.page.contentgroup}">
		 {$itemw.Name[0]}</a>		
		</td>
		{/if}
	{/if}


{/foreach}
		{else}
			{assign var="tmp" value=0}
			{foreach from=$root.page.watermark.item item="itemw"} 

				{if $itemw.Wtype[0] == 'watermark' && $itemw.sourceType[0] == $root.page.settype[0]}

		{assign var="showcol" value="0"}
		{foreach from=$root.page.contentgroup.PreviewXML.content.watermarks.name_attr item=wattr}
		{if $wattr.name == $itemw.Name[0]}
		  {assign var="showcol" value="1"}
		{/if}
		{/foreach}
	
		{if $showcol == "1"}	
		<td class="full_download_option_title">
		<a class="photo_sizes_link" href="{include file="$spath/general/pg_gallery.tpl" id=$root.page.contentgroup.Id[0] type=$root.page.settype[0] page=$root.page.onpage[0] mt=$itemw.Name[0] seoname=$root.page.contentgroup.SEOname[0] item=$root.page.contentgroup}">
					   	{$itemw.Name[0]} </a>
		</td>
		{/if}

	{/if}
			{/foreach}
		
		{/if}
</tr>

</table>



   </td>
</tr>





</table>






             
             </td>
{/if}






          </tr>
        </table>









{** IF CURRENT PAGE IS THE PHOTO GALLERY PAGE **}


{assign var="go" value=0}
{foreach from=$root.page.movietabs.item item="mtab" key="k"} 
	{if $root.page.settype[0]==$mtab } {assign var="go" value=1} {/if}
{/foreach}

{assign var="go" value=0}
{foreach from=$root.page.movietabs.item item="mtab" key="k"} 
	{if $root.page.settype[0]==$mtab } {assign var="go" value=1} {/if}
{/foreach}
{if $go ==1 }

<!--Page Navigation-->
{if count($root.page.pages.page) > 1}{include file="$spath/gallery/pagenav.tpl"}{/if}




{assign var="go" value=0}
{foreach from=$root.page.movietabs.item item="mtab" key="k"} 
	{if $root.page.settype[0]==$mtab } {assign var="go" value=1} {/if}
{/foreach}








{strip}

{assign var="c" value=-1}
{assign var="count" value=0}

{foreach from=$root.page.content.item item="item" key="k" }
	{foreach from=$item.Files.file_attr item="fattr" }
		{foreach from=$root.page.contenttypesub.type item="cttype"}
			{if ($fattr.name == $cttype.Name[0]) && ($root.page.settype[0] == $cttype.Type[0]) && ($cttype.FullVideo[0] == "0") && ($c!=$k)}

				{assign var="c" value=$k}
			  	{if ($k+1)>=$startpos && ($k+1)<$endpos}
					{assign var ="count" value=$count+1}
				{/if}
			{/if}
		{/foreach}
	{/foreach}
{/foreach}

{if $count > 0}
<br />
<!--Title-->
<div class="title_bar">{$templateconf.txtindividualclips}</div>
{/if}
{/strip}

</div>
{assign var="c" value=-1}
{math equation="(el % $numcolumns_video)" el=$startpos assign="rem"} 
{assign var="rem1" value=0}
{assign var="count" value=0}







		<table align="center" cellpadding="2" cellspacing="1" border="0">
		{foreach from=$root.page.content.item item="item" key="k" }

			{assign var="hasformat" value="0"}
	
			{foreach from=$item.Files.file_attr item="fattr"}
				{foreach from=$root.page.contenttypesub.type item="cttype"}
					{if !$hasformat && ($fattr.name == $cttype.Name[0]) && ($root.page.settype[0] == $cttype.Type[0]) && ($cttype.FullVideo[0] == "0") && ($c!=$k)}
						{assign var="c" value=$k}
						{assign var="hasformat" value="1"}
						{assign var="count" value=$count+1}
					{/if}
				{/foreach}
			{/foreach}

		  	{if $hasformat && ($count)>=$startpos && ($count)<$endpos}			

				{assign var=ccount value=$count-1}

				{if ($ccount % $numcolumns_video) == 0 && $ccount!=0 }</tr><tr>{/if}
				{if $ccount == 0 } <tr> {/if}

				<td valign="top">
					 {include file="$spath/gallery/showthumb.tpl" item=$item pos=$ccount} 
				</td>
			{/if}

		{/foreach}
		{if $count!=0} </tr> {/if}
		</table>






	<!--This displays the Gallery Page Navigation table-->
	{if count($root.page.pages.page) > 1}
		{include file="$spath/gallery/pagenav.tpl"}
	{/if}


{else}





{** DISPLAYS PHOTO GALLERY WITH 5 COLS OF THUMBS **}

<br />

<div class="title_bar">{strip}

{if isset($root.page.mediatype_attr)}
 {$root.page.mediatype_attr[0].value}
{else}
 {** Basically try and get the first matching watermark that exists for this set **}
 {assign var="wname" value="0"}
 {foreach from=$root.page.watermark.item item=witem}
   {if ($witem.Wtype[0] == "watermark") && ($wname == 0) && ($witem.sourceType[0] == $root.page.settype[0])}

	{foreach from=$root.page.contentgroup.PreviewXML.content.watermarks.name_attr item=wattr}
	{if $wattr.name == $witem.Name[0]}
	    {assign var="wname" value="1"}
		{$witem.Name[0]}
	{/if}
	{/foreach}
   {/if}
 {/foreach}
{/if}

{/strip} {$templateconf.txtPhotos}</div>

<!--Page Navigation-->
{if count($root.page.pages.page) > 1}{include file="$spath/gallery/pagenav.tpl"}{/if}

	<table align="center" cellpadding="3" cellspacing="2" border="0">
	{math equation="(el % ncp)" el=$startpos ncp=$numcolumns_photo assign="rem"}

	{foreach from=$root.page.content.item item="item" key="k" }
  	{if  ($k+1) >= $startpos && ($k+1) < $endpos}
	{if (($k+1) % $numcolumns_photo) == $rem}
	<tr>

	{** To adjust the number of columns, change the value of numcolumns_photo at the top of this page **}

	{section name=columns start=0 loop=$numcolumns_photo step=1}
		<td valign="top">
			{assign var="tmpk" value=$k+$smarty.section.columns.index}

		  	{if ($tmpk+1) < $endpos}
			{include file="$spath/gallery/showthumb.tpl" item=$root.page.content.item[$tmpk] pos =$tmpk}
			{else}

			{/if}
		</td>
	{/section}

	</tr>
	{/if}
	{/if}
	{/foreach}
	</table>


<!--Page Navigation-->
{if count($root.page.pages.page) > 1}{include file="$spath/gallery/pagenav.tpl"}{/if}

   <!--End Content Wrapper Table-->
</td>

			</tr>

</table>
<!--End Gallery Table-->
{/if}


<!--Suggested Updates-->
{if $cms_pro && isset($root.page.relevant.item)}
<br />
{include file="$spath/gallery/suggestedupdates.tpl"}
{/if}

<br />
 


{if in_array('comments',$pluginsdata.plugins) && $pluginsdata.enabled.comments == 1 && $root.has_username}
<div class="title_bar">{$templateconf.txtcomments}</div>

<a name="comments">

<!--Comments-->
{include file="$spath/gallery/commentsui.tpl"}
{/if}

