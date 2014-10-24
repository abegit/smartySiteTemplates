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

<!--Title-->
<div class="title_bar">{$root.page.content.item[0].Title[0]}</div>


{assign var="item" value=$root.page.content.item[0]}
{if isset($item)}

	<div class="custompages" style="clear:both;">
		<div class="wrapper">Get to the Good Stuff Quicker!</div>
	{global get="image_folder" assign="image_folder"}
		
	
	<br>
	
	<!-- Extra Pages Entry-->
	<span class="custompages_info">
	
	
		{$item.Body[0]}
		
	
	<br>
	 <textarea readonly>
<iframe width="100%" height="150px" style="-webkit-border-radius: 4px; -webkit-box-shadow: 0 4px 0 #707070; -moz-border-radius: 4px; -moz-box-shadow: 0 4px 0 #707070; -o-border-radius: 4px; -o-box-shadow: 0 4px 0 #707070; border-radius: 4px; box-shadow: 0 4px 0 #707070; display: block;" frameborder="0" src="http://beta.bonoboville.com/about/player.html"></iframe> </textarea>
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

<!--Slider Code-->
<div id="slideshow">
{include file="$spath/sliders/4.tpl" item='home'}
</div>

</div>

<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl"}</div>
