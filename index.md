---
layout: default
title: Home
---

<div class="hero" style="text-align: center; padding: 3rem 0;">
  <h1>Welcome to HAQ</h1>
  <p style="font-size: 1.2rem;">Discover forgotten Islamic history, Quranic mysteries, and powerful storytelling.</p>
  <a href="https://www.youtube.com/@Ruh-Al-Tarikh" target="_blank" class="cta-button" style="display: inline-block; background: var(--gold); color: var(--dark); padding: 0.8rem 1.5rem; border-radius: 5px; font-weight: bold; margin-top: 1rem;">🎥 Visit our YouTube Channel</a>
</div>

<hr style="border: 0; border-top: 1px solid #333; margin: 2rem 0;">

<h2>Latest Episodes</h2>

<div class="episode-grid">
  {% assign episodes = site.episodes | sort: "path" | reverse %}
  {% for episode in episodes %}
  <div class="episode-card">
    <a href="{{ episode.url | relative_url }}">
      <img src="{{ episode.thumbnail | relative_url }}" alt="{{ episode.title }}" class="episode-thumbnail">
      <div class="episode-info">
        <div class="episode-title">{{ episode.title }}</div>
      </div>
    </a>
  </div>
  {% endfor %}
</div>
