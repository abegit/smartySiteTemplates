{** 
* MailBox -ReadMessage - Sub File - called from mailbox.tpl 
* Purpose: View Messages 
* --no parameters passed 
*}
{assign var="item" value=$root.page.messages.message[0]}

<!--Start Message Info Table-->
<table bgcolor="#c0c0c0" width="100%" cellspacing="2" cellpadding="1" border="0">

<tr>
<td  align="center">
<form method="POST" style="margin:0;" onsubmit="return msgvalidate(this)">

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="mailboxtitlebar">
	

	<tr>
	  <td align="left" class="mailboxtitlebar">{$templateconf.txtsubject}
	  </td>
        
	  <td align="left" class="mailboxtitlebar">{$templateconf.txtfrom}
	  </td>
	  <td align="left" class="mailboxtitlebar">
{$templateconf.txtdate}
	  </td>

	</tr>

<tr>

 <td height="20" align="left" class="mailboxinfo">{$item.Subject[0]}</td>
 <td align="left" class="mailboxinfo">{$item.AdminName[0]}</td>
 <td align="left" class="mailboxinfo">{$item.DateSent[0]}</td>
</tr>
</table>

<!--End Message Info Table-->
<br />

<table class="mailboxinfo" width="100%" cellspacing="2" cellpadding="1" border="0">
<tr><td align="left">
<span class="mailboxtext"><b>
{$templateconf.txtreplytomessage}</b></span>
</td>
</tr>
</table>

<!--Start Reply Table-->

<table bgcolor="#c0c0c0" width="100%" cellspacing="0" cellpadding="0" border="0">

	<tr>
	  <td align="left" class="mailboxtitlebar">

<table border="0" cellpadding="0" cellspacing="1" class="mailboxtitlebar">
	
<tr>
 <td class="mailboxtext">{$templateconf.txtsubject}</td>
 <td><input name="Subject" style="width:400px;" value="Re: {$item.Subject[0]}" /></td>
</tr>

<tr>
 <td class="mailboxtext">
{$templateconf.txtemail}</td>
 <td><input name="Email" style="width:400px;" value="{$root.page.user.Email[0]}" /></td>
</tr>

<tr>
 <td class="mailboxtext"></td>
 <td><input name="GetEmail" type="checkbox" value="1" {if $root.page.user.GetEmail[0]==1} checked='checked' {/if} />{$templateconf.txtgetemailresponses}</td>
</tr>



<tr>
 <td valign="top" class="mailboxtext">{$templateconf.txtmessage}</td>
 <td>
{if $root.page.messages.message.Inbox[0] == '0'}
	{$item.Body} <br /><br />
{else}
<textarea  cols="90" rows="20" name="Body">
* {$item.AdminName[0]}&nbsp;>{$templateconf.txtwrote}&nbsp;{$item.Body[0]}</textarea>
{/if}
</td>
</tr>

<tr>
<td>
</td>
 <td align="right">
  <input type="hidden" name="To" value="{$item.AdminId[0]}" />
  <input name="Send" type="submit" value="{$templateconf.txtsendmessage}" />
 </td>
</tr>

</table>

<!--End Reply Table-->
</td>
</tr>
</table>
</form>

</td>
</tr>
</table>