{**
  If this is set to 1, show all movie formats within the flash player.
  If this is set to 0, it won't show the sidebar, and only show the first movie available.
**}
{assign var="flashtypes" value=".flv,.mp4,.mpeg4,.m4v,.m3u8,.webm"}
{assign var="flashtypes" value=$flashtypes|@explode:","}

<!--Title-->
<div class="movie_background">

{**
* @param name
* @param curritem
* 
**}


<script>

var flashvar_arr= new Array()
	
{foreach from=$templateconf item="itemvar" key=k}
{if (substr_count($k,'flashvars')) }
	{capture name="tmp"}{$k|strstr:'flashvars'}{/capture}
	flashvar_arr["{$smarty.capture.tmp|replace:'flashvars':''}"] = "{$itemvar}";
{/if}
{/foreach}

picarr = new Array();

{strip}

{if $name}

{foreach from=$root.page.contenttypesub.type item="csub"}
{if ($csub.FullVideo[0] == 2) && ($csub.ShowPlay[0] != 2 || in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)) && ($csub.Type[0] == $root.page.settype[0])}
	{foreach from=$root.page.content.item item="item" key="itemK"}
		{foreach from=$item.Files.file_attr item="fattr"}
			{if $fattr.name == $csub.Name[0]} 
					{include file="$spath/gallery/js_picarr.tpl" item=$item pos=$itemK fullplayName = $csub.Name[0] fullplayType = $csub.Name[0] label=$csub.Label[0] }
			{/if}
		{/foreach}
	{/foreach}
{/if}
{/foreach}

{elseif $trailer}

picarr.push(["", "{#trailer_folder#}{$trailer}",'960','540','vids', 'trailer', '{$root.page.contentgroup.Id[0]}', '']);

{/if}

{/strip}

  imgg = ""
  id = '{$curritem.Id[0]}';
</script>

<div id="hpromo" style="display:none; width:960px; height:540px; " align="center">{$templateconf.trailerjoin}</div>

<div align="center" style="padding-top:15px;">
<div style="color:white;" id="mediabox" align="center"></div>
</div>

<!-- Do not delete this -->
<div id="nomansland" style="width:0px; height:0px;position:absolute;"></div>
<script>
atst = [];
{foreach from=$flashtypes item=flashtype}
atst[atst.length] = "{$flashtype}";
{/foreach}

{literal}
var jQmovie = jQuery.noConflict();
jQmovie().ready(function()
{
    var pxr = [];

	for (var cntx=0; cntx < picarr.length; cntx++)
	{
	  nme = picarr[cntx][5]
	  fnme = picarr[cntx][1]
	
	  flashmovie = 0;
	
	  for(cnty = 0; cnty < atst.length; cnty++)
	  {
	     if (fnme.toLowerCase().indexOf(atst[cnty]) != -1 || fnme.toLowerCase().indexOf(atst[cnty]) != -1)
		 {
			flashmovie = 1;
			pxr.push(picarr[cntx]);
		 }
	  }
	}
	  
    if (flashmovie == 1)
	{
		picarr = pxr;
		jw_playerload();
		return;
	} 
	
	RenderImg(picarr, cntx + ":index", "mediabox");
});

{/literal}
useimage = "";

{foreach from=$root.page.contentgroup.PreviewXML.element.item_attr item=itm}
 {if $itm.priority == 9}
  useimage = "{#contentdir#}/contentthumbs/{$itm.Id}.{$itm.Extension}"
 {/if}
{/foreach}


