{** Show 1 columns for the DVDs here **}
{assign var="numcolumns" value="1"}


<div id="section_title">
{$templateconf.txtdvds}

</div>


<!--Page Navigation-->
{if count($root.page.pages.page) > 1 }{include file="dvds/pagenav.tpl"}{/if}



<div class="element_wrapper">

<!--This tells the page the number of DVDs to show per row-->
{if isset($root.page.dvd)}
{foreach from=$root.page.dvd item="item" key ="kex"}
{if $kex % $numcolumns == 0 }

	{** To adjust the number of columns, change the value of numcolumns at the top of this page **}
	{section name=columns start=0 loop=$numcolumns step=1}
		{assign var="tmpk" value=$kex+$smarty.section.columns.index}

		{if isset($root.page.dvd[$tmpk])}
		<div class="element">
			{include file="dvds/dvd_item.tpl" item=$root.page.dvd[$tmpk]} 
		</div>
		{/if}

	{/section}
{/if}
{/foreach}
{/if}
</div>


<!--Page Navigation-->
{if count($root.page.pages.page) > 1 }{include file="dvds/pagenav.tpl"}{/if}

