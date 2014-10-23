<!--Model A-Z Links-->

<div id="model_a-z-links">
{$templateconf.txtbrowsemodels}


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


{strip}
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
{/strip}


</div>