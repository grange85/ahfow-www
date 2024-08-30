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

{% capture list %}
    {%- for post in sortedposts -%}
    {%- if post.catno -%}
    {%- for catnoitem in post.catno -%}{{ catnoitem }}|{{ post.url | relative_url }}|{{ post.title }}^{%- endfor -%}
    {%- endif -%}
    {%- endfor -%}
{% endcapture %}

{% assign sortedlist = list | split: "^" | sort %}

  <ul>
    {%- for sorteditem in sortedlist -%}
    {% assign item = sorteditem | split: "|" %}
        <li style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
          <span>{{- item[0] -}}</span>
          <a href="{{ item[1] }}">{{ item[2] }}</a>
        </li>
    {% endfor %}
  </ul>


