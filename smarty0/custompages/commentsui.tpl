{if count($root.page.comments.comment) && $root.has_username}

{foreach from=$root.page.comments.comment item=item name="commentsLoop"}

{if $item.showasadmin[0]}
<div class="comments_box_admin">
{else}
<div class="comments_box">
{/if}

<table cellpadding="2">
<tr>
<td valign="top">

{if $item.showasadmin[0]}
<img src="images/commentbubble-admin.png" width="36" border="0">
{else}
<img src="images/commentbubble.png" width="24" border="0">
{/if}

</td>
<td valign="top"><!--User Name-->
<span class="comments_user">{$item.displayname[0]}</span>

<br>

<!--Comment Text-->
<span class="comments_body">{$item.commenttxt[0]}</span>

<br>
<!--Date-->
<span class="comments_info">{$item.DateDisplay[0]}</span>

</td>
</tr>
</table>

</div>




	{if !$smarty.foreach.commentsLoop.last}{/if}
{/foreach}
{/if}

{if $root.has_username}


<div class="comments_box">

{literal}
<script>
function commentvalidate(v)
{
  pss = new Object();
  pss.ajax    = 1;
  pss.contenttype = v.contenttype.value;
  pss.itemid      = v.itemid.value;
  pss.redirect    = v.redirect.value;
  pss.displayname = v.displayname.value;
  pss.commenttxt  = v.commenttxt.value;

  $.post("commentpost.php", pss,
     function(data) {

		if (data.match(/thank you/i))
		{
			v.commenttxt.value = "{/literal}{$templateconf.txtwriteacomment}{literal}";
		}

       alert(data);
   });

  return false;
}

function comment_field_focus(v)
{
  if (v.value == "{/literal}{$templateconf.txtwriteacomment}{literal}")
  {
	v.value = "";
  }
}

</script>
{/literal}


<form method="post" action="commentpost.php" style="margin:0px;" onsubmit="return commentvalidate(this)">
<input type="hidden" name="contenttype" value="custompages" />
<input type="hidden" name="itemid" value="{$root.page.content.item[0].Id[0]}" />
<input type="hidden" name="redirect" value="{include file="$spath/general/pg_custompages.tpl" item=$root.page.content.item[0]}" />
	
<span class="comments_heading">{$templateconf.txtaddcomment}</span>

<table>
<tr>
<td style="padding-left:22px;padding-right:4px;" align="left" class="comments_info">{$templateconf.txtyourname}</td>
<td align="left"><input name="displayname" size="35" type="text" value=""/></td>
</table>


<table width="100%">
<tr>
<td style="padding-left:22px;padding-right:22px;" align="left" class="comments_info" colspan="2">
<textarea onfocus="comment_field_focus(this)" class="comments_field" name="commenttxt" style="width:100%;" rows="2">{$templateconf.txtwriteacomment}</textarea><br>


</td>
</tr>
</table>

<table width="100%">
<tr>
<td valign="top" style="padding-left:22px;" class="comments_note">{$templateconf.txtcommentnote}</td>
<td valign="top" style="padding-right:22px;" align="right">
<input type="submit" value="{$templateconf.txtsubmitcomment}"/>
</td>
</tr>
</table>
</form>
</div>
{/if}
