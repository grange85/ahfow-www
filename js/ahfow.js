$(document).ready(function() {


	/* fix old posts for bootstrap 4 */
	var elem_img = $("article img");
	if(!elem_img.hasClass('img-fluid')){
	  elem_img.addClass('img-fluid');
	 }

	var elem_iframe = $("article iframe");
	if(!elem_iframe.parent('figure').length){
	  elem_iframe.wrap('<figure class="figure embed-responsive embed-responsive-16by9"></figure>');
		if(!elem_iframe.hasClass('embed-responsive-item')){
		  elem_iframe.addClass('embed-responsive-item');
		 }
	 } else {
	   if (!elem_iframe.parent().hasClass('figure')){
	   	elem_iframe.parent().addClass('figure embed-responsive embed-responsive-16by9');
	   	elem_iframe.addClass('embed-responsive-item');
	   }
	 }



	$('article a[href^="http://"],article a[href^="https://"]')
    	.not('a:has(img)').not('article a[href*="fullofwishes\.co\.uk"]').not('.resp-sharing-button__link')
        .attr('target','_blank')
        .append(' <sup><i class="fas fa-external-link-alt initialism"></i></sup>');

/*
	$('article a[href*="fuzzywuzzy"]').each(function(){
		var thisurl = $(this).prop('href');
		$(this).prop('href', 'https://web.archive.org/web/2007+/' + thisurl);
		});
*/
});
