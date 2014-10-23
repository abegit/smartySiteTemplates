{** Number of columns to show for sites **}
{assign var="site_numcolumns" value="3"}

{** Number of columns to show for categories **}
{assign var="category_numcolumns" value="3"}

<form id="searchform" action="search.php" method="get" style="margin:0px;">
<input name="st" type="hidden" value="advanced"/>


<table class="content_wrapper">
<tr><td align="left">

			<table id="search" cellspacing="0" cellpadding="2" border="0">
				<tr>
					<td align="left" colspan="5">
						<b>{$templateconf.txtfindphotosetsandmovies}</b> <br />
					</td>
				</tr>
				<tr>
					<td align="left">{$templateconf.txtallthesewords} <br />
<input name="qall" size="40" value="{$root.page.searchparam.all[0]}" /> <br />
				{$templateconf.txtseparatewithcommas}

<br />
<br />

						{$templateconf.txtanyofthesewords} <br />
<input name="qany" size="40" value="{$root.page.searchparam.any[0]}"/>
					 <br />
				{$templateconf.txtseparatewithcommas}

<br />
<br />

{$templateconf.txtthisexactword}
						 <br /><input name="qex" size="40" value="{$root.page.searchparam.phrase[0]}" />


					</td>
				</tr>

</table>





	<table id="search" cellspacing="0" cellpadding="2" border="0">


				<tr>
					<td align="left" colspan="5" style="padding-top:10px;"><b>{$templateconf.txtbutdontshowresults}</b> <br /></td>
				</tr>
				<tr>
					<td align="left">{$templateconf.txtanyofthesewords} <br />
<input name="none" size="40" value="{$root.page.searchparam.none[0]}"/>
				<br />{$templateconf.txtseparatewithcommas}</td>
				</tr>
</table>

	<table id="search" cellspacing="0" cellpadding="2" border="0">

				<tr>
					<td align="left" colspan="5" style="padding-top:10px;"><b>{$templateconf.txtonlyshowresultsfor}</b><br /></td>
				</tr>
		<tr>
			<td>{$templateconf.txtcontentaddedwithin}
<br />
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
			<td><br />{$templateconf.txtcontainsmediatypes} <br />
			
		{foreach from=$root.page.categories.cat item="cat1"}
		{strip}
		{if $cat1.Title[0] =='Areas'}
	<select style="width:200px;" name="cat[]">
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



{if isset($root.page.sites.site)}



	<table id="search" cellspacing="0" cellpadding="2" border="0">
	
					<tr>
						<td align="left" style="padding-top: 10px;" colspan="5">
							<b>Sites{$templateconf.txtsites}</b>
						</td>
					</tr>
	
	</table>
	
	
	<table id="search" cellspacing="0" cellpadding="2" border="0">
	{assign var="rows" value=0 }					
	{foreach from=$root.page.sites.site item="site1" key="kex"}
	{if $kex % $site_numcolumns == 0}
	<tr>
		{section name=column start=0 loop=$site_numcolumns step=1}
			{assign var="tmpk" value=$kex+$smarty.section.column.index}
			{if isset($root.page.sites.site[$tmpk])}
				<td valign="top">
					<input type="checkbox" name="site[]" value="{$root.page.sites.site[$tmpk].Id[0]}" />
				</td>
				<td>{$root.page.sites.site[$tmpk].Name[0]}</td>
			{else}
				<td>&nbsp;</td>
			{/if}
		{/section}
	</tr>
	{/if}
	{/foreach}
	
	</table>

{/if}





	<table id="search" cellspacing="0" cellpadding="2" border="0">

				<tr>
					<td align="left" style="padding-top: 10px;" colspan="5">
						<b>{$templateconf.txtthatmatchcategory}</b>
					</td>
				</tr>

</table>




	<table id="search" cellspacing="0" cellpadding="2" border="0">
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
			<td>
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
					
								<br/>	
				 		<input value="{$templateconf.txtlistresults}" type="submit"/>
				 
</td>
				</tr>					
		</table>
		</form>
