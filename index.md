---
layout: default
title: Home
---

<div class="hero-section" style="text-align: center; padding: 5rem 0; background: linear-gradient(rgba(10,10,10,0.7), rgba(10,10,10,0.7)), url('assets/episodes/episode001.jpg'); background-size: cover; background-position: center; border-radius: 20px; margin-bottom: 4rem; border: 1px solid var(--gold);">
  <h1 style="font-size: 3.5rem; margin-bottom: 1rem;">Forgotten Islamic History</h1>
  <p style="font-size: 1.4rem; font-family: var(--header-font); margin-bottom: 2rem;">Discover the hidden truths and powerful storytelling of the past.</p>
  <a href="https://www.youtube.com/@Ruh-Al-Tarikh" target="_blank" class="youtube-btn" style="margin-top: 0;">🎥 Explore our Journey</a>
</div>

<h2 style="text-align: center; font-size: 2.5rem; margin-bottom: 3rem;">Recent Chronicles</h2>

<div class="episode-grid">
  {% assign episodes = site.episodes | sort: "path" | reverse %}
  {% for episode in episodes %}
  <div class="episode-card">
    <a href="{{ episode.url | relative_url }}">
      <div class="episode-thumbnail-container">
        <img src="{{ episode.thumbnail | relative_url }}" alt="{{ episode.title }}" class="episode-thumbnail" loading="lazy">
      </div>
      <div class="episode-info">
        <div class="episode-title">{{ episode.title }}</div>
      </div>
    </a>
  </div>
  {% endfor %}
</div>
