<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	
<title>{$root.contentgroup[0].Title} Featuring {$root.contentgroup[0].PreviewXML.sets.set[0].ModelName[0]}</title>
<link href="images/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="./images/jwplayer.js"></script>
<script type="text/javascript">jwplayer.key="qLzynSodouEg2o+gukjzO+6P0dzyHYq1TqcHaUF9cJE=";</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>



<body onload="loadplayer1()">

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
<td valign="top" background="images/top1.jpg" width="672" height="723">


<div align="right">
<table id="title">
<tr><td align="center">

<!--Update Title-->
{$root.contentgroup[0].Title}

</td>
</tr>
</table>
</div>


<div style="margin-top:30px;width:100%" align="center">
<!--Start Movie-->
{include file="embed.tpl" index="1"}
</div>





<div align="center" id="join_link_big">
<a href="{$root.template.JoinURL}">CLICK TO WATCH THE FULL MOVIE AND HUNDREDS MORE</a>
</div>


</td>
<td><img src="images/top2.jpg" width="324" height="723"></td>


</tr>


<tr>
<td valign="top" background="images/middle1.jpg" width="672" height="98">
<table style="margin-left:35px;margin-top:10px;"  class="description">
<tr><td style="padding:8px;">

<!--Update Description-->

{if $root.template.TruncateText && ($root.contentgroup[0].Description|@strlen > $root.template.TruncateText)}
{$root.contentgroup[0].Description|@substring:1:$root.template.TruncateText} ...
{else}
{$root.contentgroup[0].Description}
{/if}


</td>
</tr>
</table>



</td>
<td><img src="images/middle2.jpg" width="324" height="98"></td>


</tr>



<tr>
<td valign="top" rowspan="2"><img src="images/lower1.jpg" width="672" height="212"></td>
<td>
<a href="{$root.template.JoinURL}"><img src="images/click.gif" width="324" height="73" border="0"></a></td>


</tr>



<tr>

<td><img src="images/bottom2.jpg" width="324" height="139"></td>


</tr>

</table>




</td>
</tr>
</table>

<br>

</body>
</html>





