---
layout: basic
title: List of releases available on bandcamp
list: downloads
categories: primary
description: >
  A list of Galaxie 500, Luna, Damon & Naomi, Dean & Britta and Dean Wareham shows that are available to buy or stream on bandcamp.
---


{% for artistslugs in site.data.artists %}
	{% assign artistslug = artistslugs[0] %}
	{% assign artist = site.data.artists[artistslug] %}
	{% case artist.slug %}
	{% when 'galaxie-500' %}
		{% assign releases = site.galaxie-500-releases %}
	{% when 'luna' %}
		{% assign releases = site.luna-releases %}
	{% when 'damon-and-naomi' %}
		{% assign releases = site.damon-and-naomi-releases %}
	{% when 'dean-and-britta' %}
		{% assign releases = site.dean-and-britta-releases %}
	{% when 'dean-wareham' %}
		{% assign releases = site.dean-wareham-releases %}
	{% when 'britta-phillips' %}
		{% assign releases = site.britta-phillips-releases %}
	{% endcase %}
	
{% if releases %}
<h2>{{artist.name}}</h2>
<ul class="list-group">
{% for release in releases %}
    {% if release.bandcamp-url %}
        <li class="list-group-item"><a href="{{ release.url | prepend: site.baseurl }}">{{ release.albumname }} {% if release.artist %} ({{release.artist}}){% endif %}</a></li>
    {% endif %}
{% endfor %}
</ul>
{% endif %}
{% endfor %}
