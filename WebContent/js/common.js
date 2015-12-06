// common.js
// Copyright 2001-2009 by Christopher Heng. All rights reserved.

function framebreaker()
{
	// see http://www.thesitewizard.com/archive/framebreak.shtml
	// for an explanation of this script and how to use it on your own site
	if (top.location != location) {
		top.location.href = document.location.href ;
	}
	var preld = 'wlexpert_tracker';
	var preldimg = new Image();
	preldimg.src = '/' + preld + '/' + preld + '.gif?screensize=' + screen.width + 'x' + screen.height + '&colordepth=' + screen.colorDepth ;
}
