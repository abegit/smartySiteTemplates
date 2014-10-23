<a name="poll"></a>

<table class="content_wrapper poll">
<tr>
<td id="title">
{$templateconf.txtthisweekspoll}
</td>
</tr>
<tr>
<td>

<form method="POST" action="pollvote.php">
{foreach from=$root.page.polls.poll.questions.question item="question" key='qKey'}



<table align="center" width="100%" cellspacing="2" cellpadding="2" border="0">
<tr>
	<td align="left">
	
			<span class="poll_title"><b>{$question.attributes.Question[0]}</b></span></td>
</tr>
</table>
	<hr class="hr" />
	{if $root.page.polls.poll.questions.question_attr[$qKey].voted == 1 || !$root.has_username} 
		<div class="pollresults" align="left">{$templateconf.txtpollresults}</div>

		  {foreach from=$question.answers.answer item="answer" }
			<table class="bar" border="0" cellpadding="0" cellspacing="0" width="98%" align="center">
			    <caption class="barAnswer">{$answer.Answer[0]}</caption><tr>	
				{assign var="sum" value=0}
				{foreach from=$question.answers.answer item="sumA"}
					{math equation="el1+el2" el1=$sum el2=$sumA.NumAnswers[0] assign=sum} 
				{/foreach}
				{math equation="floor((el1/max(1,el2))*100)" el1=$answer.NumAnswers[0] el2=$sum assign="width"}
				<td style="width:{$width}%;" class="barColor">&nbsp;</td>
		      		<td nowrap="nowrap" class="barPercent" align="left">
					<b>{$width}% </b>

					<span class="barVotes">({$answer.NumAnswers[0]}&nbsp;votes)</span>
					</td>
		       	</tr>

			</table>
		{/foreach}
	
		<table align="center" width="100%" cellspacing="2" cellpadding="2" border="0">
		<tr>
			<td align="right" class="totalVotes"><span class="poll_votes">{$sum}&nbsp;{$templateconf.txttotalvotes}</span>
		</td>
		</tr>
		</table>
	{else}	
		<div class="pollanswers_wrapper">
	
			{if $question.attributes.AnswerType[0] == "select"}
				<div>
				<select name="answer{$question.attributes.Id[0]}">
				 {foreach from=$question.answers.answer item="answer" }
					<option value="{$answer.Id[0]}">{$answer.Answer[0]}</option>
				 {/foreach}
				</select>
				</div>
			{else}
				 {foreach from=$question.answers.answer item="answer" }
				 <label for="answer_id_{$answer.Id[0]}">
				 <div class="pollanswers">
				 	<div class="poll_radio">
					{if $item.questions.question_attr[$qKey].voted == 1 } 
						{$answer.NumAnswers[0]}&nbsp;{$templateconf.txtvotes}
					{else}
						<input name="answer{$question.attributes.Id[0]}" type="radio" id="answer_id_{$answer.Id[0]}" value="{$answer.Id[0]}" />
					{/if}
				 	</div>
					<div class="poll_answer">{$answer.Answer[0]}</div>
				 </div>
				 </label>
				 {/foreach}
			{/if}
		</div>
		
		<input type="hidden" name="question[]" value="{$question.attributes.Id[0]}" />
	{/if}
{/foreach}


{foreach from=$root.page.polls.poll.questions.question_attr item="qa" }
	{if $qa.voted == 0}
		{assign var="votedNo" value=1}
	{/if}
{/foreach}

{if $votedNo}
	<table width="90%" cellspacing="2" cellpadding="2" border="0">
	<tr>
		<td align="left"><br /><input type="submit" value="{$templateconf.txtsubmitvote}" /></td>
	</tr>
	</table>
{/if}

<input type="hidden" name="postback" value="./#poll" />
</form>



</td>
</tr>


</table>


