{include file='general/page_top.tpl'  item='custompages' title=$root.page.content.item[0].Title[0]}


<div class="wrapper" align="center">
{include file="$spath/general/header.tpl" item='drsuzytv'}


<div class="container content">
<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl" item='drsuzytv'}</div>



<table width="100%" cellpadding="2" cellspacing="0" border="0">
<tr>
<td valign="top" width="100%">
<!--Left Column-->

<!--Title-->
<div class="title_bar">Watch & Listen to RadioSuzy1 LIVE SHOWS Every Saturday Night! Since 1987</div>
<div style="width:100%; display:block; text-align:center; margin:30px 0;">
<a href="http://drsusanblock.tv/join"><img src="images/join.jpg"></a></div>
{include file="$spath/gallery/gallery1.tpl"}

{assign var="item" value=$root.page.content.item[0]}
{if isset($item)}

	<div class="custompages">
	{global get="image_folder" assign="image_folder"}
		
	
	<br>
	
	<!-- Extra Pages Entry-->
	<span class="custompages_info">
	
	
		
	
	
	<br>
	<br>


	<!--Number of Comments-->
	{if in_array('comments',$pluginsdata.plugins) && $item.NumComments[0]}

	
		{if $item.CommentNew[0] == 1 }
		<img src="{$image_folder}/icons/new.gif" />
		{/if}

	{/if}	
	
	
	
	<br><br /><hr class="custompages_hr" /><br>
	
	</span>
	</div>
	
	
{/if}


</td>

</tr>
</table>


</div>
</div>

<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl" item='drsuzytv'}</div>
