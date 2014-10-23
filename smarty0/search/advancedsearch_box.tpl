{** Number of columns to show for sites **}
{assign var="site_numcolumns" value="3"}

{** Number of columns to show for categories **}
{assign var="category_numcolumns" value="6"}

<form id="searchform" action="search.php" method="get" style="margin:0px;">
<input name="st" type="hidden" value="advanced"/>
<table id="advanced_search" cellspacing="0" cellpadding="2" border="0">

<tr><td align="left">



			<table cellspacing="0" cellpadding="2" border="0">
				<tr>
					<td align="left" colspan="5" class="plaintext">
						<b>{$templateconf.txtfindphotosetsandmovies}</b>
					</td>
				</tr>
				<tr>
					<td align="left" class="plaintext">{$templateconf.txtallthesewords}</td>
					<td align="left"><input name="qall" size="40" value="{$root.page.searchparam.all[0]}" data-info="{$templateconf.txtseparatewithcommas}"/>
					</td>
					<td align="left" colspan="3" class="plaintext">{$templateconf.txtseparatewithcommas}</td>
				</tr>
				<tr>
					<td align="left" class="plaintext">
						{$templateconf.txtanyofthesewords}
				</td>
					<td align="left"><input name="qany" size="40" value="{$root.page.searchparam.any[0]}"/>
					</td>
					<td align="left" colspan="3" class="plaintext">{$templateconf.txtseparatewithcommas}</td>
				</tr>
				<tr>
					<td align="left" class="plaintext">{$templateconf.txtthisexactword}
						</td>
					<td align="left" colspan="4"><input name="qex" size="40" value="{$root.page.searchparam.phrase[0]}" />
					</td>
				</tr>

			</table>

			<table cellspacing="0" cellpadding="2" border="0">
				<tr>
					<td align="left" colspan="5" style="padding-top:10px;" class="plaintext"><b>{$templateconf.txtbutdontshowresults}</b></td>
				</tr>
				<tr>
					<td align="left" class="plaintext">{$templateconf.txtanyofthesewords}</td>
					<td align="left"><input name="none" size="40" value="{$root.page.searchparam.none[0]}"/>
					</td>
					<td align="left" colspan="3" class="plaintext">{$templateconf.txtseparatewithcommas}</td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="2" border="0">

				<tr>
					<td align="left" colspan="5" style="padding-top:10px;" class="plaintext"><b>{$templateconf.txtonlyshowresultsfor}</b></td>
				</tr>
				<tr>
					<td class="plaintext">{$templateconf.txtcontentaddedwithin}</td>
					<td align="left" colspan="4">
					{assign var="timeAdded" value=$root.page.searchparam.timeAdded}
						<select style="width:200px;" name="tadded">
							<option value="0" {if $timeAdded==''} selected="selected" > {else} > {/if}{$templateconf.txtanytime}</option>
							<option value="3" {if $timeAdded=='3'} selected="selected" > {else} > {/if}{$templateconf.txt3days}</option>
							<option value="7" {if $timeAdded=='7'} selected="selected" > {else} > {/if}{$templateconf.txt7days}</option>
							<option value="14" {if $timeAdded=='14'} selected="selected" > {else} > {/if}{$templateconf.txt14days}</option>
							<option value="30" {if $timeAdded=='30'} selected="selected" > {else} > {/if}{$templateconf.txt30days}</option>
							<option value="60" {if $timeAdded=='60'} selected="selected" > {else} > {/if}{$templateconf.txt60days}</option>
							<option value="90" {if $timeAdded=='90'} selected="selected" > {else} > {/if}{$templateconf.txt90days}</option>
						</select>
					</td>
				</tr>


				<!--The media types-->
				<tr>
					<td class="plaintext">{$templateconf.txtcontainsmediatypes}</td>
					
				{foreach from=$root.page.categories.cat item="cat1"}
				{strip}
				{if $cat1.Title[0] =='Areas'}
				<td colspan="4"><select style="width:200px;" name="cat[]">
				<option value="">{$templateconf.txtallcontenttypes}</option>
				{foreach from=$cat1.cats.cat item="cat2" key="cat2Key"}
					{if $cat2.Title[0]!='Models'}
						{assign var="selected" value=""}
						{foreach from=$root.page.catchoose.cat_attr item="s"}{if $s.id==$cat1.cats.cat_attr[$cat2Key].id}{assign var="selected" value="selected='selected'"} {/if}{/foreach}
						<option value="{$cat2.Id[0]}" {$selected}>
						{$cat2.Title[0]}</option>
					{/if}
				{/foreach}
				</select></td>
				{/if}
				{/strip}
				{/foreach}
			<!--End the media type list (options)-->
						</select>
					</td>
				</tr>
			</table>


			<div class="filterd">
			{if isset($root.page.sites.site)}
			<table cellspacing="0" cellpadding="2" border="0">
				<tr>
					<td align="left" style="padding-top: 10px;" colspan="5" class="plaintext">
						<b>Sites{$templateconf.txtsites}</b>
					</td>
				</tr>
			</table>


			<table cellspacing="0" cellpadding="2" border="0">
			{assign var="rows" value=0 }					
			{foreach from=$root.page.sites.site item="site1" key="kex"}
			{if $kex % $site_numcolumns == 0}
			<tr>
				{section name=column start=0 loop=$site_numcolumns step=1}
					{assign var="tmpk" value=$kex+$smarty.section.column.index}
					{if isset($root.page.sites.site[$tmpk])}
						<td>
							<input type="checkbox" name="site[]" value="{$root.page.sites.site[$tmpk].Id[0]}" />
						</td>
						<td class="plaintext">{$root.page.sites.site[$tmpk].Name[0]}</td>
					{else}
						<td>&nbsp;</td><td>&nbsp;</td>
					{/if}
				{/section}
			</tr>
			{/if}
			{/foreach}

			</table>

			{/if}





			<table cellspacing="0" cellpadding="2" border="0">
				<tr>
					<td align="left" style="padding-top: 10px;" colspan="5" class="plaintext">
						<b>Filtered By</b>
					</td>
				</tr>
			</table>




			<table cellspacing="0" cellpadding="2" border="0">
			{foreach from=$tags item="cat2" key="kex"}
			{if $kex % $category_numcolumns == 0}
			<tr>
				{section name=column start=0 loop=$category_numcolumns step=1}
					{assign var="selected" value=""}
					{assign var="tmpk" value=$kex+$smarty.section.column.index}
					{if isset($tags[$tmpk])}
					<td>
						{foreach from=$root.page.catchoose.cat_attr item="s"}
							{if $s.id == $tags[$tmpk].Id[0]}
								{assign var="selected" value="checked='checked'"}
							{/if}
						{/foreach}
						<input type="checkbox" name="cat[]" value="{$tags[$tmpk].Id[0]}" {$selected} />
					</td>
					<td class="plaintext">
						{$tags[$tmpk].Title[0]}
					</td>

					{else}
						<td>&nbsp;</td><td>&nbsp;</td>
					{/if}
				{/section}
			</tr>
			{/if}
			{/foreach}

			</table>
			</div>
			<br/>
			<input value="{$templateconf.txtlistresults}" type="submit"/> 	<input value="{$templateconf.txtclearform}" type="reset"/>
	</td>
</tr>					
</table>
</form>
