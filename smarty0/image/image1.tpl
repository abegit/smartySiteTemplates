{assign var="curritem" value=$root.page.currentcontent.item[0]}
{assign var="contentid" value=$root.page.currentcontent.item[0].Id[0]}
{assign var="directory" value=$root.page.contentgroup.Directory[0]}


{foreach from=$root.page.movietabs.item item="tmpmv"}
	{if $root.page.settype[0] == $tmpmv && !isset($passMV)}
		{assign var="passMV" value=1}
	{/if}
{/foreach}

{assign var="mediatype" value=$root.page.mediatype_attr[0].value}

{assign var="flashmovie" value="0"}
{assign var="mtt" value=""}
{assign var="flasht" value="0"}

{foreach from=$root.page.contenttypesub.type item=contenttype}

{if $root.page.settype[0] == "vids" && $root.page.mediatype_attr[0].value == $contenttype.Name[0]}
  {assign var="mtt" value=$contenttype}

  {if (
		 $mtt.Pattern[0]|@contains:'flv' ||
		 $mtt.Pattern[0]|@contains:'mp4' ||
		 $mtt.Pattern[0]|@contains:'m4v'
		)}
		{assign var="flasht" value=1}
  {/if}
{/if}
{/foreach}

{** check if the Media Type is flv or Flash **}
{foreach from=$root.page.mediatype_attr item="mitem"}
	{if (
		 $mitem.value|@contains:'flv'   || 
		 $mitem.value|@contains:'flash' || 
		 $mitem.value|@contains:'mp4'   || 
		 $mitem.value|@contains:'mpeg4' ||
		 $mitem.value|@contains:'m4v'   ||
		 $flasht == '1'
		)}
		{assign var="flashmovie" value=1}
	{/if}
{/foreach}


{if isset($passMV)}


<!--Title Bar-->
<div class="title_bar_center">
{if $root.page.settype[0] == $root.page.movietabs.item[0]}
{$root.page.contentgroup.Title[0]} - {$templateconf.txtMovies}
{else}
{$root.page.contentgroup.Title[0]} - {$templateconf.txtPhotos}{/if}</div>




<br>


<!--Photo/Clip Navigation-->
{include file="$spath/image/imagenav.tpl" navarea="top"}


<!--Movie-->

{if $flashmovie == "1" }
	{** get the file name **}
	
	{assign var="wM" value=320}
	{assign var="hM" value=240}
	
	{foreach from=$curritem.Files.file_attr item="f" key="k"}
		{if $f.name == $root.page.mediatype_attr[0].value}
			{if !isset($fileM)}{assign var="fileM" value=$curritem.Files.file[$k]}{/if}
			{if !isset($wM)} {assign var="wM" value=$f.movie_width} {/if}
			{if !isset($hM)} {assign var="hM" value=$f.movie_height} {/if}
		{/if}


	{/foreach}
	{capture name="src"}content/upload/{$root.page.contentgroup.Directory[0]}/{$fileM}{/capture}						
		{include file="$spath/image/playflash.tpl" src=$smarty.capture.src width=$wM height=$hM}
{/if}


