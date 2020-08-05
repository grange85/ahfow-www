$(document).ready(function() {
	$("article img").addClass("img-responsive");


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
