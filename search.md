---
layout: page
title: Search
custom_js:
 - simple-jekyll-search.min
---
<form>
  <div class="form-group">
    <label for="searchInput"><h3>Search (posts only)</h3></label>
    <small id="searchHelp" class="form-text text-muted">just type in the box and the results will be shown below.</small>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
  <input  class="form-control form-control-lg" type="text" class="form-control" id="searchInput" placeholder="Search terms" aria-describedby="searchHelp">
</div>
  </div>
</form>


<ul id="searchResults" class="list-group list-group-flush"></ul>


<form onsubmit="event.preventDefault();document.location.href='https://www.google.com/search?q=site%3Awww.fullofwishes.co.uk%20'+document.getElementById('q').value;">
  <div class="form-group">
    <label for="GsearchInput"><h3> Full site search via Google</h3></label>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
  <input  class="form-control form-control-lg" type="text" class="form-control" id="q" placeholder="Search AHFoW via Google" aria-describedby="GsearchHelp">
    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Search</button>
</div>
  </div>
</form>

<script src="/js/simple-jekyll-search.min.js?202312240956"></script>
<script>
var sjs = SimpleJekyllSearch({
  searchInput: document.getElementById('searchInput'),
  resultsContainer: document.getElementById('searchResults'),
  json: '/search-min.json',
  searchResultTemplate: '<li class="list-group-item"><a href="https://www.fullofwishes.co.uk{url}">{series-title}{title}</a></li>',
  limit: 30
})
</script>
