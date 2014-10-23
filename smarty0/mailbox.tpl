{include file='general/page_top.tpl' item='messaging' title = $templateconf.txtprivatemessagemailbox }
{global get="image_folder" assign="image_folder"}

{literal}
<script>
function msgvalidate(v)
{

  subj = "{/literal}{$templateconf.txtmailjssubj}{literal}"
  body = "{/literal}{$templateconf.txtmailjsbody}{literal}"

  if (v.Subject.value == "")
  {
     alert(subj);
	 v.Subject.focus()
     return false
  }

  if (v.Body.value == "")
  {
     alert(body);
	 v.Body.focus()
     return false
  }


  pss = new Object();
  if (v.To.selectedIndex)
  {
    pss.To      = v.To[v.To.selectedIndex].value
  }
  else
  {
    pss.To      = v.To.value
  }
  pss.Subject = v.Subject.value
  pss.Email   = v.Email.value
  pss.Body    = v.Body.value
  pss.Send    = "Send Message"
  pss.ajax    = "2";

  pss.GetEmail = (v.GetEmail.checked) ? 1 : 0;


  $.post("mailbox.php", pss,
     function(data) {
     
	     var dtt;
     
		 try
		 {
			 dtt = $.parseJSON(data);
     	 }
	 	 catch(e)
	 	 {
	 	 	alert("Error: " + data)
	 	 	return false;
	 	 }
     
       alert(dtt.message);
       if (dtt.success == "1")
       {
		   document.location = "mailbox.php";       
       }

   });



  return false;
}
</script>
{/literal}

<div class="wrapper" align="center">

<!--Header-->
{include file="$spath/general/header.tpl"}


<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl"}</div>


<!--Title Bar-->
<div class="title_bar">{$templateconf.txtprivatemessagemailbox}</div>


{literal}
<script type="text/javascript">
function confirmdel(id)
 {
   g = confirm("{/literal}{$templateconf.txtconfirmdelete}{literal}")

   if (g)
   {
       document.location="mailbox.php?delete=" + id;
   }
 }
</script>
{/literal}



<!--Start Inbox/Sent Message Listing Table-->
<form name="filter" id="filter" action="" method="GET">
		<table style="margin-top:1px;" cellspacing="0" cellpadding="2" border="0">
			<tr>
				<td align="right" width="10">
					<select name="inbox" id="inbox">
					<option value="1" {if $root.page.messages_attr[0].inbox == 1 }selected="selected"{/if} >Inbox</option>
					<option value="0" 	{if $root.page.messages_attr[0].inbox == 0 }selected="selected"{/if}>Sent Messages</option>
					</select>
				</td>
				<td align="left">
					<input type="submit" value="Go" />
				</td>

<td style="padding-left:25px;"><a href="mailbox.php?compose=1"><img src="{$image_folder}/icons/message.gif" width="24" height="20" alt="" border="0" /></a></td>
<td>
<a href="mailbox.php?compose=1" class="message_link">{$templateconf.txtcomposemessage}</a></td>

</tr>
</table>
</form>
<!--End Inbox/Sent Message Listing Table-->


{if $root.page.messages_attr[0].compose}
 	{include file="mailbox/mailbox_composemessage.tpl"}
{elseif $root.page.messages_attr[0].id}
	{include file="mailbox/mailbox_readmessage.tpl"}
{else}
	{include file="mailbox/mailbox_messagelist.tpl"}
{/if}


</div>

<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl"}</div>
