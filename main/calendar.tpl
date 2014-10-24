{strip}
{if isset($root.page.calendar.event)}
	{assign var="seokey"  value=$root.page.calendar.event[0].SEOkey[0]}
	{assign var="seodesc" value=$root.page.calendar.event[0].SEOdesc[0]}
{/if}
{/strip}
{include file='general/page_top.tpl' pagename="" item='calendar' title = $templateconf.titletxtcalendar seokey=$seokey seodesc=$seodesc}
{global get="image_folder" assign="image_folder"}

{assign var="cdir" value=#contentdir#}

<div class="wrapper" align="center">

<!--Header-->
{include file="$spath/general/header.tpl"}


<!--Top Navbar-->
<div class="nav_fixed_width">{include file="$spath/general/topnav.tpl"}</div>



<!--Title Bar-->
<div class="title_bar_center">{$templateconf.txtcalendar}</div>


<table bgcolor="#c0c0c0" width="100%" cellspacing="2" cellpadding="1" border="0">
<tr>
<td class="calendarmonth" align="center" colspan="7">

<table width="50%" cellspacing="2" cellpadding="2" border="0">
<tr>
<td align="left"><a href="{include file="$spath/general/pg_calendar.tpl" month=$root.page.calendar.prevmonth_attr[0].month year=$root.page.calendar.prevmonth_attr[0].year}" class="content-link3">
&#171;
{$templateconf.txtlastmonth}</a></td>
	<td align="center" class="calendarmonth">{$root.page.calendar.month_attr[0].monthname}&nbsp;{$root.page.calendar.month_attr[0].year}
	</td>
	<td align="right"><a href="{include file="$spath/general/pg_calendar.tpl" month=$root.page.calendar.nextmonth_attr[0].month year=$root.page.calendar.nextmonth_attr[0].year}" class="content-link3">
{$templateconf.txtnextmonth}&#187;</a></td>
</tr>
</table>


</td>
</tr>

{if isset($root.page.calendar.event)}
	<tr>
	<td style="padding:6px;" width="100%" colspan="7" class="calendarinfo" align="center">


<a href="{include file="$spath/general/pg_calendar.tpl" month=$root.page.calendar.event_attr[0].month year=$root.page.calendar.event_attr[0].year}" class="content-link3">&#171;
	<b>{$templateconf.txtreturntocalendar}</b></a>
<p>
	<b>{$templateconf.txttitle}</b>&nbsp;{$root.page.calendar.event[0].Name[0]}

</p>
	<b>{$templateconf.txtdate}</b> &nbsp;{$root.page.calendar.event_attr.monthname}&nbsp;{$root.page.calendar.event_attr[0].day},{$root.page.calendar.event_attr[0].year} 
<p>
	{$root.page.calendar.event[0].Descr[0]}
</p>


	</td>
	</tr>
{else}

	<tr>
	<td width="15%" class="calendarheading" align="center">{$templateconf.txtsunday}</td>
	<td width="14%"  class="calendarheading" align="center">{$templateconf.txtmonday}</td>
	<td width="14%"  class="calendarheading" align="center">{$templateconf.txttuesday}</td>
	<td width="14%"  class="calendarheading" align="center">{$templateconf.txtwednesday}</td>
	<td width="14%"  class="calendarheading" align="center">{$templateconf.txtthursday}</td>
	<td width="14%"  class="calendarheading" align="center">{$templateconf.txtfriday}</td>
	<td width="15%"  class="calendarheading" align="center">{$templateconf.txtsaturday}</td>
	</tr>
	
	{foreach from=$root.page.calendar.month.week item="week" key="weekKey"}
	<tr>
	  {foreach from=$week.day_attr item="dayAttr"}
	    <td class="calendarday" align="right">
		{if $dayAttr.month == $root.page.calendar.month_attr[0].month}
			{$dayAttr.day}
		{else}
			&nbsp;
		{/if}
		</td>
	  {/foreach}
	</tr>
	<tr>
	  {foreach from=$week.day item="day"}
	    <td class="calendarinfo">
	
	       {if isset($day.events)}
	        {foreach from=$day.events.event item="event"}
			<a class="update_title" href="{include file="$spath/general/pg_calendar.tpl" id=$event.Id seoname=$event.SEOname}">{$event.Name}</a><br />
	        {/foreach}
	       {/if}

	       {if isset($day.sets)}
		{foreach from=$day.sets.item item="setItem"}
				
				<div id="rollover_{$setItem.Id[0]}" class="calendarpopup">
				<table>
				 <tr>
				  <td valign="top">
					{include file="$spath/general/stdimage.tpl" item=$setItem usepriority="14" alt="" class="thumbs"}
				  </td>
				  <td valign="top" align="left" class="calendar_description">
				  <p class="calendar_event_title">{$setItem.Title[0]}</p>
				  <p>{$setItem.Description[0]}</p>
				  {if $setItem.released[0]==0}
						{$templateconf.txtcoming}&nbsp;{$setItem.DateDisplay[0]}
				  {/if}
				  </td>
				 </tr>
				</table>
				</div>

				<a class="update_title" popid="rollover_{$setItem.Id[0]}"
				{if $setItem.released[0] == 1}
					{** Check for highres or vids present in the set **}
					{assign var="h" value=""}
					{assign var="v" value=""}
					{foreach from=$setItem.PreviewXML.content.types.type_attr item="settypeA"}
						{if $settypeA.type == 'highres'}
							{assign var="h" value="1"}
						{/if}
						{if $settypeA.type == 'vids'}
							{assign var="v" value="1"}
						{/if}
						{assign var="genType" value=$settypeA.type}	
					{/foreach}
			
					{if $h==1 && $v==1}href="{include file="general/pg_gallery.tpl" type="vids" id=$setItem.Id[0] seoname=$setItem.SEOname[0] item=$setItem}"
					{elseif $h ==1}href="{include file="general/pg_gallery.tpl" type="highres" id=$setItem.Id[0] seoname=$setItem.SEOname[0] item=$setItem}"
					{elseif $v ==1}href="{include file="general/pg_gallery.tpl" type="vids" id=$setItem.Id[0] seoname=$setItem.SEOname[0] item=$setItem}"
					{else}href="{include file="general/pg_gallery.tpl" type=$genType id=$setItem.Id[0] seoname=$setItem.SEOname[0] item=$setItem}"
					{/if}
				
				{/if}>
				{assign var="gosite" value=0}
				 {foreach from=$root.page.sites.site item="tmpSite"}
					{if $tmpSite.Id[0] == $root.page.sites_attr[0].id && $tmpSite.LimitToSite[0] == 0 && $gosite==0}
						{assign var="gosite" value=1}
					{/if}
					
				 {/foreach}	
				{if isset($gosite) && $gosite == 1}
					{foreach from=$root.page.sites.site item=s}
					{if $s.Id[0] == $setItem.PreviewXML.sites.item_attr[0].siteid}
						{$setItem.Title[0]}
					{/if}
					{/foreach}
				{else}
					{$setItem.Title[0]}			
				{/if}
				</a><br />	
		{/foreach} {**End froeach set**}
		 {/if} 

	
		</td>
	 {/foreach} {** End foreach day **}
	</tr>
	{/foreach} {** End foreach week **}
{/if}
</table>
</td>

			</tr>

</table>




</div>

<!--Footer-->
<div class="footer_fixed_width">{include file="$spath/general/page_bottom.tpl"}</div>
