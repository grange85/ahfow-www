---
layout: default
title: Search results
---
<form>
  <div class="form-group">
    <label for="searchInput"><h2>Search</h2></label>
    <small id="searchHelp" class="form-text text-muted">just type in the box and the results will be shown below.</small>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
  <input  class="form-control form-control-lg" type="text" class="form-control" id="searchInput" placeholder="Search terms" aria-describedby="searchHelp">
</div>
  </div>
</form>


<ul id="searchResults" class="list-group list-group-flush"></ul>

If you've not found what you think you should have you can [use Google to search A Head Full of Wishes](https://cse.google.com/cse?cx=017452044498352075094:-vuzx4-btdw).

<form onsubmit="event.preventDefault();document.location.href='https://www.google.com/search?q=site%3Awww.fullofwishes.co.uk%20'+document.getElementById('q').value;">
  <div class="form-group">
    <label for="GsearchInput"><h2>Search via Google</h2></label>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
  <input  class="form-control form-control-lg" type="text" class="form-control" id="q" placeholder="Search AHFoW via Google" aria-describedby="GsearchHelp">
    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Search</button>
</div>
  </div>
</form>


