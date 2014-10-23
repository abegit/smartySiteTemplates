{if isset($item) && $item!=""}

{assign var="cdir" value=#contentdir#}
	
<!--Title-->
<a 
{if $item.URL[0] != ""}
  href="{$item.URL[0]}"
{else}
  href="{include file="$spath/general/pg_bonus.tpl" fc='3' id=$item.Id[0] seoname=$item.SEOname[0]}"
{/if}
><span class="bonus_title">{$item.Title[0]}</span></a>

<br />

<!--Date-->
<span class="date">{$templateconf.txtadded} {$item.DateDisplay[0]}</span>

<br />

<!--Thumbnail-->	
<a 
{if $item.URL[0] != ""}
  href="{$item.URL[0]}"
{else}
  href="{include file="$spath/general/pg_bonus.tpl" fc='3' id=$item.Id[0] seoname=$item.SEOname[0]}"
{/if}

><img class="thumbs" src="{$cdir}/contentthumbs/{$item.PreviewXML.element.item_attr[0].Id}-bonus.jpg"/></a>
	

	<br />

{else}	
	&nbsp;
{/if}