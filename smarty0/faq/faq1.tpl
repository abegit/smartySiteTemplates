<div class="faq">

{foreach from=$root.page.faqs.item item="item"}

{$item.sublevel[0]}.&nbsp;<a class="faq_link" href="{include file="$spath/general/pg_faq.tpl"}#{$item.sublevel[0]}">{$item.Title[0]}</a>

{if $item.open[0] == 1 } 	 {else} {/if} 
{assign var="endtags" value=$item.close[0]}
{section name=endtags  start=0 loop=$endtags max=$endtags step=1} 
{/section}

<br />

{/foreach}


<br />
<br />

<!--Title Bar-->
<div class="title_bar">{$templateconf.txtfaqsanswers}</div>



{foreach from=$root.page.faqs.item item="item"}

<a name="{$item.sublevel[0]}"></a>

<span class="faq_title">{$item.sublevel[0]}.&nbsp;{$item.Title[0]}</span>

<p class="faq_description">{$item.Description[0]}</p>


{assign var="endtags" value=$item.close[0]}
{section name=endtags  start=0 loop=$endtags max=$endtags step=1} 

{/section}
{/foreach}
		
</div>