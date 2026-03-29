---
title: "HAQ - Forgotten Islamic Stories"
layout: default
---

<div class="hero" style="text-align: center; padding: 3rem 0;">
  <h1>Welcome to HAQ</h1>
  <p style="font-size: 1.2rem;">Discover forgotten Islamic history, Quranic mysteries, and powerful storytelling.</p>
  <a href="https://www.youtube.com/@Ruh-Al-Tarikh" target="_blank" class="cta-button" style="display: inline-block; background: var(--gold); color: var(--dark); padding: 0.8rem 1.5rem; border-radius: 5px; font-weight: bold; margin-top: 1rem;">🎥 Visit our YouTube Channel</a>
</div>

<hr style="border: 0; border-top: 1px solid #333; margin: 2rem 0;">

<h2>Latest Episodes</h2>
<<<<<<< HEAD

<<<<<<< HEAD
---

## Latest Episodes
- [Episode 005 - Title Here](episodes/episode-005/index.md)
- [Episode 006 - Title Here](episodes/episode-006/index.md)
- [Episode 007 - Title Here](episodes/episode-007/index.md)
- [Episode 008 - Title Here](episodes/episode-008/index.md)
- [Episode 009 - Title Here](episodes/episode-009/index.md)
- [Episode 010 - Title Here](episodes/episode-010/index.md)
- [Episode 011 - Title Here](episodes/episode-011/index.md)
- [Episode 012 - Title Here](episodes/episode-012/index.md)
- [Episode 013 - Title Here](episodes/episode-013/index.md)
- [Episode 014 - Title Here](episodes/episode-014/index.md)
- [Episode 015 - Title Here](episodes/episode-015/index.md)
- [Episode 016 - Title Here](episodes/episode-016/index.md)
- [Episode 017 - Title Here](episodes/episode-017/index.md)
- [Episode 018 - Title Here](episodes/episode-018/index.md)
- [Episode 019 - Title Here](episodes/episode-019/index.md)
- [Episode 020 - Title Here](episodes/episode-020/index.md)
- [Episode 021 - Title Here](episodes/episode-021/index.md)
- [Episode 022 - Title Here](episodes/episode-022/index.md)
- [Episode 023 - Title Here](episodes/episode-023/index.md)
- [Episode 024 - Title Here](episodes/episode-024/index.md)
- [Episode 025 - Title Here](episodes/episode-025/index.md)
- [Episode 026 - Title Here](episodes/episode-026/index.md)
- [Episode 027 - Title Here](episodes/episode-027/index.md)
- [Episode 028 - Title Here](episodes/episode-028/index.md)
- [Episode 029 - Title Here](episodes/episode-029/index.md)
- [Episode 030 - Title Here](episodes/episode-030/index.md)
- [Episode 031 - Title Here](episodes/episode-031/index.md)
- [Episode 032 - Title Here](episodes/episode-032/index.md)
- [Episode 033 - Title Here](episodes/episode-033/index.md)
- [Episode 034 - Title Here](episodes/episode-034/index.md)
- [Episode 035 - Title Here](episodes/episode-035/index.md)

<<<<<<< HEAD
=======
{% assign episodes = site.pages | where_exp: "item", "item.path contains 'episode'" | sort: "path" | reverse %}
<ul>
{% for episode in episodes %}
  <li><a href="{{ episode.url | relative_url }}">{{ episode.title }}</a></li>
{% endfor %}
</ul>
>>>>>>> 10a797d5d9f523afb51396a4d99abeb4d2026531
=======
=======

>>>>>>> e5c282c (Refactor episodes to Jekyll collection and enhance Web UI)
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
<<<<<<< HEAD
>>>>>>> e5c282c (Refactor episodes to Jekyll collection and enhance Web UI)
=======
>>>>>>> e5c282c (Refactor episodes to Jekyll collection and enhance Web UI)
