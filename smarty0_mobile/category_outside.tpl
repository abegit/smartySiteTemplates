{**
 *The following choose/when statements display the page title based on the category title. 
 *In order for this to work, you must specify titles below that match your category titles exactly-->
**}


	{** Title assignment goes here.  Do not move this code **}

	{if ($root.page.category.Title[0]=='Movies')}
		{assign var="nav" value='movies'}	
	{elseif ($root.page.content_attr[0].contentasc == 1)}
		{assign var="nav" value='models'}
	{elseif ($root.page.category.Title[0] == 'Photos')}
		{assign var="nav" value='photos'}
	{else}
		{assign var="nav" value='n/a'}
	{/if}


{** all of this is nessesary to check for specific category **} 

{foreach from=$tags item="tag"}
	{if $tag.Id[0] == $root.page.category.Id[0] }
		{assign var="foundId" value=$tag.Title[0]}
	{/if}
{/foreach}

{if  isset($foundId) }
	{capture name="title"}{$foundId} {$templateconf.titletxttagindex}{/capture}
{elseif isset($root.page.category.Title[0]) && $root.page.category.Title[0] == 'Movies'}
	{capture name="title"}{$templateconf.titletxtmovieindex}{/capture}
{elseif $root.page.category.Title[0] == 'Photos'}
	{capture name="title"}{$templateconf.titletxtphotogalleryindex}{/capture}
{else}
	{capture name="title"}{$root.page.category.Title[0]}&nbsp;Index{/capture}
{/if}

{include file="$tourname/page_top.tpl" title=$smarty.capture.title}

{include file="$tourname/topnav.tpl" item=$nav}

	
<div id="section_title">


{if isset($foundId)}
{$templateconf.txtupdatesfeaturing}	{$foundId}
{elseif $root.page.category.Title[0] == 'Movies'}
	{$templateconf.titletxtmovieindex}
{elseif $root.page.category.Title[0] =='Models'}
	{$templateconf.titletxtmodels}
{else}
	{$templateconf.titletxtphotogalleryindex}
{/if}

	</div>



                {* Assigning the menu variables *}
                {assign var=mtitle value= $root.page.model_category_attr[0].name }
                {assign var=mvalue value=$root.page.model_category_attr[0].value }

                {foreach from=$categories item=cat}
                        {foreach from=$cat.cats.cat item=cat2 }
                                {assign var="tmp" value=$cat2.$mtitle }
                                {if $tmp[0] == $mvalue }
                                        {assign var="id_cat" value=$cat2.Id[0]}
                                {/if}
                        {/foreach}
                {/foreach}

{if $root.page.category.Title[0] =='Models'}

<div id="a_z_links">


{* Assigning the menu variables *}
{assign var=mvalue value=$root.page.model_category_attr[0].value }


{foreach from=$categories item=cat}
	{foreach from=$cat.cats.cat item=cat2 }
		{if ($cat2.Title[0] == $mvalue) || ($cat2.MainLanguage_Title[0] == $mvalue)}
			{assign var="id_cat" value=$cat2.Id[0]}
			{assign var="catnode" value=$cat2}
		{/if}
	{/foreach}
{/foreach}



  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="A" seoname=$catnode.SEOname[0] item=$catnode}">A</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="B" seoname=$catnode.SEOname[0] item=$catnode}">B</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="C" seoname=$catnode.SEOname[0] item=$catnode}">C</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="D" seoname=$catnode.SEOname[0] item=$catnode}">D</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="E" seoname=$catnode.SEOname[0] item=$catnode}">E</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="F" seoname=$catnode.SEOname[0] item=$catnode}">F</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="G" seoname=$catnode.SEOname[0] item=$catnode}">G</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="H" seoname=$catnode.SEOname[0] item=$catnode}">H</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="I" seoname=$catnode.SEOname[0] item=$catnode}">I</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="J" seoname=$catnode.SEOname[0] item=$catnode}">J</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="K" seoname=$catnode.SEOname[0] item=$catnode}">K</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="L" seoname=$catnode.SEOname[0] item=$catnode}">L</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="M" seoname=$catnode.SEOname[0] item=$catnode}">M</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="N" seoname=$catnode.SEOname[0] item=$catnode}">N</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="O" seoname=$catnode.SEOname[0] item=$catnode}">O</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="P" seoname=$catnode.SEOname[0] item=$catnode}">P</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="Q" seoname=$catnode.SEOname[0] item=$catnode}">Q</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="R" seoname=$catnode.SEOname[0] item=$catnode}">R</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="S" seoname=$catnode.SEOname[0] item=$catnode}">S</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="T" seoname=$catnode.SEOname[0] item=$catnode}">T</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="U" seoname=$catnode.SEOname[0] item=$catnode}">U</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="V" seoname=$catnode.SEOname[0] item=$catnode}">V</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="W" seoname=$catnode.SEOname[0] item=$catnode}">W</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="X" seoname=$catnode.SEOname[0] item=$catnode}">X</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="Y" seoname=$catnode.SEOname[0] item=$catnode}">Y</a>
  <a href="{include file="$spath/general/pg_category.tpl" id=$id_cat s="n" sw="Z" seoname=$catnode.SEOname[0] item=$catnode}">Z</a>



</div>
{/if}





<!--*****This displays the Page Navigation table-->
{if count($root.page.pages.page) >1 }
{include file="$spath/category_outside/pagenav.tpl"}
{/if}



<a {if $root.page.sort[0] == "d"} class="sort_link_current" {else} class="sort_link" {/if} href="{include file="$spath/general/pg_category.tpl" id=$root.page.category.Id[0] s="d" sw=$root.page.letter[0] page=1 seoname=$root.page.category.SEOname[0] item=$root.page.category}">{$templateconf.txtmostrecent}</a>

&nbsp;

<a {if $root.page.sort[0] == "p"} class="sort_link_current" {else} class="sort_link" {/if} href="{include file="$spath/general/pg_category.tpl" id=$root.page.category.Id[0] s="p" sw=$root.page.letter[0] page=1 seoname=$root.page.category.SEOname[0] item=$root.page.category}">{$templateconf.txtmostpopular}</a>

&nbsp;


<a {if $root.page.sort[0] == "n"} class="sort_link_current" {else} class="sort_link" {/if} href="{include file="$spath/general/pg_category.tpl" id=$root.page.category.Id[0] s="n" sw=$root.page.letter[0] page=1 seoname=$root.page.category.SEOname[0] item=$root.page.category}">{$templateconf.txtnametitle}</a>



<!--Start Category Item-->

<!--This tells the page the number of items to show per row-->
<div class="element_wrapper">
{foreach from=$root.page.content.item item="item" key="k"}
	<div class="element">
		{include file="$spath/category_outside/category_item.tpl" item=$item itemkey=$k cnt=$root.page.content.item|@count}
	</div>
{/foreach}
</div>

<!--*****This displays the Page Navigation table-->
{if count($root.page.pages.page) >1 }
	{include file="$spath/category_outside/pagenav.tpl"}
{/if}





{include file="$tourname/page_bottom.tpl" item=$nav}
