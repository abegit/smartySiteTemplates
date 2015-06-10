{include file='general/page_top.tpl'  item='custompages' title=$root.page.content.item[0].Title[0]}


<div class="wrapper" align="center">

{include file="$spath/general/header.tpl" item='home'}

<div class="container content">
<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl" item='home'}</div>



<table width="100%" cellpadding="2" cellspacing="0" border="0">
<tr>
<td valign="top" width="100%">
<!--Left Column-->



{assign var="item" value=$root.page.content.item[0]}
{if isset($item)}

	
{include file="$spath/gallery/gallery1.tpl"}
	
	
{/if}



</td>

</tr>
</table>


</div>

<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl"}</div>
