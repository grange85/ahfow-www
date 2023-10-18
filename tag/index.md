---
layout: default
title: All tags
---
<div class="">
	{% assign thetags = site.tags | sort %}
	{% for tag in thetags %}
    {% assign tagsize = tag | last | size %}
    {% if tagsize > 0 %}
		<a class="btn btn-light" href="{{ tag | first | slugify | prepend: '/tag/' }}">{{ tag | first }} <span class="badge text-bg-secondary">{{ tag | last | size }}</span></a>
    {% endif %}
	{% endfor %}
</div>
