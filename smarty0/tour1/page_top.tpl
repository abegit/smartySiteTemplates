

{if $templateconf.googleanalyticscode != ''}
<!-- Google Analytics code -->
{literal}
<script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', '{/literal}{$templateconf.googleanalyticscode}{literal}']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>
{/literal}
{/if}



<div id="universal_navbar">
<table cellpadding="0" cellspacing="0" border="0">
<tr><td class="totals" align="left"> 

<!--Photo, Movie and Model Totals-->

{assign var="h3" value="0"}
{if isset($root.totals.item)}
{foreach from=$root.totals.item_attr item="tmp"}
{if $tmp.MajorType =='models'}
{assign var="h1" value=$tmp.Num}
{/if}
{if $tmp.MajorType =='types' && $tmp.MinorType == 'highres'}
{assign var="h2" value=$tmp.Num}
{/if}
{if $tmp.MajorType =='videos' && $tmp.MinorType == 'fullvideo'}
{assign var="h3" value=$tmp.Num}
{/if}
{/foreach}
{/if}

{$h2}&nbsp;{$templateconf.tourtxthighresphotos}, {$h3}&nbsp;{$templateconf.tourtxtfulllengthmovies}, {$h1} + {$templateconf.tourtxthotgirls}

</td>

<td align="right">
{if ($templateconf.tourtxtmobileurl) || ($root.page_attr[0].mobileswap)}

<div style="display:inline;">
{if $templateconf.tourtxtmobileurl}
<a class="topiconlink" href="{$templateconf.tourtxtmobileurl}">{$templateconf.txtmobile|@strtoupper}</a>
{elseif $root.page_attr[0].mobileswap}
<a class="topiconlink" href="index.php?mobile=1">{$templateconf.txtmobile|@strtoupper}</a>
{else}
&nbsp;
{/if}
</div>

<div style="display:inline;">
<img src="images/icons/mobileicon.png" border="0" class="topicon">
</div>

{else}
&nbsp;
{/if}
</td>

</tr>
</table>


</div>

