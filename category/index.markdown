---
layout: page
status: publish
published: true
title: All categories
author:
  display_name: Andy
  login: admin
  email: andy@fullofwishes.co.uk
  url: http://www.grange85.co.uk
author_login: admin
author_email: andy@fullofwishes.co.uk
author_url: http://www.grange85.co.uk
date: '2013-02-06 14:21:37 +0000'
date_gmt: '2013-02-06 14:21:37 +0000'
categories: []
tags: []
---
<ul class="list-group">
	{% assign thecategories = site.categories | sort %}
	{% for category in thecategories %}
		<li class="list-group-item"><a href="{{ category | first | slugify | prepend: '/category/' }}">{{ category | first }}</a> ({{ category | last | size }})</li>
	{% endfor %}
</ul>
