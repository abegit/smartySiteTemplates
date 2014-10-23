<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	
<title>{$root.contentgroup[0].Title} Featuring {$root.contentgroup[0].PreviewXML.sets.set[0].ModelName[0]}</title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<!-- Start PrettyPhoto Includes -->
<script src="{$root.pathurl}/images/jquery.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="{$root.pathurl}/images/prettyPhoto.css" type="text/css" media="screen" charset="utf-8" />
<script src="{$root.pathurl}/images/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>

{literal}
<script type="text/javascript" charset="utf-8">
  $(document).ready(function(){
    $("a[rel^='prettyPhoto']").prettyPhoto({
		theme: 'light_rounded',
		overlay_gallery: false
	});
  });
</script>
{/literal}

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

<table class="main_table" align="center" cellspacing="0" cellpadding="0">
<tr>
<td>

<table cellspacing="0" cellpadding="0">
<tr>
<td valign="top" background="images/top.jpg" width="991" height="620">


<table style="margin-top:65px;" cellspacing="6" align="right">
<tr>

<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="1"}</td>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="2"}</td>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="3"}</td>
</tr>
<tr>
<td></td>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="4"}</td>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="5"}</td>
</tr>
<tr>
<td></td>
<td colspan="2" align="center">
<span id="join_link_big2">
<a href="{$root.template.JoinURL}">CLICK FOR A FREE VIDEO PREVIEW</a>
</span>
</td>
</tr>

<tr>
<td></td>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="6"}</td>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="7"}</td>
</tr>
</table>



</td>
</tr>
<tr>
<td><a href="{$root.template.JoinURL}"><img src="images/banner.jpg" width="991" height="185" border="0"></a></td>
</tr>


<tr>
<td align="center">

<!--Update Description-->
<div class="description">
{$root.contentgroup[0].Description}</div>

<span id="join_link_big">
<a href="{$root.template.JoinURL}">CLICK HERE FOR THE FULL PHOTO SET + WATCH THE VIDEO</a>
</span>


<!--Start Thumbnails-->

<table cellspacing="8">
<tr>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="8"}</td>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="9"}</td>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="10"}</td>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="11"}</td>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="12"}</td>
</tr>
<tr>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="13"}</td>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="14"}</td>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="15"}</td>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="16"}</td>
<td class="thumb_padding">{include file="photo_item.tpl" item=$root.content.item type="image" index="17"}</td>
</tr>
</table>

</td>
</tr>




<tr>
<td><a href="{$root.template.JoinURL}"><img src="images/click.gif" width="991" height="159" border="0"></a></td>
</tr>
</table>


</td>
</tr>
</table>

<br>

</body>
</html>





