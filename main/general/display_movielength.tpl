{**
Display MoviewLenght file
@param lenght 
**}
{if $length}
	{math equation="floor(el)" el=$length assign="flen"} 
	
	{if ($flen<60) }{$flen}{$templateconf.txtseconds}
	{else}
		{math equation="floor(el/60)" el=$flen assign="fl"}
		{$fl}{$templateconf.txtminutes}{if ($flen % 60)!= 0}{math equation="floor(el % 60)" el=$flen assign="s"}{$s}&nbsp;{$templateconf.txtseconds}{/if}
	{/if}
{/if}
