{** 

NOTES FOR EDITING:
------------------

Instances of tags with "$templateconf" in them represent text or data that can be edited from inside the CMS admin panel.

These fields support multi-language functionality.

Edit the text for these tags under Plug-Ins/Template Fields in CMS admin.


**}
		
{** Update Thumbnail Location 0 (First Thumb Spot) **}
{if isset($root.page.tourcontent.item[0])}
	{include file="$tourname/stdimage.tpl" item=$root.page.tourcontent.item[0] 
		class="join_large_update_thumb thumbs" priority="1"}
{/if}
			


