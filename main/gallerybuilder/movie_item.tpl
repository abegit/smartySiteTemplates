{**
 The Item update element

  @param - $index: The index # of the item that should be shown (starting with 1)

**}

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

	<a id="vid_{$index}"
		videourl="{$root.pathurl}/{$root.folder}{$movie.path}"
		movie_width="{$movie.movie_width}"
		movie_height="{$movie.movie_height}"
		href="#?custom=true&amp;width={$movie.movie_width}&amp;height={$movie.movie_height}"
		rel="prettyVideo">
		<img class="thumb" id="vid_{$index}_thumb" src=".{$thumb.path}" /></a>
	{else}

	  <a style="font-family:arial;font-size:11px;color:#FFD353;" href="{$root.pathurl}/{$root.folder}{$movie.path}">
	  <img class="thumb" src=".{$thumb.path}" /></a>
	{/if}

	{/if}
  {/if}
{/foreach}
{if $show == 0}&nbsp;{/if}
