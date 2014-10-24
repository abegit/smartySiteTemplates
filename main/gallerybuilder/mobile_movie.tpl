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

<img src="images/header.jpg" width="320" height="175">


<table width="320" cellpadding="0" cellspacing="0">
<tr>
<td class="title" align="center">

<!--Update Title-->
{$root.contentgroup[0].Title}

</td>
</tr>


</table>







<table class="main_table" width="320" cellpadding="0" cellspacing="0">

<tr>
<td align="center" class="description">

<br>

<!--Update Description-->
{$root.contentgroup[0].Description}





</td>
</tr>

<!--Start Movies-->
<tr>
<td align="center">
{include file="mobile_movie_item.tpl" item=$root.content.item index="1"}
<br>
<br>

</td>
</tr>

<tr>
<td align="center" class="link">

<span id="join_link_big">
<a href="{$root.template.JoinURL}">WATCH ALL OF HER FULL LENGTH VIDEOS NOW!</a>
</span>

</td>
</tr>

<tr>
<td align="center">

<br>
{include file="mobile_movie_item.tpl" item=$root.content.item index="2"}
</td>
</tr>

<tr>
<td>



<br>
<br>


</div>

<a href="{$root.template.JoinURL}"><img src="images/click.gif" width="319" height="98" border="0"></a>

</td>
</tr>

</table>



</div>

<br>



</body>
</html>





