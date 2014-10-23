{include file="general/page_top.tpl" title="drsuzytv"}
{include file="general/topnav.tpl" item="drsuzytv"}

<!--Title-->
<div id="section_title"> {$root.page.content.item[0].Title[0]} </div>

{assign var="item" value=$root.page.content.item[0]}
{if isset($item)}

	<div class="custompages">
	{global get="image_folder" assign="image_folder"}
		
	
	<br>
	
	<!-- Extra Pages Entry-->
	<span class="custompages_info">
	
	
		{$item.Body[0]}
	
	
	<br>
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


{include file='general/page_bottom.tpl'}
