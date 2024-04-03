document.addEventListener('DOMContentLoaded', function(){
  document.forms["gsearch"].addEventListener('submit', function(event) {
	event.preventDefault();
    document.location.href='https://www.google.com/search?q=site%3Awww.fullofwishes.co.uk%20'+document.getElementById('q').value;
	});
});
