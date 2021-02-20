---
layout: basic
title: List of shows available to download
list: downloads
categories: primary
position: database-2
description: >
  A list of Galaxie 500, Luna, Damon & Naomi, Dean & Britta and Dean Wareham shows that are available to download.
---


{% for artistslugs in site.data.artists %}
	{% assign artistslug = artistslugs[0] %}
	{% assign artist = site.data.artists[artistslug] %}
	{% case artist.slug %}
	{% when 'galaxie-500' %}
		{% assign shows = site.galaxie-500-shows %}
	{% when 'luna' %}
		{% assign shows = site.luna-shows %}
	{% when 'damon-and-naomi' %}
		{% assign shows = site.damon-and-naomi-shows %}
	{% when 'dean-and-britta' %}
		{% assign shows = site.dean-and-britta-shows %}
	{% when 'dean-wareham' %}
		{% assign shows = site.dean-wareham-shows %}
	{% endcase %}
	
{% if shows %}
<table class="table table-striped">
<caption>{{artist.name}}</caption>
{% for show in shows %}
    {% if show.show-download %}
        <tr>
        <th class="col-md-4">{{show.show-date|date: "%-d %B %Y"}}</th>
        <td class="col-md-8"><a href="{{ show.url | prepend: site.baseurl}}">{{ show.show-venue }}</a></td>
        </tr>
    {% endif %}
{% endfor %}
</table>
{% endif %}
{% endfor %}