{if isset($passMV)}

	{assign var="mw" value="320"}
	{assign var="mh" value="240"}

	{foreach from=$curritem.Files.file_attr item="tmp" key="tmpk"}
		{if $tmp.name == $root.page.mediatype_attr[0].value}
			{assign var="file" value=$curritem.Files.file[$tmpk]}
			{assign var="mw" value=$tmp.movie_width}
			{assign var="mh" value=$tmp.movie_height}
		{/if}
	{/foreach}
{capture name="src" }{#contentdir#}/upload/{$root.page.contentgroup.Directory[0]}/{$file}{/capture} 
{include file="$spath/image/playmovie.tpl" src=$smarty.capture.src width=$mw height=$mh}



{literal}
	<script>
		  var loc = document.location + ""
		
		  id = loc.match(/#(.*)(\d+)/g) + ""
		  id = id.replace("#id=", "");
		  id = id.replace("#", "");
		
		  if (id == "null") id = '{/literal}{$root.page.currentcontent.item[0].Id[0]}'
		
		  picarr = new Array()
		  {assign var="pospass" value="0"}
		  {foreach from=$root.page.content.item item="tmp" key="k"}
			{foreach from=$tmp.Files.file_attr item="tmpF"}
			{if $tmpF.name == $root.page.mediatype_attr[0].value}
				{math equation="tx+ty" tx=$pospass ty=1 assign=pospass}
				{include file="$spath/image/js_picarr_image.tpl" item=$tmp pos=$pospass}
			{/if}  
			{/foreach}
		 {/foreach}
		  imgg = ""
		
		  nourl = ""
		  {if isset($root.page.trial)}
		   	nourl = "{$root.page.trial.VideoURL[0]}"
		  {/if}



	{if $flashmovie == "0"}
	{literal}
	var jQpicarr = jQuery.noConflict();
		jQpicarr(document).ready(function() {
	  RenderImg(picarr, id, "mediabox")
	    });
	{/literal}
	{/if}

	{literal}
	</script>
	{/literal}
{/if}



<!--Photo/Clip Navigation-->
{include file="$spath/image/imagenav.tpl" navarea="bot"}


   


{else}

<div align="center" class="full_photo_wrapper">

<!--Photo/Clip Navigation-->
{include file="$spath/image/imagenav.tpl" navarea="top"}

	
	<noscript>
	<!--This displays the full size photo-->
	{capture name="src"}{/capture}
	{foreach from=$curritem.Files.file_attr item="itemF" key="keyF"}
		{if $itemF.cname == 'watermark' and $itemF.sourcetype == $root.page.settype[0] and $itemF.cname == $root.page.mediatype[0].value and $smarty.capture.src==''}
			{capture name="src"}{#contentdir#}/upload/{$directory}/{$curritem.Files.file[$keyF]}{/capture}
		{elseif $itemF.cname == 'watermark' and $itemF.sourcetype == $root.page.settype[0] and !isset($root.page.mediatype) }
			{capture name="src"}{#contentdir#}/upload/{$directory}/{$curritem.Files.file[$keyF]}{/capture}
		{elseif $itemF.cname == 'watermark'}
			{capture name="src"}{#contentdir#}/upload/{$directory}/{$curritem.Files.file[$keyF]}{/capture}
		{elseif $itemF.name =='jpg'}
			{capture name="src"}{#contentdir#}/upload/{$directory}/{$curritem.Files.file[$keyF]}{/capture}
		{/if}	
		
	{/foreach}
	<img class="thumbs" style="margin-top:3px;" alt="photo" src="{$smarty.capture.src}" />
	</noscript> 
	
	
	<div id="mediabox"
		ontouchstart="touchStart(event,'mediabox');" ontouchend="touchEnd(event);" ontouchmove="touchMove(event);" ontouchcancel="touchCancel(event);"
	></div>
	
	
	<script>
	{literal}

	function processingRoutine() {
		triggerElementId="mediabox";
		var swipedElement = document.getElementById(triggerElementID);
	
		if ( swipeDirection == 'left' ) {
			NextImage();
		} else if ( swipeDirection == 'right' ) {
			PrevImage();
		}
	}
	{/literal}

	</script>
	
	{literal}
	<script style="text/javascript">
	  var loc = document.location + ""
	
	  id = loc.match(/#id=(\d+)/g) + ""
	  id = id.replace("#id=", "");
	
	  if (id == "null") id = '{/literal}{$root.page.currentcontent.item[0].Id[0]}{literal}'
	
	  picarr = new Array()
	{/literal}
	  {assign var="pospass" value="0"}
	  {foreach from=$root.page.content.item item="itemC" key="keyC"}
		{math equation="tx+ty" tx=$pospass ty=1 assign=pospass}
		{include file="$spath/image/js_picarr_image.tpl" item=$itemC pos=$pospass}
	  {/foreach}
	
	{literal}	
	  nourl = ""
	{/literal}
	  {if isset($root.page.trial)}
	   	nourl = "{$root.page.trial.PhotoURL[0]}"
	  {/if}
	
	{literal}
	  imgg = ""
	  var jQimage = jQuery.noConflict();
		jQimage().ready(function()
		{
		  RenderImg(picarr, id, "mediabox");
	   });


	</script>
	{/literal}



	<!--Photo/Clip Navigation-->
{include file="$spath/image/imagenav.tpl" navarea="bot"}
	
	<!--Slide Show-->
	{include file="$spath/image/slideshow.tpl" }
	
		</div>

{/if}
