---
layout: default
title: Home
---

# Welcome to HAQ

Discover forgotten Islamic history, Quranic mysteries, and powerful storytelling.

🎥 Visit our YouTube Channel: [Ruh-Al-Tarikh](https://www.youtube.com/@Ruh-Al-Tarikh)

## Latest Episodes

<ul>
{% for episode in site.pages %}
  {% if episode.path contains 'episode' %}
    <li><a href="{{ episode.url }}">{{ episode.title }}</a></li>
  {% endif %}
{% endfor %}
</ul>