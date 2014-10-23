{**
* This is the play movie file
* @paramm $src - the source of the movie
* @param $width- the width of the movie
* @param $height - the height of the movie 
*}
{assign var="height" value=$height+75}
<noscript id="nomansland">
<object classid='CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95' 
	codebase='http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701'
	standby='Loading Microsoft Windows Media Player components...' 
	type='application/x-oleobject' width={$width} height={$height}>
	<param name='fileName' value="{$src}"/>
	<param name='animationatStart' value='true' />
	<param name='transparentatStart' value='true' />
	<param name='autoStart' value="true" />
	<param name='showControls' value="true" />
	<param name="ShowStatusBar" value="true" />
	<param name='loop' value="0" />
	<embed type='application/x-mplayer2' 
	pluginspage='http://microsoft.com/windows/mediaplayer/en/download/'
	autostart="1" 
	displaysize='4' 
	autosize='0'
	bgcolor='black' 
	showcontrols="1" 
	showtracker='1'
	showstatusbar='1'
	showdisplay='0' 
	videoborder3d='0'  
	designtimesp='5311'
	loop="0" width={$width} height={$height} src={$src}>
	</embed>
	</object>  
	</noscript>
<div id="mediabox" align="center"></div>