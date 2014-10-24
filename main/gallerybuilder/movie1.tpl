<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	
<title>{$root.contentgroup[0].Title} Featuring {$root.contentgroup[0].PreviewXML.sets.set[0].ModelName[0]}</title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<!-- PrettyPhoto -->
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
<!-- PrettyPhoto -->


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


<table width="996" class="main_table" align="center" cellspacing="0" cellpadding="0">
<tr>
<td valign="top" align="center">

<table background="images/heading.gif" width="609" height="84" cellspacing="0" cellpadding="0">
<tr>
<td align="center" class="title">

<!--Update Title-->
{$root.contentgroup[0].Title}

</td>
</tr>
</table>


<!--Start Thumbnails-->

<table cellpadding="4">
<tr>
<td>{include file="movie_item.tpl" index="1"}</td>
<td>{include file="movie_item.tpl" index="2"}</td>
</tr>
<tr>
<td colspan="2" class="description">

<!--Update Description-->
{$root.contentgroup[0].Description}

</td>
</tr>

<tr>
<td colspan="2" id="join_link_big" align="center">
<a href="{$root.template.JoinURL}">Click to download the whole movie for PC, Mac, iPad, or Mobile</a>
</td>
</tr>

<tr>
<td>{include file="movie_item.tpl" index="3"}</td>
<td>{include file="movie_item.tpl" index="4"}</td>
</tr>

<tr>
<td>{include file="movie_item.tpl" index="5"}</td>
<td>{include file="movie_item.tpl" index="6"}</td>
</tr>
</table>



</td>




<td valign="top">

<a href="{$root.template.JoinURL}">
<img src="images/logo.jpg" width="325" height="295" border="0"><br>
<img src="images/mobile.jpg" width="304" height="214" border="0"><br>
<img src="images/banner.jpg" width="324" height="461" border="0">
</a>




</td>
</tr>




</table>


</td>
</tr>
</table>

<div align="center"id="join_link_big"><a href="{$root.template.JoinURL}"><img src="images/click.gif" width="996" height="47" border="0"><br>
All our movies can be downloaded and watched on your computer, iPad or mobile phone</a></div>

<br>

</body>
</html>





