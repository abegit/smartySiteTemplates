{** 
* MailBox - Message List - Sub File - called from mailbox.tpl 
* Purpose: View Messages 
* --no parameters passed 
*}
{global get="image_folder" assign="image_folder"}
<table bgcolor="#c0c0c0" width="100%" cellspacing="2" cellpadding="1" border="0">

<tr>
<td  align="center">


<table width="100%" border="0" cellpadding="0" cellspacing="1" class="mailboxtitlebar">
	<tr>
          <td width="20" align="left">&nbsp;</td>
	  <td width="200" align="left" class="mailboxtitlebar">{$templateconf.txtsubject}
	  </td>
	  <td align="left" class="mailboxtitlebar">
	   {if $root.page.messages_attr[0].inbox == 1}
			{$templateconf.txtfrom}
	    {else}
		{$templateconf.txtto}
	    {/if}
	  </td>
	  <td align="left" class="mailboxtitlebar">
               {if $root.page.messages_attr[0].inbox == 1}
		{$templateconf.txtdatereceived}
	      {else}
   		{$templateconf.txtdatesent}
                {/if}
	  </td>
	  <td align="left">
	  	
	  </td>
	</tr>
	{foreach from=$root.page.messages.message item="message"}
	<tr>
          <td align="left" class="mailboxinfo">{if $message.Answered[0] == 1 }<img src="{$image_folder}/icons/sent.gif" width="16" height="16" alt="" border="0" />{/if}</td>
          <td align="left" class="mailboxinfo">
		{if $message.New == 1 }
  		<a href="mailbox.php?id={$message.Id[0]}" class="message_link"><b>{$message.Subject[0]}</b></a>
	{else}
                <a href="mailbox.php?id={$message.Id[0]}" class="message_link">{$message.Subject[0]}</a>
	 {/if}
	  </td>
	  <td align="left" class="mailboxinfo">{$message.AdminName[0]}</td>
	  <td align="left" class="mailboxinfo">{$message.DateSent[0]}</td>
	 <td width="70" align="right"  class="mailboxinfo">
	
	<table cellpadding="0" cellspacing="0" border="0" class="mailboxinfo">
	<tr>
	 <td width="16">
			<a href="javascript:confirmdel({$message.Id[0]})"><img src="{$image_folder}/icons/remove.gif" width="16" height="16" alt="" border="0" /></a></td>
		  <td nowrap="nowrap" style="padding-left:4px;padding-right:5px;">
			<a href="javascript:confirmdel({$message.Id[0]})" class="message_link">{$templateconf.txtdeletemessage}</a></td>
		</tr>
	</table>
	</td>
	 
		</tr>
{/foreach}

</table>


		</td>
	</tr>
</table>
