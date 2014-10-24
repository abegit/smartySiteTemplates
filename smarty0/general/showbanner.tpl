{**
  @zone
  @allmodels
  @allcats
**}
{strip}
{global get="zoneinc" assign="zoneinc"}
{if $zoneinc == ""}
  {assign var="zoneinc" value="0"}
{/if}
{math equation="$zoneinc+1" assign=zoneinc}
{global put="zoneinc" value=$zoneinc}

{assign var="cdir" value=#contentdir#}

 {assign var="urllink" value="bannerload.php?zone=$zone"}

{if isset($root.page.sites_attr[0].id)}
 {assign var="urllink" value="`$urllink`&site=`$root.page.sites_attr[0].id`"}
{/if}

{if isset($root.page.models.model.Id[0])}
 {assign var="urllink" value="`$urllink`&model=`$root.page.models.model.Id[0]`"}
{/if}

{if isset($root.page.contentgroup.PreviewXML.sets.set)}
 {assign var="models" value=""}
 {foreach from=$root.page.contentgroup.PreviewXML.sets.set item=set}
   {assign var="models" value="`$models``$set.Id[0]`,"}
 {/foreach}
 
 {assign var="urllink" value="`$urllink`&model=`$models`"}
{/if}

{if isset($root.page.contentgroup.PreviewXML.category.item_attr)}
 {assign var="cats" value=""}
 {foreach from=$root.page.contentgroup.PreviewXML.category.item_attr item=cat}
   {assign var="cats" value="`$cats``$cat.category`,"}
 {/foreach}
 
 {assign var="urllink" value="`$urllink`&cat=`$cats`"}
{elseif isset($root.page.category.Id[0])}
 {assign var="urllink" value="`$urllink`&cat=`$root.page.category.Id[0]`"}
{/if}

{if isset($allmodels)}
 {assign var="urllink" value="`$urllink`&model=*"}
{/if}

{if isset($allcats)}
 {assign var="urllink" value="`$urllink`&cat=*"}
{/if}

{assign var="zonename" value="bzone_`$zone`_`$zoneinc`"}
{/strip}
{if in_array('banners',$pluginsdata.plugins) && $pluginsdata.enabled.banners == 1 }
<script>
{literal}
var jQbanner = jQuery.noConflict();
 jQbanner(document).ready(function(){

  if (window.XMLHttpRequest)
  {
    AJAX=new XMLHttpRequest();
  }
  else
  {
    AJAX=new ActiveXObject("Microsoft.XMLHTTP");
  }
  if (AJAX)
  {
    AJAX.open("GET", "{/literal}{$urllink}{literal}", false);
    AJAX.send(null);

    {/literal}
	document.getElementById("{$zonename}").innerHTML = AJAX.responseText;
    {literal}
  }
 });

{/literal}
</script>


<div align="center" id="{$zonename}">
<noscript>
{assign var="useb" value="0"}

{foreach from=$root.page.banners.banner item=banner}
 {if ($banner.ZoneId[0] == $zone) && ($useb == "0")}
  {assign var="useb" value="1"}

{if $banner.FileExt[0] != ""}
 <div>
 <a href="bannerload.php?track={$banner.Id[0]}"><img border="0" src="{$cdir}/contentthumbs/{$banner.Id[0]}-banner.{$banner.FileExt[0]}" /></a>
 </div>
{/if}
 {if $banner.Description[0] != ""}
  <a href="bannerload.php?track={$banner.Id[0]}"><span class="banner-text">{$banner.Description[0]}</span></a>
 {/if}


 {/if}
{/foreach}
</noscript>
</div>
{/if}