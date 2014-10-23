{**
@param rating
@param postback
@param hover
**}
	<!--Start Rating Table-->
<table cellspacing="1" cellpadding="0" border="0">
<tr>
<td class="subtitle">{$templateconf.txtaveragerating}</td>
	{include file="$spath/$tourname/votefrm_sub.tpl" rating=$rating pos=1 }
	{include file="$spath/$tourname/votefrm_sub.tpl" rating=$rating pos=2 }
	{include file="$spath/$tourname/votefrm_sub.tpl" rating=$rating pos=3 }
	{include file="$spath/$tourname/votefrm_sub.tpl" rating=$rating pos=4 }
	{include file="$spath/$tourname/votefrm_sub.tpl" rating=$rating pos=5 }

</tr>
</table>
<!--End Rating Table-->

