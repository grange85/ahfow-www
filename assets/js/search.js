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
