---
layout: default
title: Home
---

# 🕋 Welcome to HAQ

Discover forgotten Islamic history, Quranic mysteries, and powerful storytelling.

🎥 Visit our YouTube Channel: [Ruh-Al-Tarikh](https://www.youtube.com/@Ruh-Al-Tarikh)

---

## 🎬 Latest Episodes

<div class="episodes-grid">
{% for episode in site.episodes reversed limit:12 %}
  <div class="episode-card">
    <a href="{{ episode.url }}">
      <h3>{{ episode.title }}</h3>
    </a>
  </div>
{% endfor %}
</div>

---

## 📚 All Episodes

<ul>
{% for episode in site.episodes reversed %}
  <li><a href="{{ episode.url }}">{{ episode.title }}</a></li>
{% endfor %}
</ul>