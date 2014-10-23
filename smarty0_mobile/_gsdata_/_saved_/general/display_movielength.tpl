{**
Display MoviewLenght file
@param lenght 
**}
{if $length}
	{math equation="floor(el)" el=$length assign="flen"} 
	
	{if ($flen<60) }{$flen}&nbsp;{$templateconf.txtseconds}
	{else}
		{math equation="floor(el/60)" el=$flen assign="fl"}
		{$fl}&nbsp;{$templateconf.txtminutes}{if ($flen mod 60)!= 0}{math equation="floor(el % 60)" el=$flen assign="s"}, {$s}&nbsp;{$templateconf.txtseconds}{/if}
	{/if}
{/if}