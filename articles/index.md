---
layout: page
title: Articles
author:
  display_name: Andy
  login: admin
  email: andy@fullofwishes.co.uk
  url: http://www.grange85.co.uk
author_login: admin
author_email: andy@fullofwishes.co.uk
author_url: http://www.grange85.co.uk
categories: []
tags: []
---
{% for article in site.articles %}
  <li>
    <a href="{{ article.url }}">
      {{ article.title }}
    </a>
  </li>
{% endfor %}
