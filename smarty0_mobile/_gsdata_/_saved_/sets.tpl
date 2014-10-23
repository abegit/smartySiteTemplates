{include file="general/page_top.tpl"  title = $root.page.results.modelname[0] }

{include file="general/topnav.tpl" item=$root.page.current}


<div id="section_title">
<!--This displays the title of the model-->
{$root.page.results.modelname[0]}
</div>


<div class="content_wrapper">
<div>

<div class="description">


<!--Model Bio-->

{$root.page.results.extrafields.bio[0]}

{assign var="item" value=$root.page.results}

{literal}
            <a class="twitter-timeline"  href="https://twitter.com/{$item.extrafields.socialmedia[0]}"></a>
            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
{/literal}


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

	

</div>
</div>
</div>


<!--This displays the updates list for the model-->
<div id="section_title">
{$templateconf.txtupdatesfeaturing}&nbsp;{$root.page.results.modelname[0]}
</div>


<!--This displays the Page Navigation div-->
{if count($root.page.pages.page) >1 }
	{include file="sets/pagenav.tpl"}
{/if}

<div class="element_wrapper">
{foreach from=$root.page.results.result item=item key=k}

{if $root.page.paginate || (($k) >= (($root.page.onpage[0]-1) * $root.page.numperpage[0]) && ($k) < (($root.page.onpage[0]) * $root.page.numperpage[0]))}
	<div class="element">
	{include file="sets/sets_item.tpl" item=$item k=$k count=$root.page.results.result|@count}
	</div>
{/if}    	
{/foreach}
</div>


<!--This displays the Page Navigation div-->
{if count($root.page.pages.page) >1 }
{include file="sets/pagenav.tpl"}
{/if}


{include file="general/page_bottom.tpl"}
