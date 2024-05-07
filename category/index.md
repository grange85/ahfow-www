---
layout: page
title: Categories
---
<ul>
{% for cat in site.main_categories %}
<li><a href="/category/{{ cat | slugify }}">{{ cat }}</a></li>
{% endfor %}
</ul>
