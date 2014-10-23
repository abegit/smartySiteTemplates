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

<table width="994" class="main_table" align="center" cellspacing="0" cellpadding="0">
<tr>
<td>


<table cellspacing="0" cellpadding="0">
<tr>
<td><a href="{$root.template.JoinURL}"><img src="images/header.jpg" width="994" height="302" border="0"></a></td>
</tr>
<tr>
<td class="title">

<!--Update Title-->
{$root.contentgroup[0].Title}
</td>
</tr>
<tr>
<td><img src="images/header_bottom.jpg" width="994" height="35"></td>
</tr>


<tr>
<td align="center">


<!--Start Thumbnails-->

<table cellpadding="4">
<tr>
<td width="20%">{include file="photo_item.tpl" item=$root.content.item type="image" index="1"}</td>
<td width="20%">{include file="photo_item.tpl" item=$root.content.item type="image" index="2"}</td>
<td width="20%">{include file="photo_item.tpl" item=$root.content.item type="image" index="3"}</td>
<td width="20%">{include file="photo_item.tpl" item=$root.content.item type="image" index="4"}</td>
<td width="20%">{include file="photo_item.tpl" item=$root.content.item type="image" index="5"}</td>
</tr>
<tr>
<td colspan="5" id="join_link_big" align="center">
<a href="{$root.template.JoinURL}">Like these pics? Click here to watch her full length video and hundreds more.</a>
</td>
</tr>
<tr>
<td colspan="3" class="description">

<!--Update Description-->
{$root.contentgroup[0].Description}

</td>
<td>{include file="photo_item.tpl" item=$root.content.item type="image" index="6"}</td>
<td>{include file="photo_item.tpl" item=$root.content.item type="image" index="7"}</td>
</tr>

<tr>
<td>{include file="photo_item.tpl" item=$root.content.item type="image" index="8"}</td>
<td>{include file="photo_item.tpl" item=$root.content.item type="image" index="9"}</td>
<td>{include file="photo_item.tpl" item=$root.content.item type="image" index="10"}</td>
<td>{include file="photo_item.tpl" item=$root.content.item type="image" index="11"}</td>
<td>{include file="photo_item.tpl" item=$root.content.item type="image" index="12"}</td>
</tr>
<tr>
<td colspan="5" id="join_link_big2" align="center">
<a href="{$root.template.JoinURL}">Take a Free Tour of Our Site For Free Sample Videos!</a>
</td>
</tr>
<tr>
<td>{include file="photo_item.tpl" item=$root.content.item type="image" index="13"}</td>
<td>{include file="photo_item.tpl" item=$root.content.item type="image" index="14"}</td>
<td>{include file="photo_item.tpl" item=$root.content.item type="image" index="15"}</td>
<td>{include file="photo_item.tpl" item=$root.content.item type="image" index="16"}</td>
<td>{include file="photo_item.tpl" item=$root.content.item type="image" index="17"}</td>
</tr>
</table>


</td>
</tr>




<tr>
<td>
<a href="{$root.template.JoinURL}"><img src="images/click.gif" width="994" height="166" border="0"></a>
</td>
</tr>
</table>


</td>
</tr>
</table>

<br>

</body>
</html>





