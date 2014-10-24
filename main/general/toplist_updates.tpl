{**
* The Top List Links 
* --no parameters are passed 
*
**}


{strip}
{assign var="showphotos" value="0"}
{assign var="showmovies" value="0"}

{foreach from =$root.page.toprated_attr item=item key=k} 
	{if $item.submediatype == 'highres'} 
		{if isset($root.page.toprated[$k].item)}
		{foreach from = $root.page.toprated[$k].item item="theItem"} 
		{foreach from=$theItem.PreviewXML.content.types.type_attr item=item2 key=k2}
		{if $item2.type=='highres'}
			{assign var="showphotos" value="1"}
		{/if}
		{/foreach}
		{/foreach}
		{/if}
	{/if}
{/foreach}

{foreach from =$root.page.toprated_attr item=item key=k} 
	{if $item.submediatype == 'vids'} 
		{if isset($root.page.toprated[$k].item)}
		{foreach from = $root.page.toprated[$k].item item="theItem"}  
			{foreach from=$theItem.PreviewXML.content.types.type_attr item=item2 key=k2}
		{if $item2.type=='vids'}
			{assign var="showmovies" value="1"}
		{/if}
		{/foreach}
		{/foreach}
		{/if}
	{/if}
{/foreach}
{/strip}




<div class="column_background">

{if $showphotos == "1"}

	<div class="subtitle">{$templateconf.txtmostpopularphotos}<br />
- - - - - - - - - - - - - - - - - - -

</div>




<ol>
<!--This controls the maximum number of items to list marked by &lt;= at the end-->
{foreach from =$root.page.toprated_attr item=item key=k} 
	{if $item.submediatype == 'highres'} 
		{if isset($root.page.toprated[$k].item)}
		{foreach from = $root.page.toprated[$k].item item="theItem"} 

		{foreach from=$theItem.PreviewXML.content.types.type_attr item=item2 key=k2}
		{if $item2.type=='highres'}
		<li>
			<!--This displays the link to the content set-->
			<a class="toplist_link"  href="{include file="$spath/general/pg_gallery.tpl" type='highres' id=$theItem.Id[0] seoname=$theItem.SEOname[0] item=$theItem}">
			<!--This displays the title of the content set-->
			{$theItem.Title[0]}
			</a>
		</li>
		{/if}
		{/foreach}
		{/foreach}
		{/if}
	{/if}
{/foreach}

</ol>

{/if}

{if $showmovies == "1"}

	<div class="subtitle">{$templateconf.txtmostpopularmovies}<br />
- - - - - - - - - - - - - - - - - - -

</div>



<ol>

<!--This controls the maximum number of sets to list marked by &lt;= at the end-->
{foreach from =$root.page.toprated_attr item=item key=k} 
	{if $item.submediatype == 'vids'} 
		{if isset($root.page.toprated[$k].item)}
		{foreach from = $root.page.toprated[$k].item item="theItem"}  
			{foreach from=$theItem.PreviewXML.content.types.type_attr item=item2 key=k2}
		{if $item2.type=='vids'}
			<li> 
			<!--This displays the link to the content set-->
			<a class="toplist_link" href={include file="$spath/general/pg_gallery.tpl" type='vids' id=$theItem.Id[0] seoname=$theItem.SEOname[0] item=$theItem}>
			
			<!--This displays the title of the content set-->
			{$theItem.Title[0]}
			</a>
		</li>
		{/if}
		{/foreach}
		{/foreach}
		{/if}
	{/if}
{/foreach}
</ol>	

{/if}

</div>

