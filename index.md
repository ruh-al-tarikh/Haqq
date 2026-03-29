---
layout: default
title: Home
---

# Welcome to HAQ

Discover forgotten Islamic history, Quranic mysteries, and powerful storytelling.

🎥 Visit our YouTube Channel: [Ruh-Al-Tarikh](https://www.youtube.com/@Ruh-Al-Tarikh)

## Latest Episodes

{% assign episodes = site.pages | where_exp: "item", "item.path contains 'episode'" | sort: "path" | reverse %}
<ul>
{% for episode in episodes %}
  <li><a href="{{ episode.url | relative_url }}">{{ episode.title }}</a></li>
{% endfor %}
</ul>
