{** 

NOTES FOR EDITING:
------------------

Instances of tags with "$templateconf" in them represent text or data that can be edited from inside the CMS admin panel.

These fields support multi-language functionality.

Edit the text for these tags under Plug-Ins/Template Fields in CMS admin.


**}


<div class="join_page_updates_block">

	{** Start Update **}
	{foreach from=$root.page.tourthumbs.item item=item}

		<div class="join_page_updates_wrapper">
						
			{** Update Thumbnail **}
			{include file="$tourname/stdimage.tpl" item=$item class="join_page_updates_thumb thumbs" priority="7"}
			
		</div>

	{/foreach}

</div>