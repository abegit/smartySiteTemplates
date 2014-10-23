
<div class="search" id="search{$position}">
	<div id="section_title">{$root.page.templateconf.txtsearch}</div>

	<form id="searchform" action="search.php" method="get" class="margin0">
	
		<input name="query" type="text" size="35" value="{$root.page.info.query[0]}" />
	
		{foreach from=$root.page.categories.cat item="cat1"}
			{if $cat1.Title[0] == 'Tags'}
		
	
					<select class="search-fields" name="cat[]">
					<option selected="selected" class="search-fields" value="">{$root.page.templateconf.txtallcategories}</option>
					{foreach from=$cat1.cats.cat item="cat2" key="cat2Key"}
						{assign var="selected" value=""}
						{foreach from=$root.page.catchoose.cat_attr item="s"}{if $s.id==$cat1.cats.cat_attr[$cat2Key].id}{assign var="selected" value="selected='selected'"} {/if}{/foreach}
						<option class="search-fields" value="{$cat2.Id[0]}" {$selected}>
						{$cat2.Title[0]}</option>
					{/foreach}
					</select>
	
		
			{/if}
			
		{/foreach}
		
	
		<input class="text" value="{$templateconf.txtlistresults}" type="submit" />
	
		<span class="advsearchurl">
		<a href="advancedsearch.php">{$templateconf.txtadvancedsearch}</a>
		</span>
	</form>

</div>