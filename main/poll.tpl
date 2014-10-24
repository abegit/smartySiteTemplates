{strip}
	{** Title assignment goes here.  Do not move this code **}

	{assign var="nav" value='n/a'}
	{assign var="sttitle" value=$templateconf.titletxtpolls}

	{** Number of columns on this page **}
	{assign var="numcols" value=3}


{/strip}{include file='general/page_top.tpl' title=$sttitle}




<div class="wrapper" align="center">

<!--Header-->
{include file="$spath/general/header.tpl"}


<!--Top Navbar-->
<div class="nav_fixed_width">{include file='general/topnav.tpl' item=$nav}</div>

{include file="$spath/general/showbanner.tpl" zone="poll"}


<!--Model A-Z Links-->
<div align="center">{include file="$spath/general/a-zlinks.tpl" zone=1 static=0}</div>

<!--Title-->
<div class="title_bar">{$templateconf.txtpolls}</div>





<!--Page Navigation-->
{if count($root.page.pages.page)>1}
	{include file="poll/pagenav.tpl"}
{/if}




<br clear="all">

<div align="left">
<table width="100%" cellpadding="2" cellspacing="0">

<!--This tells the page the number of items to show per row-->
{foreach from=$root.page.content.item item="item" key=k}
	{if ($k % $numcols) == 0}
		<tr>
		{section name=column start=0 loop=$numcols step=1}
		  <td valign="top" width="33%">
				{assign var="temp" value=$k+$smarty.section.column.index}

				{if isset($root.page.content.item[$temp])}
					{include file="poll/poll_item.tpl" item=$root.page.content.item[$temp] contentdir=#contentdir#}
				{else}   &nbsp  {/if}
		  </td>
		{/section}
		</tr>  

<tr><td>&nbsp;</td>
	</tr>  
	{/if} 	
{/foreach}
</table>

</div>






<!--Page Navigation-->
{if count($root.page.pages.page)>1 }{include file="poll/pagenav.tpl"}{/if}


<br />





</div>

<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl"}</div>
