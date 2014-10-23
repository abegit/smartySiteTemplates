{strip}

	{** Show 4 columns on this page **}
	{assign var="numcolumns" value="4"}


	{** Title assignment goes here.  Do not move this code **}

	{if ($root.page.category.Title[0]=='Episodes')}
		{assign var="nav" value='episodes'}	
	{elseif ($root.page.category.Title[0]=='Clips')}
		{assign var="nav" value='clips'}	
	{elseif ($root.page.content_attr[0].contentasc == 1)}
		{assign var="nav" value='models'}
	{elseif ($root.page.category.Title[0] == 'Photos')}
		{assign var="nav" value='photos'}
	{else}
		{assign var="nav" value='n/a'}
	{/if}
	
	{foreach from=$tags item="cat"}
		{if $cat.Id[0] == $root.page.category.Id[0] }
			{assign var="foundId" value=$cat.Title[0]}
		{/if}
	{/foreach}
	
	{if isset($root.page.category.Title[0]) && $root.page.category.Title[0] == 'Movies'}
		{assign var="title" value=$templateconf.titletxtmovieindex}
	{elseif $root.page.category.Title[0] == 'Clips'}
		{assign var="title" value=$templateconf.titletxtclipindex}
	{elseif $root.page.category.Title[0] == 'Photos'}
		{assign var="title" value=$templateconf.titletxtphotogalleryindex}
	{elseif $root.page.category.Title[0] == 'Models'}
		{assign var="title" value=$templateconf.titletxtmodelindex}
	{elseif  isset($foundId) }
		{** If this is a tag, set the tag title **} 
		{assign var="cattitle" value=$foundId}
		{assign var="sttitle" value=$templateconf.titletxttagindex}
		{assign var="title" value="$cattitle $sttitle"}
	{else}
		{assign var="cattitle" value=$root.page.category.Title[0]}
		{assign var="sttitle" value=$templateconf.titletxttagindex}
		{assign var="title" value="$cattitle $sttitle"}
	{/if}

	{assign var="seokey"  value=$root.page.category.SEOkey[0]}
	{assign var="seodesc" value=$root.page.category.SEOdesc[0]}

{/strip}{include file='general/page_top.tpl' title=$title seokey=$seokey seodesc=$seodesc}




<div class="wrapper" align="center">

{include file="$spath/general/header.tpl" item=$nav}

<div class="container content">
<!--Top Navbar-->
<div class="nav_fixed_width">{include file='general/topnav.tpl' item=$nav}</div>

{include file="$spath/general/showbanner.tpl" zone="category"}


{if isset($modelsCat) && in_array('contentasc',$pluginsdata.plugins) && $pluginsdata.enabled.contentasc == 1}
<!--Model A-Z Links-->
<div align="center">{include file="$spath/general/a-zlinks.tpl" zone=1 static=0}</div>
{/if}

<!--Title-->
{strip}
<div class="title_bar_center">
{if $root.page.category.Title[0] == 'Episodes'}
  {$templateconf.titletxtmovieindex}
{elseif $root.page.category.Title[0] =='Models'}
  {$templateconf.titletxtmodelindex}
{elseif $root.page.category.Title[0] =='Clips'}
  {$templateconf.titletxtclipindex}
{elseif $root.page.category.Title[0] =='Photos'}
  {$templateconf.titletxtphotogalleryindex}
{elseif isset($foundId)}
  {$templateconf.txtsetswith} {$foundId} {$templateconf.txtaskeywordtag}
{elseif $root.page.category.Title[0] =='Tags'}
  {$templateconf.txttags}</div>
{else}
  {$templateconf.titletxtphotogalleryindex}
{/if}

{/strip}
<!-- end header -->




{if $root.page.category.Title[0] == 'Tags'}
	<div align="center" class="looper">
	<table cellpadding="2" cellspacing="0">
	
	<!--This tells the page the number of items to show per row-->
	
	{foreach from=$tags item="itemC" key="kex"}
	{if ($kex % $numcolumns) == 0}
	<tr>
		{** To adjust the number of columns, change the value of numcolumns at the top of this page **}
		{section name=columns start=0 loop=$numcolumns step=1}
			{assign var="tmpk" value=$kex+$smarty.section.columns.index}
	
			<td valign="top">
				{if isset($tags[$tmpk])}
					{include file="category/tag_item.tpl" item=$tags[$tmpk] contentdir=#contentdir#}
				{else} 
					&nbsp;
				{/if}
			</td>
	
		{/section}
	</tr>
	{/if}
	{/foreach}
	
	</table>
	
	</div>
{else}

<div align="left" class="tabs">

<table cellspacing="2" cellpadding="0" border="0">
<tr>
<td>
<div {if $root.page.sort[0] == "d"} class="sort_link_current" {else} class="sort_link" {/if}><a href="{include file="$spath/general/pg_category.tpl" id=$root.page.category.Id[0] s="d" sw=$root.page.letter[0] page=1 seoname=$root.page.category.SEOname[0] item=$root.page.category}">{$templateconf.txtmostrecent}</a></div>
</td>

<td>
<div {if $root.page.sort[0] == "p"} class="sort_link_current" {else} class="sort_link" {/if}><a href="{include file="$spath/general/pg_category.tpl" id=$root.page.category.Id[0] s="p" sw=$root.page.letter[0] page=1 seoname=$root.page.category.SEOname[0] item=$root.page.category}">{$templateconf.txtmostpopular}</a></div>
</td>

<td>
<div {if $root.page.sort[0] == "n"} class="sort_link_current" {else} class="sort_link" {/if}><a href="{include file="$spath/general/pg_category.tpl" id=$root.page.category.Id[0] s="n" sw=$root.page.letter[0] page=1 seoname=$root.page.category.SEOname[0] item=$root.page.category}">{$templateconf.txtnametitle}</a></div>
</td>

</tr>
</table>

</div>

</div>


<div align="center"  class="looper">
<table cellpadding="2" cellspacing="0">

<!--This tells the page the number of items to show per row-->

{foreach from=$root.page.content.item item="itemC" key="kex"}
{if ($kex % $numcolumns) == 0}
<tr>
	{** To adjust the number of columns, change the value of numcolumns at the top of this page **}
	{section name=columns start=0 loop=$numcolumns step=1}
		{assign var="tmpk" value=$kex+$smarty.section.columns.index}

		<td valign="top">
			{if isset($root.page.content.item[$tmpk])}
				{include file="category/category_item.tpl" item=$root.page.content.item[$tmpk] contentdir=#contentdir#}
			{else} 
				&nbsp;
			{/if}
		</td>

	{/section}
</tr>
{/if}
{/foreach}

</table>

</div>


<!--Page Navigation-->
{if count($root.page.pages.page)>1 }{include file="category/pagenav.tpl"}{/if}


<br />

{/if}



</div></div>

<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl" item=$nav}</div>
