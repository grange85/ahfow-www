let searchData = [];

// Load search data
fetch('/search-min.json')
  .then(response => response.json())
  .then(data => {
    searchData = data;
  });

function performSearch() {
  const searchTerm = document.getElementById('searchInput').value.toLowerCase();
  const selectedSection = document.getElementById('sectionFilter').value;
  const resultsContainer = document.getElementById('searchResults');

  if (!searchTerm) {
    resultsContainer.innerHTML = '';
    return;
  }

  // Search across title, category, and tags
  let results = searchData.filter(item => {
    const searchFields = (item.title + ' ' + item.category + ' ' + item.tags).toLowerCase();
    return searchFields.includes(searchTerm);
  });

  // Filter by section if selected
  if (selectedSection) {
    results = results.filter(item => item.section === selectedSection);
  }

  // Display results
  resultsContainer.innerHTML = '';
  if (results.length === 0) {
    resultsContainer.innerHTML = '<li class="list-group-item">No results found</li>';
    return;
  }

  results.slice(0, 30).forEach(item => {
    resultsContainer.innerHTML += '<li class="list-group-item"><a href="https://www.fullofwishes.co.uk' + item.url + '">' + item.title + '</a></li>';
  });
}

// Set up event listeners
document.getElementById('searchInput').addEventListener('input', performSearch);
document.getElementById('sectionFilter').addEventListener('change', performSearch);
