<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	
<title>{$root.contentgroup[0].Title} Featuring {$root.contentgroup[0].PreviewXML.sets.set[0].ModelName[0]}</title>
<link href="images/style.css" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<!-- Start PrettyPhoto Includes -->
<link rel="stylesheet" href="./images/prettyPhoto.css" type="text/css" media="screen" charset="utf-8" />

<script type="text/javascript" src="./images/jquery.js"></script>
<script type="text/javascript" src="./images/jwplayer.js"></script>
<script type="text/javascript">jwplayer.key="qLzynSodouEg2o+gukjzO+6P0dzyHYq1TqcHaUF9cJE=";</script>
<script src="./images/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8">
{literal}
var cursel = "nullvalue";

  $(document).ready(function(){
    $("a[rel^='prettyVideo']").prettyPhoto({
		theme: 'light_rounded',
		custom_markup: '<div><div id="video_canvas"></div></div>',
		changepicturecallback: function(){ 
			video_init();
		}
	});

    $("a[rel^='prettyPhoto']").prettyPhoto({
		theme: 'light_rounded',
		overlay_gallery: false
	});

    $("a[rel^='prettyVideo']").click(function() {


		cursel = $(this).attr("id");
	});

  });

function video_init()
{
	if (cursel == "nullvalue")
	{
		setTimeout("video_init()", 100);
		return;
	}

	vidurl = $("#"+cursel).attr("videourl");
	turl = $("#"+cursel+"_thumb").attr("src");

	m_w = $("#"+cursel).attr("movie_width");
	m_h = $("#"+cursel).attr("movie_height");

	astart = (window.touch) ? false : true;

	jwplayer('video_canvas').setup({
	  file: vidurl,
	  image: turl,
	  autostart: astart,
	  width: m_w,
	  height: m_h
	});

	cursel = "nullvalue"
}

{/literal}
</script>
<!-- End PrettyPhoto Includes -->


</head>



<body>

<div align="center" id="header">

<table width="996" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td>

<a href="http://www.elevatedx.com"><img src="images/logo.gif" width="195" height="25" border="0"></a>
</td>
	<td style="color:#ffffff;">

Created automatically by Elevated X Adult Content Management System Software.

</td>
	<td>

<table>
<tr>
<td><img src="images/phone.gif"></td>
<td class="tel">(800) 690-9277  Mon-Fri 9-5 PST</td>
</tr>
</table>

</td>
</tr>

</table>
</div>



<div id="headerspacer">&nbsp;</div>

<br>


<table width="990" class="main_table" align="center" cellspacing="0" cellpadding="0">
<tr>
<td valign="top" align="center">

<table cellspacing="0" cellpadding="0">
<tr>
<td background="images/top.jpg" width="990" height="698" align="right" valign="top">


<table style="margin-top:10px;margin-right:10px;" cellpadding="4">
<tr>
<td colspan="5" class="title" align="center">

<!--Update Title-->
{$root.contentgroup[0].Title}

</td>
</tr>

<tr>
<td colspan="5" id="join_link_big" align="center">

<div >
<a href="{$root.template.JoinURL}">LIKE THESE FREE PICS? CLICK HERE FOR HER VIDEOS!</a>
</div>

</td>
</tr>

<!--Start Thumbnails-->
<tr>
<td>{include file="photo_item.tpl" index="1"}</td>
<td>{include file="photo_item.tpl" index="2"}</td>
<td>{include file="photo_item.tpl" index="3"}</td>
<td>{include file="photo_item.tpl" index="4"}</td>
<td>{include file="photo_item.tpl" index="5"}</td>
</tr>

</table>



</td>
</tr>

<tr><td valign="middle" background="images/bottom.jpg" width="990" height="547">



<table style="margin-top:30px;margin-left:30px;" width="675" cellpadding="5" cellspacing="2">


<!--Start Movies-->
<tr>
<td align="center">{include file="movie_item.tpl" index="1"}
<br>
<b>PLAY THE FREE VIDEO</b></td>
<td align="center">{include file="movie_item.tpl" index="2"}
<br>
<b>PLAY THE FREE VIDEO</b></td>
</tr>

<tr>
<td colspan="2">

<!--Update Description-->
<div class="description">
{$root.contentgroup[0].Description}

<br>
<br>
<span id="join_link_big2">
<a href="{$root.template.JoinURL}">WATCH HER FULL LENGTH VIDEOS NOW!</a>
</span>

</div>

</td>
</tr>

</table>


</td>
</tr>
<tr><td><a href="{$root.template.JoinURL}"><img src="images/click.gif" width="990" height="127" border="0"></a></td>
</tr>
</table>


<br>

</body>
</html>





