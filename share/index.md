---
layout: default
title: Quick shares
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
<ul>

{% for share in site.share %}
  <li>
    <a href="{{ share.url }}">
      {{ share.title }}
    </a>
  </li>
{% endfor %}
</ul>