{literal}
function jw_playerload()
{
	{/literal}
	var plg1_streamer = "{$templateconf.flashmoviestreamer}"
	var plg1_type     = "{$templateconf.flashmovietype}"
	
	var plg2_streamer = "{$templateconf.flashmp4streamer}"
	var plg2_type     = "{$templateconf.flashmp4type}"
	{literal}

	var hasFlash = false;
	try {
	  var fo = new ActiveXObject('ShockwaveFlash.ShockwaveFlash');
	  if (fo) {
	    hasFlash = true;
	  }
	} catch (e) {
	  if (navigator.mimeTypes
	        && navigator.mimeTypes['application/x-shockwave-flash'] != undefined
	        && navigator.mimeTypes['application/x-shockwave-flash'].enabledPlugin) {
	    hasFlash = true;
	  }
	}	
	
	// If FLV streamer is of type http and doesn't include a full http URL, add one
	if (plg1_type == "http")
	{
		if (!plg1_streamer.match(/^http/))
		{
			areaurl = "{/literal}{#areaurl#}{literal}"
			if (areaurl.match(/^http/))
			{
				plg1_streamer = areaurl + "/" + plg1_streamer;
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
	wdth = 980;
	hdth = 500;
		
	for (var cntx=0; cntx < picarr.length; cntx++)
	{
		pa = picarr[cntx]

		wdth = 980;		
		hdth = Math.ceil(parseInt(picarr[cntx][3]) * (980) / parseInt(picarr[cntx][2]));
		
		if (pa[7] != '')
		{
			titl = pa[7];
		}
		else
		{
			titl = "Clip #" + (cntx+1);
		}
		
		flee = pa[1] + "";
		
		listitem = {}
		listitem.label = titl;

		if (pa[9])
		{
			passobj.tracks = [{ 
		            file: pa[9], 
		            kind: "thumbnails"
		        }];
		}

		if (useimage != "")
		{
			listitem.image = useimage;
		}
		else
		{
			listitem.image = pa[8]
		}
		
		if ((flee.split('.').pop() == "mp4" || flee.split('.').pop() == "m4v" || flee.split('.').pop() == "f4v"))
		{	
			fl_streamer = plg2_streamer;
			fl_type = plg2_type;
			rtmp_prefix = "mp4"
		}
		else if (flee.split('.').pop() == "flv")
		{
			fl_streamer = plg1_streamer;
			fl_type = plg1_type;
			rtmp_prefix = "flv"
		}
		else
		{
			fl_streamer = plg1_streamer;
			fl_type = plg1_type;
			rtmp_prefix = ""
		}

		
		if (fl_type == "lighttpd")
		{
			passobj.startparam = "start";
			listitem.file = flee;
		}
		else if (fl_type == "http" && (fl_streamer.indexOf("stream.php") != -1) && (rtmp_prefix == "flv"))
		{		
			listitem.file = fl_streamer + "?file=" + encodeURI(parxx.file);
			passobj.startparam = "start";
			listitem.type = "flv"
		}
		else if (fl_type == "http")
		{
			console.log("Please contact CMS support to setup / configure pseudostreaming")
			listitem.file = flee;
		}
		else if (fl_type == "rtmp" && hasFlash)
		{
			listitem.file = fl_streamer + "/" + rtmp_prefix + ":" + flee;
		}
		else
		{
			listitem.file = flee;
		}
		
		lst[lst.length] = listitem;		  
	}
		
	if (flashvar_arr["galleryautoplay"] == "0")
	{
		passobj.autostart = false;
	}
	else
	{
		passobj.autostart = true;
	}
	
	passobj.sources = lst;
	passobj.width = wdth;
	passobj.height = hdth;
	passobj.primary = "flash";
	
	{/literal}{if (isset($root.page.trial))}{literal}
	passobj.events = {'onComplete' : (function() {

        document.getElementById('mediabox').style.display = 'none';
        document.getElementById('hpromo').style.display = 'block';

        if (document.getElementById("postroll_url"))
        {
		  document.getElementById("postroll_url").href = "{/literal}{$root.page.trial.VideoURL[0]}{literal}";
        }

	})};

	{/literal}{/if}{literal}
	
	jwplayer("mediabox").setup(passobj);
}
{/literal}



</script>
<br>
</div>
