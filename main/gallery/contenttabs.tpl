{strip}
<table cellspacing="2" cellpadding="0" border="0">
<tr>
{foreach from=$root.page.movietabs.item item="item" key="k"} 
{assign var="go1" value="0"}
{assign var="go2" value="0"}

{foreach from=$root.page.contentgroup.PreviewXML.content.types.type_attr item="titem"}
{if $titem.type == $item}
{assign var="go1" value="1"}
{/if}
{/foreach}	

{foreach from=$root.page.contenttypesub.type item="titem"}
{if $titem.Type[0] == $item}
{assign var="go2" value="1"}
{/if}

{/foreach}


{if ($go1 == "1") && ($go2 == "1")}	
<td {if $root.page.settype[0] == $item } id="content_tab_link_current" {else} id="content_tab_link" {/if} />
<a href="{include file="$spath/general/pg_gallery.tpl" id=$root.page.contentgroup.Id[0] type=$item mt='' seoname=$root.page.contentgroup.SEOname[0] item=$root.page.contentgroup}">{$root.page.movietabs.item_attr[$k].label}</a>
</td>
{/if}
{/foreach}

{foreach from=$root.page.movietabs.item item="mtab" key="mtabkey"}
{assign var="go" value="0"}
{foreach from=$root.page.contentgroup.PreviewXML.content.type_attr item="cmtype"}
{if $ctype.type == $mtab} {assign var="go" value=1} {/if}
{/foreach}
{if $go == 1 }
<td {if $root.page.settype[0] == $item } id="content_tab_link_current" {else} id="content_tab_link" {/if} />
<a href="{include file="$spath/general/pg_gallery.tpl" id=$root.page.contentgroup.Id[0] type=$mtab mt='' seoname=$root.page.contentgroup.SEOname[0] item=$root.page.contentgroup}">{$root.page.movietabs.item_attr[$mtabkey].label}</a>
</td>
{/if}
{/foreach}

{foreach from=$root.page.contenttypesub.type item="conttitem"}
	{assign var="go1" value=1}
	{if ($conttitem.Label[0] == '')}
		{assign var="go1" value=0}
	{/if}
	{foreach from=$root.page.movietabs.item item="mtab" key="mtabkey"}
		{if $conttitem.Type[0] == $mtab} 
		{assign var="go1" value=0}
		{/if}
	{/foreach}
	{foreach from=$root.page.contentgroup.PreviewXML.content.types.type_attr item="contitem"}
		{if $contitem.type == $conttitem.Type[0] && $go2==0} {assign var="go2" value=1}{/if}
	{/foreach}
	{if ($go1 == 1)}
		{assign var="go1" value=0}		
		{foreach from=$root.page.contentgroup.PreviewXML.content.types.type_attr item="contitem"}
			{if $contitem.type == $conttitem.Type[0]}
			{assign var="go1" value=1}
			{/if}
		{/foreach}
	{/if}

	{strip}
	{if ($go1 ==1) }
			<td {if $root.page.settype[0] == $conttitem.Type[0] } id="content_tab_link_current" {else} id="content_tab_link" {/if} />
			<a href="{include file="$spath/general/pg_gallery.tpl" id=$root.page.contentgroup.Id[0] type=$conttitem.Type[0] mt='' seoname=$root.page.contentgroup.SEOname[0] item=$root.page.contentgroup}">{$conttitem.Label[0]}</a>
			</td>
	{/if}
	{/strip}
{/foreach}

{if in_array('comments',$pluginsdata.plugins) && $pluginsdata.enabled.comments == 1 && $root.has_username}
<td id="content_tab_link" />
<a href="{include file="$spath/general/pg_gallery.tpl" id=$root.page.contentgroup.Id[0] type=$root.page.settype[0] mt='' seoname=$root.page.contentgroup.SEOname[0] item=$root.page.contentgroup}#comments">{$templateconf.txtcomments}</a>
</td>
{/if}

</tr>
</table>
{/strip}