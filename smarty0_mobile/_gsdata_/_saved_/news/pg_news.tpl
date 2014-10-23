{**
* This is the Page News File
* - It is called from news.ptl to create a page Link fro the pagination 
* @param $page - the page that is requested 
*}
	{if isset($root.page_attr.static) && $root.page_attr.static==1}
		news
		{if  $page != 0 && $page != ''}-{$page}{/if}.html
	{else}news.php?
		{if ($page) }page={$page}{/if}
	{/if}