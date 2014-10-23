{**
 The Item update element

  @param - $index: The index # of the item that should be shown (starting with 1)

**}
{strip}
{assign var="cnt" value="0"}
{assign var="show" value=0}
{assign var="type" value="movie"}
{assign var="item" value=$root.content.item}

{foreach from=$item item=n}
  {if $n.type == $type}
    {assign var="cnt" value=$cnt+1}

	{if $cnt == $index}
	  {foreach from=$n.files item=nn}
		{if $nn.name != "thumb"}
			{assign var="movie" value=$nn}
		{/if}
		{if $nn.name == "thumb"}
			{assign var="thumb" value=$nn}			
		{/if}
	  {/foreach}

      {assign var="show" value=1}

	  {if $movie.movie_ext == "flv" || $movie.movie_ext == "mp4" || $movie.movie_ext == "m4v"}

	<script>
	function loadplayer{$index}()
	{literal}{
		jwplayer("player{/literal}{$index}{literal}").setup({
		  {/literal}
		  file: "{$root.pathurl}/{$root.folder}{$movie.path}",
		  autostart: true,
		  width: {$movie.movie_width},
		  height: {$movie.movie_height}
		  {literal}
		});	
	}{/literal}
	</script>

	<div id="player{$index}">

	</div>

	{elseif $movie.movie_ext == "mpg"}

	<EMBED SRC="{$root.pathurl}/{$root.folder}{$movie.path}" 
		AUTOPLAY=true width="{$movie.movie_width}" height="{$movie.movie_height+16}" type="video/mpeg"></EMBED>

	{/if}



	{/if}
  {/if}
{/foreach}
{if $show == 0}&nbsp;{/if}
{/strip}