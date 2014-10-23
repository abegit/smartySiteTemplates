{include file="$spath/general/topnav.tpl" position="bottom"}

<span id="footer">


<br />




<!--This adds the text specified in the contacttext Template Field in the admin panel-->
{$templateconf.contacttext}

<!--This adds the URL specified in the contactemailurl Template Field in the admin panel-->
{if $templateconf.contactemailurl != ''}
<a class="footer_link" href="{$templateconf.contactemailurl}">{$templateconf.contactemail}</a>
{/if}

<!--This adds anything specified in the feedbacklink1 Template Field in the admin panel-->
{if $templateconf.feedbacklink1}&nbsp;&nbsp;&nbsp;{$templateconf.feedbacklink1}{/if}


<!--This adds anything specified in the feedbacklink2 Template Field in the admin panel-->
{if $templateconf.feedbacklink2}&nbsp;&nbsp;&nbsp;{$templateconf.feedbacklink2}{/if}

<br />

{if $templateconf.subfootertext != ''}
<span class="subfooter">{$templateconf.subfootertext}</span>
{/if}


<br />
<!--This embeds a Template Field so that a 2257 link can be edited from within the admin panel under Plug-Ins/Template Fields-->

<!--The 2257 link only shows if one has been entered for the 2257url Template Field in the admin panel-->

 {$templateconf.usc2257}











<!-- Add Google Analytics Code -->

{if $templateconf.googleanalyticscode != ''}

{literal}
<script type="text/javascript">
<!--
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
-->
</script>
<script type="text/javascript">
<!--
try {
var pageTracker = _gat._getTracker("{/literal}{$templateconf.googleanalyticscode}{literal}");
pageTracker._trackPageview();
} catch(err) {}
-->
</script>
{/literal}
<!-- End Analytics Code -->
{/if}

</span>

<br />
<br />
      
</body></html>
