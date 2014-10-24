<br>

{assign var="curritem" value=$root.page.currentcontent.item[0]}

<form style="margin:0px;" name="wankform" action="#">
<table border="0" cellpadding="2" cellspacing="0">
<tr>
{** check if there is a next element **}
{foreach from=$root.page.content.item item=tmpI key=tmpK}
	{if $tmpI.Id[0] == $curritem.Id[0]}
		{assign var="tmpKey" value=$tmpK+1}
		{if isset($root.page.content.item[$tmpKey]) && $root.page.content.item[$tmpKey].Id[0]!=""}
			{assign var="nextId" value=$root.page.content.item[$tmpKey].Id[0]}
		{/if}
	{/if}	
{/foreach}

<td action="
{if isset($nextId)}
	{include file="$spath/general/pg_gallery.tpl" type=$root.page.settype[0] cg=$root.page.contentgroup.Id[0] id=$nextId seoname=$root.page.contentgroup.SEOname[0] item=$root.page.contentgroup}#pic">
{else}
	{include file="$spath/general/pg_gallery.tpl" type=$root.page.settype[0] id=$root.page.contentgropup.Id[0] page="1" seoname=$root.page.contentgroup.SEOname[0] item=$root.page.contentgroup}">
{/if}

<span class="slideshow_title">{$templateconf.txtslideshow}</span>
</td>
<td><span class="slideshow_text">{$templateconf.txtselectslideshowspeed}</span></td>
<td>
<select name="frequency" onchange="wankchange(this)">
<option value="0">{$templateconf.txtoff}</option>
<option value="1">1 {$templateconf.txtseconds}</option>
<option value="3">3 {$templateconf.txtseconds}</option>
<option value="5">5 {$templateconf.txtseconds}</option>
<option value="10">10 {$templateconf.txtseconds}</option>
<option value="30">30 {$templateconf.txtseconds}</option>
<option value="60">60 {$templateconf.txtseconds}</option>
</select>

</td></tr>
</table>

</form>

{literal}
<script language="JavaScript">
tme = 0
chng = readCookie("wank")
if (chng == null)
{
chng = 0
}


function SetCookie(cookieName,cookieValue,nDays) 
{
var today = new Date();
var expire = new Date();
if (nDays==null || nDays==0) nDays=1;
expire.setTime(today.getTime() + 3600000*24*nDays);
document.cookie = cookieName+"="+escape(cookieValue)
+ ";expires="+expire.toGMTString();
}


function wankchange(v)
{
chng = v[v.selectedIndex].value
SetCookie("wank", chng, "1")
}

function CheckWank()
{
if (chng != 0)
{
if (tme >= chng)
{

	NextImage();
	tme = 0
	setTimeout('CheckWank()',1000)	
	// document.location = document.forms["wankform"].action
	return
}
}
tme = tme + 1
setTimeout('CheckWank()',1000)
}

function setWankDropDown(ch)
{
v = document.forms["wankform"].frequency

for ( i = 0; i < v.length; i++)
{
if (v[i].value == ch)
{
v.selectedIndex = i
}
}
}

setWankDropDown(chng)
CheckWank()

// xc = document.location + ""
// xc = xc.split('#');

// document.location.hash = "#pic"

</script>
{/literal}
<!--end Slide Show table-->
