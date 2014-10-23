{**
  @zone
**}

 {assign var="urllink" value="bannerload.php?zone=$zone"}


{if isset($page.sites_attr[0].id)}
 {assign var="urllink" value="`$urllink`&site=`$page.sites_attr[0].id`"}
{/if}

{if isset($page.models.model.Id[0])}
 {assign var="urllink" value="`$urllink`&model=`$page.models.model.Id[0]`"}
{/if}

{if isset($page.contentgroup.PreviewXML.sets.set)}
 {assign var="models" value=""}
 {foreach from=$page.contentgroup.PreviewXML.sets.set item=set}
   {assign var="models" value="`$models``$set.Id[0]`,"}
 {/foreach}
 
 {assign var="urllink" value="`$urllink`&model=`$models`"}
{/if}

{if isset($page.contentgroup.PreviewXML.category.item_attr)}
 {assign var="cats" value=""}
 {foreach from=$page.contentgroup.PreviewXML.category.item_attr item=cat}
   {assign var="cats" value="`$cats``$cat.category`,"}
 {/foreach}
 
 {assign var="urllink" value="`$urllink`&cat=`$cats`"}
{/if}

{if isset($allmodels)}
 {assign var="urllink" value="`$urllink`&model=*"}
{/if}

{if isset($allcats)}
 {assign var="urllink" value="`$urllink`&cat=*"}
{/if}


<div>

<noscript>

{assign var="useb" value="0"}

{foreach from=$page.banners.banner item=banner}
 {if ($banner.ZoneId[0] == $zone) && ($useb == "0")}
  {assign var="useb" value="1"}

{if $banner.FileExt[0] != ""}
 <div>
	{if isset($root.page.vod)}
	  {assign var="cdir" value="/media/thumb/##token##"}
	{else}
	  {assign var="cdir" value=#contentdir#}
	{/if}

	<a href="bannerload.php?track={$banner.Id[0]}"><img border="0" src="{$cdir}/{$banner.Id[0]}-banner.{$banner.FileExt[0]}" /></a>
 </div>
{/if}
 {if $banner.Description[0] != ""}
  <a href="bannerload.php?track={$banner.Id[0]}"><span class="banner-text">{$banner.Description[0]}</span></a>
 {/if}


 {/if}
{/foreach}


</noscript>


<script>
{literal}
<!--
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
    document.write(AJAX.responseText);
  }
-->
{/literal}
</script>

</div>