---
layout: default
title: All categories
---
<h2>Categories</h2>
<ul class="list-group">
	{% assign thecategories = site.categories | sort %}
	{% for category in thecategories %}
		<li class="list-group-item"><a href="{{ category | first | slugify | prepend: '/category/' }}">{{ category | first }}</a> ({{ category | last | size }})</li>
	{% endfor %}
</ul>

<h2>Tags</h2>
<div class="row">
<ul class="d-flex flex-wrap list-group-horizontal">
	{% assign thetags = site.tags | sort %}
	{% for tag in thetags %}
    {% assign tagsize = tag | last | size %}
    {% if tagsize > 3 %}
		<li class="list-group-item"><a class="btn btn-light border border-primary rounded mb-2 me-2" href="{{ tag | first | slugify | prepend: '/tag/' }}">{{ tag | first }} <span class="badge text-bg-secondary">{{ tag | last | size }}</span></a></li>
    {% endif %}
	{% endfor %}
    </ul>
</div>
