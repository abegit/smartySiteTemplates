<?xml version="1.0"?>
{assign var="memberurl" value=$templateconf.rssmembersurl|@full_url}
{assign var="membertitle" value=$templateconf.titletxtindex}

<rss version="2.0">
<channel>
<title>{$membertitle}</title>
<link>{$memberurl}</link>
<description>
{strip}
 {if $membertitle}
   {$membertitle}
 {else}
   Within the admin panel, the Template Field titletxtindex is not set.  Please set this.
 {/if}
{/strip}
</description>
<language>en-us</language>

{foreach from=$root.page.content.item item=item}
<item>
{strip}
	{assign var="hType" value=0}
	{assign var="vType" value=0}
	{foreach from=$item.PreviewXML.content.types.type_attr item="itemF" key="keyF"}
	{if $itemF.type == 'highres'}{assign var="hType" value=1}{if isset($itemF.num)} {assign var="numP" value=$itemF.num}{/if}{/if}
	{if $itemF.type == 'vids'}{assign var="vType" value=1}{/if}
	{/foreach}
	
	{assign var="thumbfile" value=""}
	{foreach from=$item.PreviewXML.element.item_attr item="itemE" key="keyE"}
	{if $itemE.priority == $usepriority}{assign var="thumbfile" value=$itemE.Id}{/if}
	{/foreach}

	<title>{$item.DateDisplay[0]} - {$item.Title[0]|@htmlentities:0:"utf-8"}</title>
{/strip}
{strip}
	<link>
		{if isset($hType) && isset($vType) && $hType && $vType}
		{$memberurl}{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}
		{elseif isset($hType) && $hType }
		{$memberurl}{include file="$spath/general/pg_gallery.tpl" type="highres" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}
		{elseif isset($vType) && $vType }
		{$memberurl}{include file="$spath/general/pg_gallery.tpl" type="vids" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}
		{else}
		{$memberurl}{include file="$spath/general/pg_gallery.tpl" type=$item.PreviewXML.content.types.type_attr[0].type id=$item.Id[0] seoname=$item.SEOname[0] item=$item}
		{/if}
	</link>
{/strip}
{strip}
	<description>{$item.Description[0]|@htmlentities:0:"utf-8"}

	</description>
{/strip}

	<guid isPermaLink="false">contentgroup_{$item.Id[0]}</guid>
</item>
{/foreach}
</channel>
</rss>