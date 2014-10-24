{** 
* MailBox - ComposeMessage - Sub File - called from mailbox.tpl 
* Purpose: Compose a Message 
* --no parameters passed 
*}
<form method="POST" onsubmit="return msgvalidate(this)">

<table bgcolor="#c0c0c0" width="100%" cellspacing="2" cellpadding="1" border="0">
<tr><td class="mailboxinfo">
<span class="mailboxtext"><b>{$templateconf.txtcomposemessage}</b></span>
</td>
</tr>
<tr>
<td class="mailboxtitlebar" align="left">

<table>
<tr>
 <td class="mailboxtext">{$templateconf.txtto}
</td>
 <td>
  <select name="To">
   {foreach from=$root.page.admins.admin item="admin"}
    <option value="{$admin.Id[0]}">{$admin.AdminName[0]}</option>
   {/foreach}
  </select>
 </td>
</tr>

<tr>
 <td class="mailboxtext">{$templateconf.txtsubject}</td>
 <td><input name="Subject" style="width:400px;" value="" /></td>
</tr>

<tr>
 <td class="mailboxtext">{$templateconf.txtemail}</td>
 <td><input name="Email" style="width:400px;" value="{$root.page.user.Email[0]}" /></td>
</tr>

<tr>
 <td class="mailboxtext"></td>
 <td class="mailboxtext"><input name="GetEmail" type="checkbox" value="1" {if $root.page.user.GetEmail[0] == 1}checked="checked"{/if} />
 {$templateconf.txtgetemail}</td>
</tr>

<tr>
 <td valign="top" class="mailboxtext">{$templateconf.txttxtmessage}</td>
 <td><textarea cols="108" rows="20" name="Body"></textarea></td>
</tr>

<tr>
 <td align="right" colspan="2">
  <input name="Send" type="submit" value="{$templateconf.txtsendmessage}" />
 </td>

</tr>

</table>
 </td>
</tr>

</table>
</form>
<!--End Compose Message Table-->