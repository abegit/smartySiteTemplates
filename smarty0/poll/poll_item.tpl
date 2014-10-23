{if isset($item) && $item!=""}

<div id="poll">

<form method="POST" action="pollvote.php">
{foreach from=$item.questions.question item="question" key='qKey'}
<table class="poll" align="center" width="100%" cellspacing="2" cellpadding="2" border="0">
<tr>
	<td align="left">
	
			<span class="section_title">{$templateconf.txtquestion}:</span><br>

			<span class="poll_title"><b>{$question.attributes.Question[0]}</b></span></td>
</tr>
</table>
	<hr class="poll_hr">
	{if $item.questions.question_attr[$qKey].voted == 1 } 

	<table class="poll" class="bar" border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
<tr><td class="section_title">
	{$templateconf.txtpollresults}
</td></tr>
<tr><td>
		  {foreach from=$question.answers.answer item="answer" }
<table width="100%">
<tr><td>	
			    <caption class="barAnswer">{$answer.Answer[0]}</caption><tr>	
				{assign var="sum" value=0}
				{foreach from=$question.answers.answer item="sumA"}
					{math equation="el1+el2" el1=$sum el2=$sumA.NumAnswers[0] assign=sum} 
				{/foreach}
				{if $sum < 1}
					{assign var="sum" value=1}
				{/if}

				{math equation="floor((el1/el2)*100)" el1=$answer.NumAnswers[0] el2=$sum assign="width"}
				<td style="width:{$width}%;" class="barColor">&nbsp;</td>
		      		<td nowrap="nowrap" class="barPercent" align="left">
					<b>{$width}% </b>
					<span class="barVotes">({$answer.NumAnswers[0]}&nbsp;votes)</span>
					</td>
		       	</tr>
	</table>

	
		{/foreach}
</td></tr>
<tr><td align="right">
<span class="poll_votes">{$sum}&nbsp;{$templateconf.txttotalvotes}</span>

			</td>
		       	</tr>

			</table>


	{else}

<table align="center" width="100%" cellspacing="2" cellpadding="2" border="0">

	{if $question.attributes.AnswerType[0] == "select"}
	  <tr>
		<td width="10" align="left">
		<select name="answer{$question.attributes.Id[0]}">
		 {foreach from=$question.answers.answer item="answer" }
			<option value="{$answer.Id[0]}">{$answer.Answer[0]}</option>
		 {/foreach}
		</select>
		</td>
	  </tr>
	{else}
	 {foreach from=$question.answers.answer item="answer" }
	  <tr>
		{if $item.questions.question_attr[$qKey].voted == 1 } 
		<td align="left">{$answer.NumAnswers[0]}&nbsp;{$templateconf.txtvotes}</td>
		{else}
		<td width="10" align="left"><input name="answer{$question.attributes.Id[0]}" type="radio" value="{$answer.Id[0]}" /></td>
		{/if}
		<td align="left"><span class="poll_answer">{$answer.Answer[0]}</span></td>
	  </tr>
	 {/foreach}
	{/if}
</table>

	  <input type="hidden" name="question[]" value="{$question.attributes.Id[0]}" />
	{/if}
{/foreach}


{foreach from=$item.questions.question_attr item="qa" }
	{if $qa.voted == 0}
		{assign var="votedNo" value=1}
	{/if}
{/foreach}
{if $votedNo}
{strip}
<table width="90%" cellspacing="2" cellpadding="2" border="0">
<tr>
	<td align="left">
	<input type="hidden" name="postback" value="poll.php?page={$root.page.onpage[0]}" />
	<input type="submit" value="{$templateconf.txtsubmitvote}" />
	</td>
</tr>
</table>
{/strip}
{/if}

</form>

</div>

{else}&nbsp

{/if}
