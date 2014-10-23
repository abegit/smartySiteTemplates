{strip}
{if $item.wc_id[0]}
 {capture assign="content"}content/webmastercentral_{$item.wc_id[0]}/{$priority}.jpg{/capture}
{else}
 {capture assign="content"}content/{$item.Directory[0]}/{$priority}.jpg{/capture}
{/if}

<img src="{$content}" {if $width}width="{$width}"{/if} {if $height}height="{$height}"{/if} {if $class}class="{$class}"{/if} {if $style}style="{$style}"{/if} />
{/strip}