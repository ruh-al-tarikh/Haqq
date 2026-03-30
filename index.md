---
layout: default
title: Home
---

<section class="hero">
  <div class="hero-overlay">
    <h1>?? HAQ</h1>
    <p>Uncovering forgotten Islamic history, Quranic mysteries, and prophetic storytelling.</p>
    <div class="hero-buttons">
      <a href="#episodes" class="btn">?? Browse Episodes</a>
      <a href="https://www.youtube.com/@Ruh-Al-Tarikh" class="btn">? YouTube Channel</a>
    </div>
  </div>
</section>

<section id="episodes">
  <h2>?? Documentary Archive</h2>
  <div class="episodes-grid">
  {% assign episode_pages = site.pages | where_exp: "page", "page.path contains 'episodes/episode-'" %}
  {% for episode in episode_pages reversed %}
    <div class="episode-card">
      <img src="{{ '/assets/thumbnails/default-thumb.jpg' | relative_url }}" alt="{{ episode.title }}">
      <h3>{{ episode.title }}</h3>
      <p>Explore this forgotten truth from Islamic history.</p>
      <a href="{{ episode.url }}" class="btn-small">Read Episode ?</a>
    </div>
  {% endfor %}
  </div>
</section>
