---
layout: blank
status: publish
published: true
title: All posts
author:
  display_name: Andy
  login: admin
  email: andy@fullofwishes.co.uk
  url: http://www.grange85.co.uk
author_login: admin
author_email: andy@fullofwishes.co.uk
author_url: http://www.grange85.co.uk
date: '2015-09-09 22:00:00 +0100'
categories:
- admin
tags: []
---
<ul style="list-style-type:none">
{% assign allposts = site.posts | sort: 'date' %}
  {% for post in allposts %}
      <li>
            <a href="{{ post.url }}">{{ post.title }}</a><br><span class="text-muted">{{ post.path }}</span>
                </li>
                  {% endfor %}
</ul>
