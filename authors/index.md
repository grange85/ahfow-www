---
layout: page
title: Posts by guest authors
---
{% for author in site.data.authors %}
<h3 id="{{author.name}}">{{ author.display_name }}</h3>
{% if author.description %}<p>{{ author.description }}</p>{% endif %}
{% if author.website %}<p>Website: <a href="{{ author.website.url }}">{{ author.website.name }}</a></p>{% endif %}
<div class="table-responsive">
	<table class="table ">
		{% for post in site.posts %}
		 {% unless post.draft %}
		  {% if post.author.display_name == author.display_name %}
		<tr>
			<th>{{ post.date | date: "%-d %B %Y" }}</th>
			<td><a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a></td>
		</tr>
		  {% endif %}
		 {% endunless %}
		{% endfor %}
	</table>
{% endfor %}
