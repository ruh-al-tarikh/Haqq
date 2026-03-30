---
title: "HAQ - Forgotten Islamic Stories"
layout: default
---

<div class="hero">
  <h1>Welcome to HAQ</h1>
  <p>Discover forgotten Islamic history, Quranic mysteries, and powerful storytelling.</p>
  <a href="https://www.youtube.com/@Ruh-Al-Tarikh"
     target="_blank"
     rel="noopener noreferrer"
     class="cta-button"
     aria-label="Visit our YouTube Channel (opens in a new window)">
    🎥 Visit our YouTube Channel
  </a>
</div>

<div class="search-container">
  <input type="text" id="episode-search" placeholder="Search episodes..." aria-label="Search episodes by title">
  <div id="search-status" class="sr-only" aria-live="polite"></div>
</div>

<div id="no-results" class="no-results" style="display: none;">
  <p>No episodes found matching your search.</p>
  <button id="clear-search" type="button" class="clear-search-btn">Clear search</button>
</div>

<h2 class="section-title">Latest Episodes</h2>

<div class="episode-grid" id="episode-grid">
  {% assign episodes = site.episodes | sort: "path" | reverse %}
  {% for episode in episodes %}
  <article class="episode-card">
    <a href="{{ episode.url | relative_url }}">
      <div class="episode-thumbnail-container">
        <img src="{{ episode.thumbnail | relative_url }}" alt="{{ episode.title }}" class="episode-thumbnail" loading="lazy">
      </div>
      <div class="episode-info">
        <h3 class="episode-title">{{ episode.title }}</h3>
        <div class="episode-meta">
          <span>{{ episode.date | date: "%B %d, %Y" }}</span>
          <span class="read-more">Learn more →</span>
        </div>
      </div>
    </a>
  </article>
  {% endfor %}
</div>
