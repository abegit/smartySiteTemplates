<!--Instructions for rotating headers:

This code will rotate through a series of header images uploaded to the tour's images/header/ folder.

To change the number of headers it uses:
1) Change var numt = 3 to the number of headers you want to rotate
2) Change setCookie("numheader", rnd, 3) to the number of headers you want to rotate
-->


<noscript>
<a href="{include file="$tourname/pg_tour.tpl" page=1}"><img class="header_image" src="images/header/header1.jpg" border="0" alt=""/></a>
</noscript>
<script>
{literal}

function setCookie(c_name,value,expiredays)
{
var exdate=new Date();
exdate.setDate(exdate.getDate()+expiredays);
document.cookie=c_name+ "=" +escape(value)+
((expiredays == 0) ? "" : ";expires="+exdate.toGMTString())+
";path=/";
}

function getCookie(c_name)
{
if (document.cookie.length>0)
  {
  c_start=document.cookie.indexOf(c_name + "=");
  if (c_start!=-1)
    {
    c_start=c_start + c_name.length+1;
    c_end=document.cookie.indexOf(";",c_start);
    if (c_end==-1) c_end=document.cookie.length;
    return unescape(document.cookie.substring(c_start,c_end));
    }
  }
return "";
}


// This is the number of headers you have.
var numt = 3

if (numt > 1)
{
  var oldcook = getCookie("numheader")

  if (oldcook == "")
  {
     rnd = Math.floor(Math.random()*numt) + 1
  }
  else
  {
     do
     {
       rnd = Math.floor(Math.random()*numt) + 1
     } while (rnd == oldcook)
  }

  setCookie("numheader", rnd, 3)
}
else
{
  var rnd = 1
}

document.write('<a href="{/literal}{include file="$tourname/pg_tour.tpl" page=1}{literal}"><img class="header_image" src="images/header/header' + rnd + '.jpg" border="0" alt=""/></a>')
{/literal}
</script>
