$(document).ready(function() {


	/* fix old posts for bootstrap 4 */
	$("article img").each(function(index){
		if(!$(this).hasClass('img-fluid')){
		  $(this).addClass('img-fluid');
		}
	});

	$("article iframe").each(function(index){
	if(!$(this).parent('figure').length && !$(this).hasClass('bandcamp')){
	  $(this).wrap('<figure class="figure embed-responsive embed-responsive-16by9"></figure>');
		if(!$(this).hasClass('embed-responsive-item')){
		  $(this).addClass('embed-responsive-item');
		 }
	 } else {
	   if (!$(this).parent().hasClass('figure') && !$(this).hasClass('bandcamp')){
	   	$(this).parent().addClass('figure embed-responsive embed-responsive-16by9');
	   	$(this).addClass('embed-responsive-item');
	   }
	 }
	});

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
