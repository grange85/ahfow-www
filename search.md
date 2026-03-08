---
layout: page
title: Search
custom_js:
 - ahfow-misc
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
  <div class="form-group">
    <label for="sectionFilter">Filter by section:</label>
    <select class="form-control" id="sectionFilter">
      <option value="">All sections</option>
      <option value="post">Posts</option>
      <option value="article">Articles</option>
      <option value="release">Releases</option>
      <option value="show">Shows</option>
      <option value="track">Tracks</option>
    </select>
  </div>
</form>


<ul id="searchResults" class="list-group list-group-flush"></ul>


<form id="gsearch">
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
let allResults = [];
let searchData = [];

// Load search data
fetch('/search-min.json')
  .then(response => response.json())
  .then(data => {
    searchData = data;
  });

function filterAndDisplay() {
  const searchTerm = document.getElementById('searchInput').value;
  const selectedSection = document.getElementById('sectionFilter').value;
  const resultsContainer = document.getElementById('searchResults');

  if (!searchTerm) {
    resultsContainer.innerHTML = '';
    return;
  }

  // Filter results by section if a section is selected
  let filtered = allResults;
  if (selectedSection) {
    filtered = allResults.filter(item => item.section === selectedSection);
  }

  resultsContainer.innerHTML = '';
  if (filtered.length === 0) {
    resultsContainer.innerHTML = '<li class="list-group-item">No results found</li>';
    return;
  }

  filtered.forEach(item => {
    resultsContainer.innerHTML += '<li class="list-group-item"><a href="https://www.fullofwishes.co.uk' + item.url + '">' + item.title + '</a></li>';
  });
}

var sjs = SimpleJekyllSearch({
  searchInput: document.getElementById('searchInput'),
  resultsContainer: document.getElementById('searchResults'),
  json: '/search-min.json',
  searchResultTemplate: '<li class="list-group-item"><a href="https://www.fullofwishes.co.uk{url}">{title}</a></li>',
  limit: 30,
  success: function() {
    // Override the search method to store results
    const originalSearch = this.search;
    this.search = function(query) {
      if (!query) {
        allResults = [];
      } else {
        allResults = searchData.filter(item => {
          const searchFields = item.title + ' ' + item.category + ' ' + item.tags;
          return searchFields.toLowerCase().includes(query.toLowerCase());
        });
      }
      filterAndDisplay();
    };
  }
});

document.getElementById('sectionFilter').addEventListener('change', filterAndDisplay);
</script>
