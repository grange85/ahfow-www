---
layout: page
title: My record collection by catalogue number
which_category: 13 most beautiful
---

See the _my record collection_ posts in [date order](/category/my-record-collection/).

<ul>
<li>10 = CD</li>
<li>11 = 7" singles</li>
<li>12 = LPs, 10" and 12"</li>
<li>13 = DVD and VHS</li>
<li>16 = MC</li>
</ul>

{%-assign sortedposts = site.categories['my record collection'] | sort: "catno" -%}

  <ul>
    {%- for post in sortedposts -%}
    {% if post.catno %}
        <li>
          <span>{{- post.catno -}}</span>
          <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
        </li>
    {% endif %}
    {%- endfor -%}
  </ul>
