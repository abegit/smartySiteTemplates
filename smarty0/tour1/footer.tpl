
<br />

<span id="footer">

<!--The code below embeds a Template Field so that a 2257 link can be edited from within the admin panel under Plug-Ins/Template Fields-->

<!--The following if statement displays a 2257 link only if one has been entered for the 2257url Template Field in the admin panel-->



<!--This adds the text specified in the contacttext Template Field in the admin panel-->
{$templateconf.contacttext}

<!--This adds the URL specified in the contactemailurl Template Field in the admin panel-->
{if $templateconf.contactemailurl != ''}
<a href="{$templateconf.contactemailurl}">{$templateconf.contactemail}</a>
{/if}

<!--This adds anything specified in the feedbacklink1 Template Field in the admin panel-->
{if $templateconf.feedbacklink1}&nbsp;&nbsp;&nbsp;{$templateconf.feedbacklink1}{/if}


<!--This adds anything specified in the feedbacklink2 Template Field in the admin panel-->
{if $templateconf.feedbacklink2}&nbsp;&nbsp;&nbsp;{$templateconf.feedbacklink2}{/if}

<br />

{if $templateconf.subfootertext != ''}
<span class="subfooter">{$templateconf.subfootertext}</span>


<br>

 {$templateconf.usc2257}

</span>


{/if}





