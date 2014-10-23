{strip}
{if $root.page.settype[0]==$root.page.movietabs.item[0]}
{capture name="title"}{$root.page.contentgroup.Title[0]} - {$templateconf.txtMovies}{/capture}
{else}
{capture name="title"}{$root.page.contentgroup.Title[0]} - {$templateconf.txtphotogallery}{/capture}
{/if}

{assign var="flashtypes" value=".flv,.mp4,.mpeg4,.m4v,.m3u8,.webm"}
{assign var="flashtypes" value=$flashtypes|@explode:","}

{assign var="mtt" value=""}
{assign var="flasht" value="0"}



{foreach from=$root.page.contenttypesub.type item=contenttype}

{if $root.page.settype[0] == "vids" && $root.page.mediatype_attr[0].value == $contenttype.Name[0]}
  {assign var="mtt" value=$contenttype}

  {foreach from=$flashtypes item=flashtype}  
	  {if $mtt.Pattern[0]|@contains:$flashtype}
		{assign var="videoType" value=1}
	  {/if}
  {/foreach}
{/if}
{/foreach}


{/strip}{include file='general/page_top.tpl' pagename="images" title = $smarty.capture.title}


<div class="wrapper_liquid" align="center">
{include file="$spath/general/header.tpl"}
<!--Top Navbar-->
<div class="nav_liquid">
{include file="$spath/general/topnav.tpl"}</div>

{if isset($videoType)}


<script>
atst = [];
{foreach from=$flashtypes item=flashtype}
atst[atst.length] = "{$flashtype}";
{/foreach}

