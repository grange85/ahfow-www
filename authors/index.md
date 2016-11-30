---
layout: page
status: publish
published: true
title: Posts by guest authors
author:
  display_name: Andy
  login: admin
  email: andy@fullofwishes.co.uk
  url: http://www.grange85.co.uk
author_login: admin
author_email: andy@fullofwishes.co.uk
author_url: http://www.grange85.co.uk
wordpress_id: 3705
wordpress_url: http://www.fullofwishes.co.uk/?page_id=3705
date: '2013-02-06 14:21:37 +0000'
date_gmt: '2013-02-06 14:21:37 +0000'
categories: []
tags: []
---

{% for a in site.data.authors %}	
<h3 id="{{a.name}}">{{ a.display_name }}</h3>
{% if a.description %}<p>{{ a.description }}</p>{% endif %}
{% if a.website %}<p>Website: <a href="{{ a.website.url }}">{{ a.website.name }}</a></p>{% endif %}
<div class="table-responsive">
	<table class="table table-striped">
		{% for post in site.posts %}
		 {% unless post.draft %}
		  {% if post.author.display_name == a.display_name %}
		<tr>
			<th>{{ post.date | date: "%-d %B %Y" }}</th>
			<td><a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a></td>
		</tr>
		  {% endif %}
		 {% endunless %}
		{% endfor %}
	</table>
{% endfor %}
