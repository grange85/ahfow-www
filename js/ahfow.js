$(document).ready(function() {


	/* fix old posts for bootstrap 4 */
	$("article img").each(function(index){
		if(!$(this).hasClass('img-fluid')){
		  $(this).addClass('img-fluid');
		}
	});

	$("article iframe").each(function(index){
	if(!$(this).parent('figure').length && !$(this).hasClass('bandcamp')){
	  $(this).wrap('<figure class="figure embed-responsive"></figure>');
		if(!$(this).hasClass('embed-responsive-item')){
		  $(this).addClass('embed-responsive-item');
		 }
	 } else {
	   if (!$(this).parent().hasClass('figure') && !$(this).hasClass('bandcamp')){
	   	$(this).parent().addClass('figure embed-responsive');
	   	$(this).addClass('embed-responsive-item');
	   }
	 }
	});

	$('article a[href^="http://"],article a[href^="https://"]')
    	.not('a:has(img)')
    	.not('article a[href*="fullofwishes\.co\.uk"]')
    	.not('article a[href*="web\.archive\.org"]')
    	.not('article a[data-linktype="background-image-link"]')
    	.not('.resp-sharing-button__link')
        .attr({'target': '_blank', 'title': 'external link - opens in a new tab or window'})
        .append(' <sup><i class="bi bi-arrow-up-right-circle-fill"></i></sup>');



	$('article a[href^="http://web\.archive\.org"],article a[href^="https://web\.archive\.org"]')
    	.not('a:has(img)')
        .attr({'target': '_blank', 'title': 'internet archive wayback machine link - opens in a new tab or window'})
        .append(' <sup><i class="bi bi-arrow-left-circle-fill"></i></sup>');
});
