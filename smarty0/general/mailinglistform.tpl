{**
* The Mailing List File
 - no parameters passed 
**}

{if isset($root.page.mailinglist.item)}

{literal}
<script>
function mailingform_validate(v)
{
  pss = new Object();
  pss.ajax    = 1;
  pss.id      = v.id.value;
  pss.email   = v.email.value;
  if (v.name)
  {
	pss.name  = v.name.value;
  }
  pss.add     = 1;


  $.post(v.action, pss,
     function(data) {

		v.email.value = "";
		if (v.name)
		{
			v.name.value = "";
		}

       alert(data);
   });

  return false;
}
</script>
{/literal}


{foreach from =$root.page.mailinglist.item item=item}
	<!--Start Mailing List Table-->


<form id="searchform" action="{$item.ManageURL[0]}" method="POST" style="margin:0px;" onsubmit="return mailingform_validate(this)">
<input name="id" type="hidden" value="{$item.Id[0]}"/>
<table cellspacing="0" cellpadding="2" border="0">
<tr>
<td align="left" class="mailing_list">
{$templateconf.txtenteremail}<input name="email" size="24" maxlength="100"/>

{if $item.NameShow[0] == 1}
{$templateconf.txtentername}<input name="name" size="25" maxlength="100"/>
{/if}



 <input value="{$templateconf.txtsubscribe}" type="submit"/>
 <input name="add" type="hidden" value="1"/>
</td>
</tr>
</table>
</form>
<!--End Mailing List Form-->

{/foreach}
{/if}
<!-- End Mailing List Table-->