{include file='general/page_top.tpl' pagename="news" title="Feedback"}


<div class="wrapper" align="center">

<!--Header-->
{include file="$spath/general/header.tpl"}


<!--Top Navbar-->
<div class="nav_fixed_width">{include file='general/topnav.tpl' item=$nav}</div>


<!--Model A-Z Links-->
<div align="center">{include file="$spath/general/a-zlinks.tpl" zone=1 static=0}</div>

<!--Title-->
<div class="title_bar">{$form.formdata.Name}</div>

<div align="left">

{if $root.page.thankyou == 1}

<span class="feedback_success">

<p>Thank you</p>

<p>{$root.page.forms.form[0].formdata.ThankYou}</p>

<p>Please click <a href="{$root.page.forms.form[0].formdata.Redirect}">here</a> if you are not redirected</p>

</span>

<meta http-equiv="refresh" content="2;url={$root.page.forms.form[0].formdata.Redirect}" />


{else}




<!--Start Feedback Table-->

{assign var="form" value=$root.page.forms.form[0]}



<form style="margin:0px;" action="{$form.formattr.Action}" name="{$form.formattr.Name}" id="{$form.formattr.Id}" method="POST">
<input type="hidden" name="redirect" value="{$form.formdata.Redirect}" />
<input type="hidden" name="id" value="{$form.formdata.Id}" />


<!--Title-->
<div class="title_bar">{$form.formdata.Name}</div>

<table cellpadding="2" cellspacing="2" border="0">
	{if $form.formdata.Message != ''}
		<tr>
			<td colspan="2" class="feedback_fields" align="left">
				{$form.formdata.Message}
			</td>
		</tr>
	{/if}


	{if isset($root.page.errmsg)}
		<tr>
			<td style="color:red;" colspan="2">
				{$root.page.errmsg}
			</td>
		</tr>
	{/if}


	<tr>
		<td colspan="2" style="padding-bottom:6px;" class="feedback_fields" align="left">{$form.formdata.Descr}</td>
	</tr>
	{foreach from=$form.field item=item}
	<tr style="color:black;">
		<td class="feedback_fields"
			{if $item.ItemType == 'radio' or $item.ItemType == 'checkbox' or $item.ItemType == "textarea"}valign="top"{/if}
			>{$item.Label}</td>
			{if $item.ItemType == 'text'}
				<td class="feedback_fields"><input type="{$item.ItemType}" name="{$item.Name}" id="{$item.Name}" size="35" value="{$item.DefaultValue}" /></td>

			{elseif $item.ItemType == 'textarea'}
		
				<td class="feedback_fields"><textarea name="{$item.Name}" id="{$item.Name}" cols="65" rows="5">{$item.DefaultValue}</textarea></td>

			{elseif $item.ItemType == 'radio'}

				<td class="feedback_fields">
				<table>

				{foreach from=$item.ItemOption item=itemoption}
				<tr>
					{if $item.DefaultValue == $itemoption.Value}
						<td><input name="{$item.Name}" type="radio" value="{$itemoption.Value}" id="{$itemoption.OptionId}" checked="checked"/></td><td>{$itemoption.Name}</td>
					{else}
						<td><input name="{$item.Name}" type="radio" value="{$itemoption.Value}" id="{$itemoption.OptionId}"/></td><td>{$itemoption.Name}</td>
					{/if}
				</tr>
				{/foreach}
				</table>
				</td>

			{elseif $item.ItemType == 'checkbox'}

				<td class="feedback_fields">
				<table>
				{foreach from=$item.ItemOption item=itemoption}
				<tr>
					{if $item.DefaultValue == 'checked'}
						<td><input type="checkbox" name="{$itemoption.OptionId}[]" value="{$itemoption.Value}" id="{$itemoption.OptionId}" checked="checked"/></td><td>{$itemoption.Name}</td>
					{else}
						<td><input type="checkbox" name="{$itemoption.OptionId}[]" value="{$itemoption.Value}" id="{$itemoption.OptionId}"/></td><td>{$itemoption.Name}</td>
					{/if}
				</tr>
				{/foreach}
				</table>
				</td>
			
			{elseif $item.ItemType == 'select'}
				<td class="feedback_fields">
				<select name="{$item.Name}" id="{$item.Name}">
				{foreach from=$item.ItemOption item=itemoption}
					{if $item.DefaultValue == $itemoption.Value}
						<option value="{$itemoption.Value}" selected="selected">{$itemoption.Name}</option>
					{else}
						<option value="{$itemoption.Value}">{$itemoption.Name}</option>
					{/if}
				{/foreach}
				</select>
				</td>
			{/if}
	</tr>
	{/foreach}
	<tr>
		<td colspan="2" class="feedback_submit">
			<input type="submit" name="submitfeedback" value="Submit Form"/>
		</td>
	</tr>
</table>
</form>


<!--End Feedback Table-->







{/if}






</div>

<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl"}</div>




