{** This page isn't a part of the tour, so it redirects to a page that is **}
{if isset($root.page.trial)}{config_load file='static.conf' scope="global"}
{elseif isset($root.page.tour)}{config_load file='static.tour.conf' scope="global"}
{else}{config_load file='static.conf' scope="global"}{/if}
{assign var="item" value=$root.page.contentgroup}
<html>
<head>
{** If SEO optimized URLs are enabled, use a base href **}
{if $root.seo_urls == "1"}
{assign var="areaurl" value=#areaurl#}
{assign var="areaurl" value=$areaurl|@full_url}
{global put="areaurl" value=$areaurl}
<base href="{$areaurl}" />
{/if}
<META http-equiv="refresh" content="1;URL={include file="$spath/$tourname/pg_tour.tpl" id=$item.Id[0]}" /> 
</head>
<body>
<a href="{include file="$spath/$tourname/pg_tour.tpl" id=$item.Id[0]}">Redirecting</a>
</body>
</html>

