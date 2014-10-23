{** Detection code **}
{foreach from=$item.PreviewXML.content.types.type_attr item="type"}

{assign var="highres" value=0}
{assign var="caps" value=0}
{assign var="vids" value=0}

{if $type.type =='highres'}
{assign var="highres" value=$type.num}
{elseif $type.type =='caps'}
{assign var="caps" value=$type.num}
{elseif $type.type =='vids'}
{assign var="vids" value=$type.num}
{/if}
{/foreach}



<center>
<div id="episode_wrap" align="center">
<div id="episode">
<a name="update"></a>
<table id="episode_title" cellspacing="0" cellpadding="0" border="0">
<tr>
<td><!--Title-->
{$item.Title[0]}</td>
<td align="right">
<!--Featured Models-->
{if isset($item.PreviewXML.sets.set)}
		{foreach from=$item.PreviewXML.sets.set item="itemS" name="loopCN"}{$itemS.ModelName[0]} 
			{if !$smarty.foreach.loopCN.last },&nbsp;{/if}
		{/foreach}
		{/if}</td>


<!-- <td align="right">{$templateconf.txtadded}&nbsp;{$item.DateDisplay[0]}</td> -->

</tr>
</table>

<table id="episode_thumbs_table" cellspacing="0" cellpadding="0" align="center" width="961">

<tr>
<td class="episode_thumbs" rowspan="2" width="664" border="0" align="center">
<div id="swap_{$item.Id[0]}" align="center">
{if $item.trailer_url[0] != ""}

<script>
{literal}
    jwplayer("{/literal}swap_{$item.Id[0]}{literal}").setup({
        file: "{/literal}{$item.trailer_url[0]}{literal}",
        image: "{/literal}content/{$item.Directory[0]}/0.jpg{literal}",
        width: 640,
        height: 360,
		primary: "flash",
        autostart: false
    });
{/literal}
</script>

{else}
<img src="content/{$item.Directory[0]}/0.jpg" border="0" class="thumbs" />
{/if}
</div>
</td>
<td class="episode_thumbs" border="0" width="297"><img src="content/{$item.Directory[0]}/1.jpg" border="0" class="thumbs" /></td>
</tr>
<tr>
<td class="episode_thumbs" border="0" width="297"><img src="content/{$item.Directory[0]}/2.jpg" border="0" class="thumbs" /></td>
</tr>
<tr>
<td>


<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td>


<div class="episode_description">

<!--Description-->
{$item.Description[0]}


<br />
<br />

<!--Photo Count/Movie Length-->
{foreach from=$item.PreviewXML.content.types.type_attr item="tmp"}
	{if $tmp.type== "highres"}
		{assign var="h" value=$tmp.num}
	{/if}
{/foreach}

{foreach from=$item.PreviewXML.content.names.name_attr item="tmp"}
	{if isset($tmp.movie_length)}
		{assign var="ml" value=$tmp.movie_length}
	{/if}
{/foreach}



{if isset($h)}{$h}&nbsp;{$templateconf.txtPhotos}{/if}


{if isset($ml)}
	{$templateconf.txtand}&nbsp;{include file="$spath/general/display_movielength.tpl" length=$ml}&nbsp;{$templateconf.txtofvideo}
{/if}

<div align="center">


</div>

</div>



</td>
<td align="right" width="297" class="episode_thumbs"><img src="content/{$item.Directory[0]}/3.jpg" border="0" class="thumbs" /></td>
</tr>
</table>

	</td>
<td class="episode_thumbs">
<img src="content/{$item.Directory[0]}/4.jpg" border="0" class="thumbs" />
	</td>
</tr>
</table>




</div>
</div>
</div>
</center>
<br />



