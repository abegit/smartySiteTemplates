{global get="image_folder" assign="image_folder"}
<script>
{literal}

$().ready(function()
{
    $("#autosuggest").autocomplete({
      source: function(req, add){
		$.get('search_ajax.php?q=' + req.term, function(data) {

			arrStor = [];

			arrLabel = new Array();
			arrURL   = new Array();
			var arg= data.split("\n");

			for(var i=0; i < arg.length; i++)
			{
				ix = arg[i].split("|");

				if (ix.length == 2)
				{
					arrStor[arrStor.length] = {label:ix[0].trim(), value:ix[1].trim()}
				}
				
				if (arrStor.length >= 15) break;
			}

			add(arrStor);
		});
      }
    });


});
{/literal}
</script>


<!--Start Search Form-->
{strip}
<form id="searchform" action="search.php" method="get" style="margin-top:0px;">

<div>
<input id="autosuggest" autocomplete="off" class="input" placeholder="Search for 'Amor' or 'Sienna'... " name="query" value="{$root.page.info.query[0]|@htmlentities:0:"utf-8"}" />

{if $cms_pro}
<a class="link_light" style="display:none;" href="advancedsearch.php">{$templateconf.titletxtadvancedsearch}</a>
{/if}
<button class="search_image"  type="submit"/><i class="bono-magnifier"></i></button>


</div>
</form>
{/strip}
<!--End Search Form-->

