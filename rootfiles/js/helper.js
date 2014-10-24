
function CreateBookmarkLink() 
{
	 title = document.title; 
	 url = location.href;

	 if (window.sidebar) 
	 { 
		window.sidebar.addPanel(title, url,"");
	 } 
     else if( window.external ) 
	 {
		window.external.AddFavorite( url, title); 
	 }
	 else if(window.opera && window.print) 
	 {
		alert("Your browser does not support adding bookmarks by clicking web links.  Please bookmark this link manually.")
		return true; 
	 }
}


var fukkMEtwice = jQuery.noConflict();

this.imagePreview = function(){	
	/* CONFIG */
		
		c_top = "";
		c_left = "";
		c_right = "";
		c_bottom = "";

		currelem = null;

		t_width = 0;

		timeoutId1 = null;
		timeoutId2 = null;
	
		touchart = 0;


		var ua = navigator.userAgent;
		var isiPad = /iPad/i.test(ua) || /iPhone OS 3_1_2/i.test(ua) || /iPhone OS 3_2_2/i.test(ua);


		var fingerC = 0;


	// If we're on an iDevice, don't go to the URL directly,
	// and rely on double-tap in order to follow through.
	fukkMEtwice(".elevpreview").bind("click", (function(e){

		return (isiPad) ? false : true;

	}));


	// If anywhere on the screen is touched
	// it should close any popup windows as long as
	// The element touched isn't part of .elevpreview

	fukkMEtwice("body").bind("touchstart", (function(e){

		if (touchart == 0)
		{
			if (timeoutId1 != null)
			{
				currelem = null;
				window.clearTimeout(timeoutId1);  
			}

			if (timeoutId2 != null)
			{
				hoverout(this);
				window.clearTimeout(timeoutId2);
			}
		}
		touchart = 0;
	}));

	// This handles what happens when clicking on the preview element
	// on an iDevice

	fukkMEtwice(".elevpreview").bind("touchstart", (function(e){

		touchart = 1;
		fingerC = event.touches.length;

		if (fingerC == 1)
		{
			if (timeoutId2 != null)
			{
				hoverout(this);
			}
	
			window.clearTimeout(timeoutId1);  
			window.clearTimeout(timeoutId2);


			event.preventDefault();
	
		  	if (currelem == fukkMEtwice(this).attr("tooltip") )
			{
				document.location = fukkMEtwice(this).attr("href");
			}
			else
			{
				onhover(e, this);
			}
		}

	}));

	/* END CONFIG */
	fukkMEtwice(".elevpreview").bind("touchcancel", (function(e){

		event.preventDefault();
		timeoutId1 = window.setTimeout(clearcurrelem, 300, true);
		timeoutId2 = window.setTimeout(clearhover, 5000, true);

		return false;
	}));


	fukkMEtwice(".elevpreview").bind("touchend", (function(e){

			if (event.touches.length == 0)
			{
				event.preventDefault();
				timeoutId1 = window.setTimeout(clearcurrelem, 300, true);
				timeoutId2 = window.setTimeout(clearhover, 5000, true);
			}
	}));

	function clearcurrelem()
	{
		currelem = null;
	}

	function clearhover()
	{
		hoverout(this);
	}


	function onhover(e, ths)
	{
		ths.t = ths.title;
		ths.title = "";

		var txn = fukkMEtwice(ths).attr('tooltip')

		if (fukkMEtwice(ths).attr('offset_top'))
		{
			c_top = parseInt(fukkMEtwice(ths).attr('offset_top'))
		}

		if (fukkMEtwice(ths).attr('offset_bottom'))
		{
			c_bottom = parseInt(fukkMEtwice(ths).attr('offset_bottom'))
		}

		if (fukkMEtwice(ths).attr('offset_left'))
		{
			c_left = parseInt(fukkMEtwice(ths).attr('offset_left'))
		}

		if (fukkMEtwice(ths).attr('offset_right'))
		{
			c_right = parseInt(fukkMEtwice(ths).attr('offset_right'))
		}

		if (fukkMEtwice(ths).attr('tooltip_width'))
		{
			t_width = parseInt(fukkMEtwice(ths).attr('tooltip_width'))
		}
		else
		{
			t_width = fukkMEtwice("#preview").width();
		}

		var txt = "<p id='preview'>" + fukkMEtwice("#"+txn).html() + "</p>"

		fukkMEtwice("body").append(txt);						 

		position = fukkMEtwice(ths).position();
		pageY = position.top;
		pageX = position.left;

		if (c_bottom != "")
			fukkMEtwice("#preview").css("top",(pageY + c_bottom) + "px");

		if (c_right != "")
			fukkMEtwice("#preview").css("left",(pageX + c_right) + "px");

		if (c_left != "")
			fukkMEtwice("#preview").css("left",(pageX - c_left - t_width) + "px");

		if (c_top != "")
			fukkMEtwice("#preview").css("top",(pageY - c_top - fukkMEtwice("#preview").height()) + "px");

		if (t_width != 0)
		{
			fukkMEtwice("#preview").css("width", t_width + "px");
			fukkMEtwice("#preview").css("max-width", t_width + "px");
		}

		fukkMEtwice("#preview").animate({opacity: "0.8"}, 1);

		if (!isiPad)
		{
			fukkMEtwice(".tabletlink").css("display", "none");
		}

		fukkMEtwice("#preview").fadeIn("fast");

		currelem = fukkMEtwice(ths).attr("tooltip")
	}

	function hoverout(ths)
	{
		ths.title = ths.t;	
		fukkMEtwice("#preview").remove();
	}


	fukkMEtwice(".elevpreview").hover(function(e){
		onhover(e, this);
    },
	function(){
		hoverout(this);
    });	


};


var interv;
var ax = []
var idx = ""

this.stdthis = function(){

	cnt = fukkMEtwice('#'+idx).attr('cnt');
	v = fukkMEtwice('#'+idx).attr('v');
	v = parseInt(v);
	v = (v + 1) % cnt;

	sr = ax[v]

	fukkMEtwice('#'+idx).attr('v', v);
	fukkMEtwice('#'+idx).attr('src', sr);
}

this.StdImageHandler = function(){	

	imgs = [];

	fukkMEtwice(".stdimage").ready(function() {

		fukkMEtwice(".stdimage").each(function() {
	
			cnt = fukkMEtwice(this).attr('cnt')
	
			if (cnt < 2)
			{
				return;
			}
			
			for(c=0; c < cnt; c++)
			{
				itr = imgs.length;
				imgs[itr] = new Image;
				imgs[itr].src = fukkMEtwice(this).attr('src' + c)
			}
		});	

	});	
	

	fukkMEtwice(".stdimage").hover(function(e){
		cnt = fukkMEtwice(this).attr('cnt')
		idx = fukkMEtwice(this).attr('id')

		if (cnt < 2)
		{
			return;
		}

		v = fukkMEtwice(this).attr('v')
		v = parseInt(v);
		v = (v + 1) % cnt;

		ax = []
		for(c=0; c < cnt; c++)
		{
			ax[c] = fukkMEtwice(this).attr('src' + c)
		}

		fukkMEtwice(this).attr('v', v);
		fukkMEtwice(this).attr('src', ax[v])		

		interv = setInterval("this.stdthis()", 800);


	},
	function(e){
		cnt = fukkMEtwice(this).attr('cnt')
		
		if (cnt < 2)
		{
			return;
		}

		fukkMEtwice(this).attr('v' ,0);
		fukkMEtwice(this).attr('src', fukkMEtwice(this).attr('src0'))
		clearInterval(interv)
		interv = 0;
		idx = "";
    });
}




