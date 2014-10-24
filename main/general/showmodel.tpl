{strip}
{assign var="cdir" value=#contentdir#}


{assign var="file" value=-1}
{foreach from=$topratedX.PreviewXML.element.item_attr item="img" key="imgKey"}
   {if $img.priority == $priority }
		{assign var="file" value=$img.Id}
		{assign var="pInfo" value=$img}
   {/if}
{/foreach}

{/strip}
<a class="model_title" href="{include file="$spath/general/pg_sets.tpl" id=$topratedX.Id[0] seoname=$topratedX.SEOname[0] item=$topratedX}">{$topratedX.ModelName[0]}</a><br />

{if isset($file) && $file!=-1}

{** Try to do an offset that leaves the popup outside of the models list **}
{math equation="113*p+20" p=$pos assign="left_offset"}

<a class="elevpreview"
	offset_bottom="-10" offset_left="{$left_offset}" tooltip="model-content-{$topratedX.Id[0]}" tooltip_width="400"
	href="{include file="$spath/general/pg_sets.tpl" id=$topratedX.Id[0] seoname=$topratedX.SEOname[0] item=$topratedX}"><img 
 class="thumbs target" 
 {if $pInfo.Width}width="{$pInfo.Width}"{/if}
 {if $pInfo.Height}height="{$pInfo.Height}"{/if}
 src="{$cdir}/contentthumbs/{$file}-set.jpg" ></a>

<div id="model-content-{$topratedX.Id[0]}" style="display:none;">

<span class="model_info_overlay">

<span class="model_info_overlay_title">{$templateconf.txtage}</span> {$topratedX.extrafields.age[0]}<br />
<span class="model_info_overlay_title">{$templateconf.txtheight}</span> {$topratedX.extrafields.height[0]}<br />
<span class="model_info_overlay_title">{$templateconf.txtmeasurements}</span> {$topratedX.extrafields.measurements[0]}<br />	
<span class="model_info_overlay_title">{$templateconf.txtastrologicalsign}</span> {$topratedX.extrafields.sign[0]}<br />
<span class="model_info_overlay_title">{$templateconf.txtfunfact}</span> {$topratedX.extrafields.funfact[0]}


<br /><br />
<span>{$topratedX.extrafields.bio[0]}</span>

{if isset($topratedX.PreviewXML.contentgroup.item_attr)}
<br />
<br />

<span class="model_info_overlay_title">{$templateconf.txtupdates}</span>: 
{assign var="show" value="0"}
{foreach from=$topratedX.PreviewXML.contentgroup.item_attr item="itm"}
 {if $show == 0}
 {if $itm.date <= $smarty.now|date_format:"%Y-%m-%d"}
   {assign var="show" value="1"}
   {$itm.count} {if $itm.count != 1}{/if}
 {/if}
 {/if}
{/foreach}
{/if}



<br /><br />
<span class="tabletlink">
Double tap the picture view this model.
</span>

</span>

</div>





{else}
 <img src="images/p{$priority}.jpg" />
{/if}