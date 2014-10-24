

{strip}

{assign var="go" value=0}
{foreach from=$root.page.movietabs.item item="mtab" key="k"} 
	{if $root.page.settype[0]==$mtab } {assign var="go" value=1} {/if}
{/foreach}
{if $go==1 }
	{capture assign="title"}
		{$root.page.contentgroup.Title[0]} - {$templateconf.txtMovies} 
	{/capture} 
{else}
	{capture assign="title"}
		{$root.page.contentgroup.Title[0]} - {$templateconf.txtphotogallery}
	{/capture}
{/if}


{/strip}{include file='general/page_top.tpl' pagename="index" title=$title onload=$onload seokey=$root.page.contentgroup.SEOkey[0] seodesc=$root.page.contentgroup.SEOdesc[0]}


{literal}
<!--JS required by rating form-->
<script type="text/JavaScript">
function frmsubmit(u, v) {
if (document.all)	{
u.form.submit()
} else {
document.forms[v].submit()
}
}
{/literal}
{literal}
function trialfail()
{
  document.location = "{/literal}{$root.page.trial.VideoURL[0]}"
  return false
}
</script>
<div class="wrapper" align="center">

<!--Header-->
{include file="$spath/general/header.tpl" item=$nav}

<div class="container content">
<!--Top Navbar-->
<div class="nav_fixed_width">
{include file="$spath/general/topnav.tpl" item=$nav}</div>


{** Choosing What Page to Display **}
{if $root.page.trial && $root.page.settype[0] == 'highres'}
	{if in_array($root.page.onpage[0], $root.page.trial.AccessPages.page) || $root.page.trial.AccessPages.page[0]==0 || in_array($root.page.contentgroup.Id[0], $root.page.trial.AllowRecent.Id)}
		{include file="$spath/gallery/gallery1.tpl"}
	{else}
		<p>{$templateconf.txtnopermission}</p>
	{/if}
{else}
	{include file="$spath/gallery/gallery1.tpl"}
{/if}



</div>
</div>

<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl" item=$nav}</div>

