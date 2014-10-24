{global get="image_folder" assign="image_folder"}
<div id="usertagging_1" class="tagvis"><table cellspacing="2" cellpadding="2" border="0">
<tr>
<td><img src="{$image_folder}/icons/add.gif" width="16" height="16" alt=""/></td>
<td>

	<a href="javascript:showtagform({$root.page.contentgroup.Id[0]})" class="suggest_tags_link">{$templateconf.txtclicktoaddkeywordtags}</a>

</td>
</tr>
</table>
	</div>




{literal}
<style>
.tagvis
{
  visibility: visible;
}

.taghid
{
  position: absolute;
  visibility: hidden;
}
</style>

<script>
function showtagform(id)
{
  if (window.XMLHttpRequest)
  {
    // If IE7, Mozilla, Safari, etc: Use native object
    var http = new XMLHttpRequest()
  }
  else
  {
     if (window.ActiveXObject)
     {
        // ...otherwise, use the ActiveX control for IE5.x and IE6
        var http = new ActiveXObject("Microsoft.XMLHTTP");
     }
  }

  var url = "tagset.php?get=1&id=" + id

  http.open("GET", url, true);
  http.onreadystatechange = function()
  {
        if(http.readyState == 4 && http.status == 200)
        {
			resp = http.responseText;

			document.getElementById("usertagging_1").className = "taghid plaintext"
			document.getElementById("usertagging_2").className = "tagvis plaintext"
			document.getElementById("usertagging_3").className = "taghid plaintext"

			document.forms["tagform"].tagtxt.value = resp
        }
  }

  http.send(null);

}

function submittagform(id)
{
  if (window.XMLHttpRequest)
  {
    // If IE7, Mozilla, Safari, etc: Use native object
    var http = new XMLHttpRequest()
  }
  else
  {
     if (window.ActiveXObject)
     {
        // ...otherwise, use the ActiveX control for IE5.x and IE6
        var http = new ActiveXObject("Microsoft.XMLHTTP");
     }
  }

  resp = document.forms["tagform"].tagtxt.value

  var url = "tagset.php?set=1&id=" + id + "&tags=" + escape(resp)

  http.open("GET", url, true);
  http.onreadystatechange = function()
  {
        if(http.readyState == 4 && http.status == 200)
        {
			document.getElementById("usertagging_1").className = "taghid plaintext"
			document.getElementById("usertagging_2").className = "taghid plaintext"
			document.getElementById("usertagging_3").className = "tagvis plaintext"
        }

		return false
  }

  http.send(null);
  return false
}
</script>
{/literal}

<div align="left" id="usertagging_2" class="taghid " style="margin-left:6px;margin-top:4px;"><form name="tagform" onsubmit="return submittagform({$root.page.contentgroup.Id[0]})">
	<span class="suggest_tags">{$templateconf.txtaddtags}</span>
	
	 <input type="text" name="tagtxt" value ="" size="40" /><input type="submit" name="Submit" value='Submit'/>
	</form> 
	<span class="suggest_tags_instruction">{$templateconf.txtenterkeywords}</span>
</div>

<div align="left" id="usertagging_3" class="taghid" style="margin-left:6px;margin-top:4px;">
<span class="suggest_tags_instruction">{$templateconf.txtthankyouforsuggesting}</span>
<br /><a href="javascript:showtagform({$root.page.contentgroup.Id[0]})" class="suggest_tags_link">{$templateconf.txtaddmoretags}</a>
</div>

