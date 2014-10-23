{** Globals File - DO NOT REMOVE **}
{include file="$tourname/page_top.tpl"  title = $root.page.results.modelname[0] }
{include file="$tourname/topnav.tpl" item=$root.page.current}

{** 

NOTES FOR EDITING:
------------------

Instances of tags with "$templateconf" in them represent text or data that can be edited from inside the CMS admin panel.

These fields support multi-language functionality.

Edit the text for these tags under Plug-Ins/Template Fields in CMS admin.


 **}

{assign var="item" value=$root.page.content.item[0]}
{if isset($item)}

	<div class="custompages" style="clear:both; overflow:hidden;">
	{global get="image_folder" assign="image_folder"}
		
	
	<br>
	
	<!-- Extra Pages Entry-->
	<span class="custompages_info">
	
	
		{$item.Body[0]}
		
	
	<br>
	 <textarea readonly>
<iframe width="100%" height="150px" style="-webkit-border-radius: 4px; -webkit-box-shadow: 0 4px 0 #707070; -moz-border-radius: 4px; -moz-box-shadow: 0 4px 0 #707070; -o-border-radius: 4px; -o-box-shadow: 0 4px 0 #707070; border-radius: 4px; box-shadow: 0 4px 0 #707070; display: block;" frameborder="0" src="http://beta.bonoboville.com/about/player.html"></iframe> </textarea>
	<br>


	<!--Number of Comments-->
	{if in_array('comments',$pluginsdata.plugins) && $item.NumComments[0]}

	
		{if $item.CommentNew[0] == 1 }
		<img src="{$image_folder}/icons/new.gif" />
		{/if}

	{/if}	
	
	
	
	<br><br /><hr class="custompages_hr" /><br>
	
	</span>
	</div>
	

{/if}

	<br />

{include file="$tourname/page_bottom.tpl"}
