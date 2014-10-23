<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	
<title>{$root.contentgroup[0].Title} Featuring {$root.contentgroup[0].PreviewXML.sets.set[0].ModelName[0]}</title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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

<div align="center">

<img src="images/header.jpg" width="320" height="207">


<table class="main_table" width="320" cellpadding="0" cellspacing="0">
<tr>
<td class="title" align="center">

<!--Update Title-->
{$root.contentgroup[0].Title}

</td>
</tr>




<!--Start Photos-->
<tr>
<td align="center">

<table>
<tr>
<td align="center">
{include file="photo_item.tpl" item=$root.content.item type="image" index="1"}
</td>
<td align="center">
{include file="photo_item.tpl" item=$root.content.item type="image" index="2"}
</td>
</tr>
</table>

<br>

<!--Update Description-->
<div class="description">
{$root.contentgroup[0].Description}
</div>

<br>

<table>
<tr>
<td align="center">
{include file="photo_item.tpl" item=$root.content.item type="image" index="3"}
</td>
<td align="center">
{include file="photo_item.tpl" item=$root.content.item type="image" index="4"}
</td>
</tr>
</table>


</td>
</tr>

<tr>
<td align="center">

<br>

<span id="join_link_big">
<a href="{$root.template.JoinURL}">Like These Pics?<br>Tap Here to See Her Videos!</a>
</span>

<br>
<br>

<table>
<tr>
<td align="center">
{include file="photo_item.tpl" item=$root.content.item type="image" index="5"}
</td>
<td align="center">
{include file="photo_item.tpl" item=$root.content.item type="image" index="6"}
</td>
</tr>
</table>

<table>
<tr>
<td align="center">
{include file="photo_item.tpl" item=$root.content.item type="image" index="7"}
</td>
<td align="center">
{include file="photo_item.tpl" item=$root.content.item type="image" index="8"}
</td>
</tr>
</table>

</td>
</tr>



<tr>
<td>




</div>

<a href="{$root.template.JoinURL}"><img src="images/click.gif" width="319" height="151" border="0"></a>

</td>
</tr>

</table>



</div>

<br>



</body>
</html>





