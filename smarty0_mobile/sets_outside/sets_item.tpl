
{if $item}

{global get="mediatype_vids" assign=mediatype_vids}
{global get="mediatype_pics" assign=mediatype_pics}
{global get="mediatype_caps" assign=mediatype_caps}

{if !(isset($usepriority))} {assign var="usepriority" value=13} {/if}

{if $root.page.tour.LinkThumb == "1"}
{capture assign="url"}{include file="$tourname/pg_tour.tpl" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}{/capture}
{/if}
{if $root.page.tour.LinkThumb == "2"}
{capture assign="url"}{$root.page.tour.JoinUrl}{/capture}
{/if}
{if $root.page.tour.LinkThumb == "0"}
{capture assign="url"}{include file="$tourname/pg_tour.tpl" id=$item.Id[0] seoname=$item.SEOname[0] item=$item}{/capture}
{/if}


<table class="content_wrapper">
<tr>
<td id="title_center">

<!--This displays the title for the content set-->
{$item.Title[0]}</div>


</td></tr>
<tr>
<td id="section_title">
{$templateconf.txtinsidethisupdate}

</td>
</tr>
<tr>
<td id="content_links">
<!--This displays the content links-->

	<!--This displays the content links-->

	{assign var="h" value="no"}
		{assign var="v" value="no"}
		{assign var="c" value="no"}
		{assign var="len" value=""}
		{foreach from=$item.PreviewXML.content.types.type_attr item="t"}
			{if $t.type =='highres'}
				{assign var="h" value=$t.num}
			{/if}
			{if $t.type =='vids'}
				{assign var="v" value=$t.num}
			{/if}
			{if $t.type =='caps'}
				{assign var="c" value=1}
			{/if}
		{/foreach}


				{if isset($h) && $h!='no'}
				<a class="content-links" href="{$url}">
				{$templateconf.txtPhotos}</a>
				{/if}
				
				{if isset($c) && isset($h) && $c!="no" && $h!="no"} &nbsp;|&nbsp; {/if}
				
				{if isset($c) && $c!='no'}
				<a class="content-links" href="{$url}">
				{$templateconf.txtvidcaps}</a>
				{/if}
				
				
				{if (isset($c) && isset($v) && $c!="no" && $v!="no") || (isset($v) && isset($h) && $v!="no" && $h!="no")} &nbsp;|&nbsp; {/if}
				{if isset($v) && $v!='no'}
				<a class="content-links" href="{$url}">
				{$templateconf.txtMovies}
				</a>
				{/if}

</td>

<tr><td>

		<!--This displays a thumbnail for the content set-->
<a href="{$url}">
{include file="$spath/general/stdimage.tpl" item=$item usepriority=$usepriority alt="" class="thumbs"}
</a>

</td>
</tr>

<tr>
<td class="info">


<table>
<tr>
<td colspan="2">
<!--Site Name-->
{include file="$spath/$tourname/sitelink.tpl" item=$item nolink=1}

									
</td>
</tr>

<tr>

<td>
<!--Date-->
{$templateconf.txtadded}&nbsp;{$item.DateDisplay[0]}
</td>

<td>
<!--Rating-->

	{if isset($item.plg_ratings_rank[0]) && $item.plg_ratings_rank[0]!=''} {assign var="el1" value=$item.plg_ratings_rank[0]} {else} {assign var="el1" value=0} {/if}
				{if isset($item.plg_ratings_total[0]) && $item.plg_ratings_total[0]!=''} {assign var="el2" value=$item.plg_ratings_total[0]} {else} {assign var="el2" value=1} {/if}
				{math equation="round((el1/el2)*10)" el1=$el1 el2=$el2 assign=rating}
				{include file="$spath/general/votefrm_model.tpl" rating=$rating hover=0}

</td>
</tr>


<tr>
<td colspan="2">



<!--Photo Count/Movie Length-->
	
		
		{if isset($v) && $v!='no'}
			{foreach from=$item.PreviewXML.content.names.name_attr item="n"}
				{if isset($n.movie_length) && !$len }
					{assign var="len" value=$n.movie_length}
				{/if}
			{/foreach}
		{/if}
		{if isset($h) && isset($v) && $h!="no" && $v!="no"}
			{strip}
			{$h}&nbsp;{$templateconf.txtphotos}.

			 {if $len}
             &nbsp;
			 {include file="$spath/general/display_movielength.tpl" length=$len }
			 {$templateconf.txtofvideo}.
			 {/if}
			{/strip}
		{elseif isset($h) &&  $h!="no"}	
			{$h}&nbsp; {$templateconf.txtphotos}.
		{elseif isset($v) && $v!="no" }
			{include file="$spath/general/display_movielength.tpl" length=$len }&nbsp;{$templateconf.txtofvideo}.
		{/if}


		</td>
		</tr>
<tr>
<td colspan="2">



		
		{assign var="count" value=0}
		{foreach from=$item.PreviewXML.sets.set item="setItem"}
		{if $setItem.Id[0] != $roots.page.models.model.Id[0]}
			{assign var="count" value=$count+1}
		{/if}
		{/foreach}
	
		{if $count >1}
	

{$templateconf.txtfeaturedmodels}&nbsp; 

	{foreach from=$item.PreviewXML.sets.set item="setItem"}
			{if $setItem.Id[0] != $roots.page.models.model.Id[0]}
				{assign var="count" value=$count-1}
				<a href="{include file="$spath/general/pg_sets.tpl" id=$setItem.Id[0] seoname=$setItem.SEOname[0] item=$setItem}">{$setItem.ModelName[0]}</a> 
				{if $count > 0}, {/if}	
			{/if}
			{/foreach}

	
</td>
		</tr>
<tr>
<td colspan="2">

{$templateconf.txtcategories}&nbsp;

	{assign var="count" value=0}
		{foreach from=$item.PreviewXML.category.item_attr item="catItem"}
		{foreach from=$root.page.categories.cat item="cat1"}
		{if $cat1.Title[0] == 'Tags'}
		{foreach from=$cat1.cats.cat item="cat2"}
			{if $cat2.Id[0] == $catItem.category}
				{assign var="count" value=$count+1}
			{/if}
		{/foreach}
		{/if}
		{/foreach}
		{/foreach}
		
		{foreach from=$item.PreviewXML.category.item_attr item="catItem"}
		{foreach from=$root.page.categories.cat item="cat1"}
		{if $cat1.Title[0] == 'Tags'}
		{foreach from=$cat1.cats.cat item="cat2"}
			{if $cat2.Id[0] == $catItem.category}{assign var="count" value=$count-1}<a href="{include file="$spath/general/pg_category.tpl" id=$catItem.category seoname=$catItem.seoname item=$catItem}">{$cat2.Title[0]}</a>{if $count > 0}, {/if}{/if}
		{/foreach}
		{/if}
		{/foreach}
		{/foreach}

		{/if}

	</td>
		</tr>


		</table>

		</td>
		</tr>
		</table>

<br />


{/if}
