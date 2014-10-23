{include file="$tourname/page_top.tpl"  title = $root.page.results.modelname[0] }

{include file="$tourname/topnav.tpl" item=$root.page.current}


<div id="section_title">
<!--This displays the title of the model-->
{$root.page.results.modelname[0]}
</div>


<table class="content_wrapper">
<tr>

<td class="description">


<!--Model Bio-->

{$root.page.results.extrafields.bio[0]}

<br />
<br />

	<!--The code below embeds Extra Fields so that additional data can be added for each set or model within the admin panel under Plug-Ins/Extra Fields-->
	
	{**{foreach from=$root.page.results item=item}**}
		{assign var="item" value=$root.page.results}
		{$templateconf.txtage}&nbsp;{$item.extrafields.age[0]}<br />
		{$templateconf.txtheight}&nbsp;{$item.extrafields.height[0]}<br />
		{$templateconf.txtmeasurements}&nbsp;{$item.extrafields.measurements[0]}<br />	
	    {$templateconf.txtastrologicalsign}&nbsp;{$item.extrafields.sign[0]}<br />
		{$templateconf.txtfunfact}&nbsp;{$item.extrafields.funfact[0]}
	{**{/foreach}**}

	

</td>
</tr>
</table>


<!--This displays the updates list for the model-->
<div id="section_title">
{$templateconf.txtupdatesfeaturing}&nbsp;{$root.page.results.modelname[0]}
</div>


<!--This displays the Page Navigation table-->
{if count($root.page.pages.page) >1 }
	{include file="sets_outside/pagenav.tpl"}
{/if}

<div class="element_wrapper">
{foreach from=$root.page.results.result item=item key=k}
{if $root.page.paginate || (($k) >= (($root.page.onpage[0]-1) * $root.page.numperpage[0]) && ($k) < (($root.page.onpage[0]) * $root.page.numperpage[0]))}
	<div class="element">
		{include file="sets_outside/sets_item.tpl" item=$item k=$k count=$root.page.results.result|@count}
	</div>
{/if}    	
{/foreach}
</div>


<!--This displays the Page Navigation table-->
{if count($root.page.pages.page) >1 }
{include file="sets_outside/pagenav.tpl"}
{/if}


{include file="$tourname/page_bottom.tpl"}
