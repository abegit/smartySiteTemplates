{** Show 4 columns for the stories on this page **}
{assign var="numcolumns" value="4"}

{if !isset($root.page.Id)}

	{assign var="tableobject" value=$root.page.content.item}
	{assign var="tabletemplate" value="$spath/bonus/story_item.tpl"}


	{if sizeof($tableobject)}
	<table align="center" width="100%">
		{foreach from=$tableobject item="item" name="elLoop" key=kex}
			{if ($kex % $numcolumns) == 0 }
				<tr>
				{section name=columns start=0 loop=$numcolumns step=1}
					{assign var="tmpk" value=$kex+$smarty.section.columns.index}
					<td valign="top" width="{math equation="floor(100/numcolumns)" numcolumns=$numcolumns}%">
						{if isset($tableobject[$tmpk])}
							{include file="$tabletemplate" item=$tableobject[$tmpk] contentdir=#contentdir#} 
						{else} 
							&nbsp;
						{/if}
					</td>
				{/section}
				</tr>
			{/if}
		{/foreach}
	</table>
	{/if}



{else}

	{foreach from=$root.page.content.item item="item" }
		{if $item.Id[0] == $root.page.Id[0] }
			{assign var="curitem" value=$item}
		{/if}
	{/foreach}
	<table cellspacing="2" cellpadding="2" border="0">
	<tr>
	<td class="news-article">
	<div align="left">
	
	<!--This displays a thumbnail for the Erotic Story-->	
	
	{if $curitem.PreviewXML.element.item_attr[0].Id}
	  {assign var="cdir" value=#contentdir#}

	<div>
	<img style="margin-right:10px;" class="thumbs" align="left" src="{$cdir}/contentthumbs/{$curitem.PreviewXML.element.item_attr[0].Id}-bonus.jpg"/>
	</div>
	{/if}
	
	<!--Title-->	
	<span class="bonus_title_story">{$curitem.Title[0]}</span>
	
	<!--This inserts spaces (&nbsp;)--> 
	&nbsp&nbsp
	
	<!--Date-->
	<span class="date">{$templateconf.txtpostedon} {$curitem.DateDisplay[0]}</span>
	

	<br />
	<br />

	<!--Description-->
<span class="bonus_description">{$curitem.Description[0]|@nl2br}</span>


	<br />
	</div>
	</td>
	</tr>
	</table>
{/if}
