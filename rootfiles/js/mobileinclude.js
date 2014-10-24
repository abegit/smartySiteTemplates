// This piece of code will go through every parent element pnode
// And make sure all of the children cnode on the same row are the same height.

ftime = 0;
items_height = []
old_numcols = -1;

function ResizeHeight(pnode, cnode)
{
    var maxheight = 0;
    new_numcols = 0;
    
    stor = []

	var rownum = 0;
    var last_toppos = -1;
    
    // The first time this is run, get the height of everything.
    
    if (ftime == 0)
    {
	    $(pnode).each(function() {
			items_height[items_height.length] = $(this).find(cnode).height();
		});
    }
    
    // Loop through each element, get the maximum height for each row.
    // If there hasn't been a reflow, return.
    
    $(pnode).each(function(index) {

		hdth = items_height[index]

    	this_toppos = $(this).position().top
		if (this_toppos != last_toppos)
		{
			rownum++;
			maxheight = hdth;			
		}
		
		if (rownum == 1) { new_numcols++; }
		if (rownum > 1 && new_numcols == old_numcols) { return; }

		maxheight = Math.max(maxheight, hdth);
		stor[rownum] = maxheight
		last_toppos = this_toppos
    });
   
	if (new_numcols == old_numcols) { return; }
	
	// Set the new height for each row.
   
	var rownum = 0;
    var last_toppos = -1;
    
    $(pnode).each(function() {

    	this_toppos = $(this).position().top
		if (this_toppos != last_toppos) { rownum++; }
				
		$(this).find(cnode).css({'height': (stor[rownum]) + "px"});
		last_toppos = this_toppos
    });

	old_numcols = new_numcols;

	stor = []
}

