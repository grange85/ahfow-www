---
layout: default
title: All categories
---
<ul class="list-group">
	{% assign thecategories = site.categories | sort %}
	{% for category in thecategories %}
		<li class="list-group-item"><a href="{{ category | first | slugify | prepend: '/category/' }}">{{ category | first }}</a> ({{ category | last | size }})</li>
	{% endfor %}
</ul>
