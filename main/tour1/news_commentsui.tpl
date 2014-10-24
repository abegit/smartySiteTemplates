{if count($root.page.comments.comment) }

{if isset($root.page.comments.comment[0])}	
	{foreach from=$root.page.comments.comment item="item" name="commentsLoop" }


	<a name="comment"></a>	    
<div class="comments_box">

<table cellpadding="2">
<tr>
<td valign="top"><img src="images/commentbubble.gif" width="16" height="16" border="0"></td>
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

{if !($smarty.foreach.commentsLoop.last)}{/if}
{/foreach}
{else}
{assign var="item" value= $root.page.comments.comment }
  
<div class="comments_box">

<table cellpadding="2">
<tr>
<td valign="top"><img src="images/commentbubble.gif" width="16" height="16" border="0"></td>
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
{/if}

<table cellpadding="2">
<tr><td>
<span  class="comments_note">Only members are able to add comments.</span>

</td>
</tr>
</table>

{/if}


