<div class="column_background">

<form style="margin:0;">
<select style="width:150px;" name="lang" onchange="submit()">
{foreach item=item from=$root.page.languages.language key="lKey"}
	<option value="{$item.Id[0]}" {if ($page.languages_attr[0].id == $item.Id[0])}  selected = 'selected' {/if} >
	 {$item.Name[0]}
	</option>
{/foreach}
</select>
</form>

<br>

</div>

