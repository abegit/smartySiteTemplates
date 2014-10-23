{strip}
{assign var="tcnt" value="0"}
{foreach from=$root.page.content.item item="item" key="k" }
	{foreach from=$item.Files.file_attr item="fattr" }
		{foreach from=$root.page.contenttypesub.type item="cttype"}
			{if ($fattr.name == $cttype.Name[0]) && ($root.page.settype[0] == $cttype.Type[0]) && ($cttype.FullVideo[0] == "0") && ($c!=$k)}
				{assign var="c" value=$k}
                {if ($k+1)>=$startpos && ($k+1)<$endpos}
					{assign var="tcnt" value=$tcnt+1}
	
					{if $id == $item.Id[0]}
					Clip #{$tcnt}
					{/if}
                {/if}
            {/if}
		{/foreach}
	{/foreach}
{/foreach}
{/strip}