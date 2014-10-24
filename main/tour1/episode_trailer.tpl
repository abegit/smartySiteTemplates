<div id="episode_trailer_page">
<a name="update"></a>

<div class="title_bar_center"><!--Title-->
{$item.Title[0]}</div>


<table class="trailer" cellspacing="0" cellpadding="0" border="0">
	<tr><td align="center">

<br>

{if $root.config.NumClickLimit[0] > 0 && $root.page.current.trailer_url[0]|@strstr:".jpg" != ".jpg"}
<div class="txtviewsremaining">{$templateconf.txtyouhave} <span id="clicksremaining">{$root.config.NumClickLimit[0]}</span> {$templateconf.txtvideoviewssremaining}</div>
{/if}


{if $root.page.current.trailer_url[0] != ""}
<div align="center">
{if ($root.page.current.trailer_url[0]|@strstr:".mp4" == ".mp4") || ($root.page.current.trailer_url[0]|@strstr:".mov" == ".mov") || ($root.page.current.trailer_url[0]|@strstr:".flv" == ".flv")}

 <script src="jwplayer.js"></script>
 <script type="text/javascript">jwplayer.key="qLzynSodouEg2o+gukjzO+6P0dzyHYq1TqcHaUF9cJE=";</script>
 <div id="preview"><div id="jwbox"></div></div>

 <!-- HIDDEN PROMO FORM -->
 <div id="hpromo" style="width:960px; height:540px; display:none;" align="center">{$templateconf.trailerjoin}</div>
 	<script>
	{literal}
		function playTrailer(){
	
			lmt = getCookieTLimit(ctlimit_name)
			remaining = maxClicks - lmt;
			
			if (document.getElementById("clicksremaining"))
			{
				document.getElementById("clicksremaining").innerHTML = remaining
			}
	
			document.getElementById('hpromo').style.display = 'none';
			document.getElementById('preview').style.visibility = 'visible';
	        document.getElementById('preview').style.display = '';		
	
		
		    jwplayer("jwbox").setup({
		        file: "{/literal}{$root.page.current.trailer_url[0]}{literal}",
		        width: 960,
		        height: 540,
				primary: "flash",
		        autostart: true,
				'events': {
					onComplete: function(e) {
				        document.getElementById('preview').style.display = 'none';
						document.getElementById('hpromo').style.display = 'block';
					}
		        }
		    });
		}
		function replay(){
			document.getElementById('hpromo').style.display = 'none';
			document.getElementById('preview').style.visibility = 'visible';
	
			playTrailer();
		}
	
		ret = tlimit();
		if (ret == true)
		{
	  		{/literal}playTrailer();{literal}
	  	}
	{/literal}
 	</script>
{elseif $root.page.current.trailer_url[0]|@strstr:".wmv" == ".wmv"}
 <script src="silverlight.js"></script>
 <script src="wmvplayer.js"></script>
 <div id="preview"></div>
 <script>

  {literal}
  ret = tlimit();
  if (ret == true)
  {
  {/literal}

    var wdth = "640"
    var hdth = "500"
    var imgg = "{$root.page.current.trailer_url[0]}"
	var inht = "";

    {literal}
	if (Silverlight.isInstalled("1.0"))
	{
	    var p_src = 'wmvplayer.xaml';
	    var p_cfg = {width:wdth,height:hdth,file:imgg,autostart:'true'};
	    var ply = new jeroenwijering.Player(document.getElementById("preview"),p_src,p_cfg);
	}
	else
	{
		var inht = "";

		if (document.all) // IE
		{
		 inht += "<object id='mediabox' ";
		 inht += "classid='CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95' ";
		 inht += "codebase='http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701' ";
		 inht += "standby='Loading Microsoft Windows Media Player components...' ";
		 inht += "type='application/x-oleobject' width='"+wdth+"' height='"+hdth+"''> ";
		 inht += "<param name='fileName' value=\""+imgg+"\"/> ";
		 inht += "<param name='animationatStart' value='true' /> ";
		 inht += "<param name='transparentatStart' value='true' /> ";
		 inht += "<param name='autoStart' value=\"true\" /> ";
		 inht += "<param name='showControls' value=\"true\" /> ";
		 inht += "<param name=\"ShowStatusBar\" value=\"true\" /> ";
		 inht += "<param name='loop' value=\"0\" /> ";
		 inht += "</object>"
		}
		else
		{
		// Code for anything but IE.
	
		 inht += "<object classid=\"CLSID:22D6F312-B0F6-11D0-94AB-0080C74C7E95\" width=\""+wdth+"\" height=\""+hdth+"\" type=\"application/x-oleobject\" >"
		 inht += "<param name=\"fileName\" value=\""+imgg+"\">"
		 inht += "<param name=\"autostart\" value=\"1\">"
		 inht += "<param name=\"ShowStatusBar\" value=\"true\" /> ";
		 inht += "<param name='showControls' value=\"true\" /> ";
		 inht += "<param name=\"volume\" value=\"0\">"
		 inht += "<EMBED type=\"application/x-mplayer2\" pluginspage = \"http://www.microsoft.com/Windows/MediaPlayer/\" "
		 inht += "SRC=\""+imgg+"\" name=\"MediaPlayer1\" width=\""+wdth+"\" "
		 inht += "height=\""+hdth+"\" AutoStart=\"true\" ShowStatusBar=\"1\" ShowControls=\"1\"></EMBED>"
		 inht += "</object>"
		} 

		document.getElementById("preview").innerHTML = inht
	}


    {/literal}



  {literal}
  }
  {/literal}

 </script>
{elseif $root.page.current.trailer_url[0]|@strstr:".jpg" == ".jpg"}
 <a href="{$root.page.tour.JoinUrl}"><img border="0" src="{$root.page.current.trailer_url[0]}" /></a>
{/if}

</div>
{/if}


{literal}
<table border="0">
<tr>

<td style="padding-right:30px;">
<!-- Place this tag where you want the +1 button to render -->
<g:plusone size="small" annotation="none"></g:plusone>

<!-- Place this render call where appropriate -->
<script type="text/javascript">
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>
<td>



<td>
<a href="https://twitter.com/share" class="twitter-share-button" data-lang="en">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
</td>

<td>
<div class="fb-like" data-href="{/literal}{include file="$spath/$tourname/pg_trailer.tpl" id=$root.page.contentgroup.Id[0] seoname=$root.page.contentgroup.SEOName[0]}{literal}" data-send="true" data-layout="button_count" data-width="90" data-show-faces="true" data-action="recommend"></div>
</td>


</tr>
</table>
{/literal}



</td>
</tr>
</table>


<p>


<div class="trailer_footer">
<a href="{$root.page.tour.JoinUrl}" class="join_links_big">{$templateconf.tourtxtjoinlink}</a>
</div>

</div>




<br>