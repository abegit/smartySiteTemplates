<!--Thumbnail-->
{assign var="usep" value=$usepriority|explode:","}
{assign var="done" value="0"}

{assign var="pexists" value="0"}

{foreach item=i from=$item.PreviewXML.element.item_attr}
{if $i.priority==$usep[0]}
  {assign var="pexists" value="1"}
  {assign var="pelement" value=$i}
{/if}
{/foreach}


{foreach item=i from=$item.PreviewXML.element.item_attr}
{if $i.priority==$usep[0]}
  {assign var="pexists" value="1"}
{/if}
{/foreach}


{if $pexists == 1}
<img 
 id="set-target-{$item.Id[0]}" 

 {if $pelement.Width > 0}width="{$pelement.Width}"{/if}
 {if $pelement.Height > 0}height="{$pelement.Height}"{/if}

 {if isset($alt)}alt="{$alt}"{/if} 
 {if isset($style)}style="{$style}"{/if} 
 class="{if isset($class)}{$class} {/if}stdimage" 

 {if !isset($usep[0])}
  src="content/contentthumbs/{$item.PreviewXML.element.item_attr[0].Id}.jpg" 
  cnt="1" 
  v="0" 
 {else}

{assign var="cntx" value=0}

{foreach item=up key=k from=$usep}
 {foreach item=i from=$item.PreviewXML.element.item_attr}
 {if ($done == "0") && ($i.priority==$usep[$k])}
   {assign var="done" value="0"}
   {if $k == "0"}
   src="content/contentthumbs/{$i.Id}.jpg" 
   {/if}
   src{$k}="content/contentthumbs/{$i.Id}.jpg" 
   {assign var="cntx" value=$cntx+1} 
 {/if}
 {/foreach}
{/foreach}
cnt={$cntx} 
v=0 

 {/if}
/>
{else}
<img src="images/p{$usep[0]}.jpg" />
{/if}