{literal}
$().ready(function()
{


barwidth= 205

if (picarr.length == 1)
{
	barwidth = 0
}

strt = 0;
endd = picarr.length;

var loc = document.location + ""
id = loc.match(/#(id=)?\d+/g) + ""
id = id.replace("#id=", "");
id = id.replace("#", "");

{/literal}
currid = "{$root.page.currentcontent.item[0].Id[0]}"
{literal}

if ( isNaN(parseInt(id)) && currid != "")
{
	id = parseInt(currid)
}

for (var cntx=0; cntx < picarr.length; cntx++)
{
	if (picarr[cntx][0] == id)
	{
		strt = cntx;
		endd = cntx + 1;
	}
}

for (var cntx=strt; cntx < endd; cntx++)
{
  nme = picarr[cntx][5]
  fnme = picarr[cntx][1]

  wdth = parseInt(picarr[cntx][2])
  hdth = parseInt(picarr[cntx][3])

  if (wdth+barwidth > 980)
  {
      hdth = hdth * (980-barwidth) / wdth;
      wdth = 980-barwidth;

	  picarr[cntx][2] = wdth
	  picarr[cntx][3] = hdth
  }

  flashmovie = 0;

  for(cnty = 0; cnty < atst.length; cnty++)
  {
     if (fnme.indexOf(atst[cnty]) != -1)
	 {
		flashmovie = 1;
	 }
  }

  if (flashmovie == 1)
  {
	var pxr = []

	for (var cntx=0; cntx < picarr.length; cntx++)
	{
	  nme = picarr[cntx][5]
	  fnme = picarr[cntx][1]

	  flashmovie = 0;
	
	  for(cnty = 0; cnty < atst.length; cnty++)
	  {
	     if (fnme.toLowerCase().indexOf(atst[cnty]) != -1)
		 {
			flashmovie = 1;
		 }
	  }

	  if (flashmovie == 1)
	  {
		pxr.push(picarr[cntx]);
	  }
	}
	
	picarr = pxr;

	jw_playerload();

	break;
  }

  RenderImg(picarr, cntx + ":index", "mediabox");
  break;
}

});
{/literal}


	  var flashvar_arr= new Array();
	
	  {foreach from=$templateconf item="itemvar" key=k}
	  {if (substr_count($k,'flashvars')) }
	  {capture name="tmp"}{$k|strstr:'flashvars'}{/capture}
	  flashvar_arr["{$smarty.capture.tmp|replace:'flashvars':''}"] = "{$itemvar}";
	  {/if}
	  {/foreach}
	  
	{literal}
	  var loc = document.location + ""
	  id = loc.match(/#(id=)?\d+/g) + ""
	  id = id.replace("#id=", "");
	  id = id.replace("#", "");

	{/literal}
	  if (id == "null") id = '{$root.page.currentcontent.item[0].Id[0]}'
	{literal}
	  picarr = new Array()
	{/literal}

{strip}
{assign var="pos" value=1}
  {foreach from=$root.page.content.item item="item" }
{foreach from=$item.Files.file_attr item="itemf"}
{if $itemf.name == $root.page.mediatype_attr[0].value} 
{include file="image/js_picarr_image.tpl" item=$item pos=$pos}
{assign var="pos" value=$pos+1}
{/if}
{/foreach}  
{/foreach}
{/strip}

  nourl = "";
  {if $root.page.trial}
   		nourl = "{$root.page.trial.VideoURL[0]}";
  {/if}
	
  var imgg = "";
	

{literal}
	function jw_playerload()
	{
		{/literal}
		var plg1_streamer = "{$templateconf.flashmoviestreamer}"
		var plg1_type     = "{$templateconf.flashmovietype}"
		
		var plg2_streamer = "{$templateconf.flashmp4streamer}"
		var plg2_type     = "{$templateconf.flashmp4type}"
		{literal}

	
	
		ld = -1;
	
		dc = document.location + ''
		dc = dc.substr(0,7) + dc.substr(7, dc.indexOf('/',7)-7) + '/'


		if (plg1_type == "http")
		{
			if (!plg1_streamer.match(/^http/))
			{
				areaurl = "{/literal}{#areaurl#}{literal}"
				if (areaurl.match(/^http/) && areaurl != "")
				{
					plg1_streamer = areaurl + "/" + plg1_streamer;
				}
				else if(areaurl == "")
				{
					// If there's no area URL, do nothing here.
					plg1_streamer = plg1_streamer;
				}
				else
				{
					plg1_streamer = "http://" + window.location.hostname + "/" + "{/literal}{#areaurl#}{literal}" + plg1_streamer;
				}
			}
		}
	
		passobj = {}	
		var lst = [];
		var titl = ""
		wdth = 320;
		hdth = 240;
		barwidth= 205;	
	 
		parx = []
	 
		{/literal}
		{assign var="clippos" value="0"}
	
		{foreach from=$root.page.content.item item="item" key="ki"}
		{foreach from=$item.Files.file_attr item="itemf" key="kf"}
		{if $itemf.name == $root.page.mediatype_attr[0].value}
		{assign var="clippos" value=$clippos+1}
		{if !isset($root.page.trial) || (in_array($clippos, $root.page.trial.AccessClips.page) || $root.page.trial.AccessClips.page[0] == 0 || in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id))}
	
			{assign var="position" value=$ki+1}	
			{assign var="tmpfile1" value=""}
			{assign var="vtt_file" value=""}

			{if $item.Files.file_attr[$kf].vtt_file}
				{capture assign="vtt_file"}{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$item.Files.file_attr[$kf].vtt_file}{/capture}
			{/if}
			
	
			{if $itemf.sourcetype == $root.page.settype[0] && $itemf.name=='thumb' }
				{assign var="tmpfile1" value=$item.Files.file[$kf]}
			{/if}

			{if $tmpfile1 == ""}
				{foreach from=$item.Files.file_attr item="itemf2" key="k3"}
					{if $itemf2.name == 'thumb' and $itemf2.cname=='Large Video Thumbnails' }
						{assign var="tmpfile1" value=$item.Files.file[$k3]}
					{/if}
				{/foreach}
			{/if}

			{if $tmpfile1 == ""}
				{foreach from=$item.Files.file_attr item="itemf2" key="k3"}
					{if $itemf2.name == 'thumb' and $itemf2.cname=='Video Thumbnails' }
						{assign var="tmpfile1" value=$item.Files.file[$k3]}
					{/if}
				{/foreach}
			{/if}
			
			parx[parx.length] = {literal}{{/literal}
				id: {$item.Id[0]},
				file: "{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$item.Files.file[$kf]}".replace("//", "/"), 
				title: "Clip {$clippos}",
				{if $tmpfile1}
				image: dc + "/{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$tmpfile1}",
				{/if}
				{if $vtt_file}
				vtt_file: "{$vtt_file}",
				{/if}
				width: parseInt('{$item.Files.file_attr[$kf].movie_width}'),
				height: parseInt('{$item.Files.file_attr[$kf].movie_height}')
			{literal}}{/literal}
		{/if}
		{/if}
		{/foreach}  
		{/foreach}
		{literal}	


		for(i = 0; i < parx.length; i++)
		{
			parxx = parx[i];
			ld = (id == parxx.id) ? i : ld;
		
			listitem = {}
			listitem.title = parxx.title;
			if (parxx.image)
			{
				listitem.image = parxx.image;
			}
			

			
			wdth = Math.max(wdth, parxx.width)
			hdth = Math.max(hdth, parxx.height)

			if ((parxx.file.split('.').pop() == "mp4" || parxx.file.split('.').pop() == "m4v" || parxx.file.split('.').pop() == "f4v"))
			{	
				fl_streamer = plg2_streamer;
				fl_type = plg2_type;
				rtmp_prefix = "mp4"
			}
			else
			{
				fl_streamer = plg1_streamer;
				fl_type = plg1_type;
				rtmp_prefix = "flv"
			}
			
			if (parxx.vtt_file)
			{
				listitem.tracks = [{ 
			            file: parxx.vtt_file, 
			            kind: "thumbnails"
			        }];
			}
			
			if (fl_type == "lighttpd")
			{
				passobj.startparam = "start";
				listitem.file = parxx.file;
			}
			else if (fl_type == "http" && (fl_streamer.indexOf("stream.php") != -1))
			{		
				listitem.file = fl_streamer + "?file=" + encodeURI(parxx.file);
				passobj.startparam = "start";
				listitem.type = "flv"
			}
			else if (fl_type == "http")
			{
				console.log("Please contact CMS support to setup / configure pseudostreaming")
				listitem.file = parxx.file;
			}
			else if (fl_type == "rtmp")
			{				
				listitem.file = fl_streamer + "/" + rtmp_prefix + ":" + parxx.file;
			}
			else
			{
				listitem.file = parxx.file;
			}
				
			lst[lst.length] = listitem;
		}

		// Now do all of the setup stuff.

		if (flashvar_arr["galleryautoplay"] == "0")
		{
			passobj.autostart = false;
		}
		else
		{
			passobj.autostart = true;
		}
		
		passobj.playlist = lst;
		passobj.width = wdth;
		passobj.height = hdth;
		passobj.primary = "flash";
		
		if (lst.length > 1)
		{
			passobj.listbar = {
				position: 'right',
				size: barwidth
			}
		}
		else
		{
			barwidth = 0;
		}
	
		if (wdth+barwidth > 980)
		{
			hdth = hdth * (980-barwidth) / wdth;
			wdth = 980-barwidth;
		}
			
		passobj.width = wdth + barwidth;
		passobj.height = hdth;
		
		jwplayer("mediabox").setup(passobj);
		if (ld != -1)
		{
			jwplayer("mediabox").playlistItem(ld);
		}
	
	}

	</script>
	{/literal}
{/if}

<script>
 var username="###username###"
 var password="###password###"

  vidtypes = new Array()
	{foreach from=$root.page.movietabs.item item="itemTab"}
		 vidtypes.push('{$itemTab}')
	{/foreach}
</script>


{literal}
<!--JS required by rating form-->
<script type="text/JavaScript">
	function frmsubmit(u, v) {
	if (document.all)	{
	u.form.submit()
	} else {
	document.forms[v].submit()
	}
	}
	
	function readCookie(name){
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++)	{
	var c = ca[i];
	while (c.charAt(0)==' ') c = c.substring(1,c.length);
	if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
	}
</script>
{/literal}

{if $root.page.trial}
    	{assign var="numperpage" value=$root.page.trial.numperpage[0]}

	{foreach from=$root.page.content.item item="tmpI"}
		{if $tmpI.Id[0] == $root.page.currentcontent.item[0].Id[0]}
			{assign var="indexpos" value=$tmpI}
		{/if}
	{/foreach}

	{assign var="citem" value=""}
	{foreach from=$root.page.contenttypesub.type item=cii}
	{if $cii.Name[0] == $root.page.mediatype_attr[0].value && $cii.Type[0] == $root.page.settype[0]}
	  {assign var="citem" value=$cii}
	{/if}
	{/foreach}

	{math equation="ceil(el1/el2)" el1=$indexpos.position[0] el2=$numperpage assign="pagenum"}


	{** If we're dealing with a full video **}
	{if is_array($citem) && ($citem.FullVideo[0] == 1 || $citem.FullVideo[0] == 2)}

		{** If it's an upgrade URL, but is a recent video **}
		{if $citem.ShowPlay[0] == 2 && in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)}
			<div align="center" class="full_photo_wrapper">
			{include file="$spath/image/image1.tpl"}
			</div>

		{** If it's an Play URL, but is a recent video **}
		{elseif $citem.ShowPlay[0] == 1}
			<div align="center" class="full_photo_wrapper">
			{include file="$spath/image/image1.tpl"}
			</div>

		{** Otherwise, permission denied **}
		{else}
			<p align="center">
			<strong>{$templateconf.txttrialmembersnotallowed}</strong>
			<br /><a href="javascript:history.go(-1);">{$templateconf.txtgoback}</a>
			</p> 
		{/if}
	{elseif (in_array($pagenum, $root.page.trial.ClickPages.page) || in_array(0, $root.page.trial.ClickPages.page) || in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)) && ($root.page.settype[0] == 'highres') }
		<div align="center" class="full_photo_wrapper">
		{include file="$spath/image/image1.tpl"}
		</div>
	{elseif $root.page.trial.AccessClips.page[0] == $indexpos.position[0] || $root.page.trial.AccessClips.page[0] ==0  || in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)	&& in_array($root.page.settype[0], $root.page.movietabs.item[0])}
		<div align="center" class="full_photo_wrapper">
		{include file="$spath/image/image1.tpl"}
		</div>
	{else}
		<p align="center">
		<strong>{$templateconf.txttrialmembersnotallowed}</strong>
		<br /><a href="javascript:history.go(-1);">{$templateconf.txtgoback}</a>
		</p> 
	{/if}
{else}

<div align="center" class="full_photo_wrapper">
{include file="$spath/image/image1.tpl"}
</div>
{/if}

</div>

<!--Footer-->
<div class="footer_liquid">{include file="$spath/general/page_bottom.tpl"}</div>