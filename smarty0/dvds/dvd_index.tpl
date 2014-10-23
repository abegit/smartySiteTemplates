<table align="center" cellpadding="10">
<tr><td>

<form method="get" name="sfrm">
	  <input name="s" type="hidden" value="{$root.page.sort}" />
	  <input name="sw" type="hidden" value="{$root.page.letter}" />
	  
	 
	<select name="sid" onchange="document.forms.sfrm.submit()" style="min-width:130px;">
	 {if ($root.page.studio)}
	 <option value="">All Studios</option>	 
	 {else}
	 <option value="">Select A Studio</option>
	 {/if}

	 {foreach from=$root.page.studiolist item=studio}
	 <option value="{$studio.Id}" {if $root.page.studio == $studio.Id}selected{/if}>{$studio.StudioName}</option>
	 {/foreach}
	</select>
	</form>

</td>
<td>



<div id="model_a-z-links">
Browse DVDs By Name

{strip}
  {assign var="letters" value="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"|@explode:","}

  <a {if $root.page.letter == ""}style="color:black;"{/if} href="{include file="$spath/general/pg_dvds.tpl" page=1 sid=$root.page.studio sw='' s=$root.page.sort}">All</a>

  <a {if $root.page.letter == "1"}style="color:black;"{/if} href="{include file="$spath/general/pg_dvds.tpl" page=1 sid=$root.page.studio sw="1" s=$root.page.sort}">#</a>
 
  {foreach from=$letters item=letter}
	<a {if $root.page.letter == $letter}style="color:black;"{/if} href="{include file="$spath/general/pg_dvds.tpl" page=1 sid=$root.page.studio sw=$letter s=$root.page.sort}">{$letter}</a>
  {/foreach}

{/strip}  

</div>
</td></tr></table>


<div class="title_bar">

{$templateconf.txtdvds}</td>
 {if $root.page.studiolist|@count}

 {/if}


</div>

<div align="left">

<table cellspacing="2" cellpadding="0" border="0">
<tr>
<td>
<div {if $root.page.sort[0] == "d"} class="sort_link_current" {else} class="sort_link" {/if}><a href="{include file="$spath/general/pg_dvds.tpl" page=1 sid=$root.page.studio sw=$root.page.letter s='d'}">{$templateconf.txtmostrecent}</a></div>
</td>

<td>
<div {if $root.page.sort[0] == "p"} class="sort_link_current" {else} class="sort_link" {/if}><a href="{include file="$spath/general/pg_dvds.tpl" page=1 sid=$root.page.studio sw=$root.page.letter s='p'}">{$templateconf.txtmostpopular}</a></div>
</td>

<td>
<div {if $root.page.sort[0] == "n"} class="sort_link_current" {else} class="sort_link" {/if}><a href="{include file="$spath/general/pg_dvds.tpl" page=1 sid=$root.page.studio sw=$root.page.letter s='n'}">{$templateconf.txtnametitle}</a></div>
</td>

</tr>
</table>

</div>




{** Show 4 columns for the DVDs here **}
{assign var="numcolumns" value="4"}



<!--Page Navigation-->
{if count($root.page.pages.page) > 1 }{include file="$spath/dvds/pagenav.tpl"}{/if}



<table id="dvd_index" cellpadding="2" cellspacing="0" border="0">

<!--This tells the page the number of items to show per row-->
{if isset($root.page.dvd)}
{foreach from=$root.page.dvd item="item" key ="kex"}
{if $kex % $numcolumns == 0 }
<tr>

	{** To adjust the number of columns, change the value of numcolumns at the top of this page **}
	{section name=columns start=0 loop=$numcolumns step=1}
		{assign var="tmpk" value=$kex+$smarty.section.columns.index}

		<td valign="top">
			{if isset($root.page.dvd[$tmpk])}
				{include file="$spath/dvds/dvd_item.tpl" item=$root.page.dvd[$tmpk]} 
			{else} 
				&nbsp;
			{/if}
		</td>

	{/section}
</tr>    	
{/if}
{/foreach}
{/if}
</table>


<!--Page Navigation-->
{if count($root.page.pages.page) > 1 }{include file="$spath/dvds/pagenav.tpl"}{/if}

