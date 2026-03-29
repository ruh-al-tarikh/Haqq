$IndexContent = @"

\---

title: "HAQ - Forgotten Islamic Stories"

description: "Discover forgotten Islamic history, prophetic stories, and hidden truths."

\---



\# Welcome to HAQ



HAQ explores \*\*forgotten Islamic history, prophetic stories, and Quranic mysteries\*\* through weekly videos.



🎥 \[Visit the Ruh-Al-Tarikh YouTube Channel](https://www.youtube.com/@Ruh-Al-Tarikh)



\---



\## Latest Episodes



{% for ep in (1..35) reversed %}

\- \[Episode {{ "%03d" | format: ep }}](episodes/episode-{{ "%03d" | format: ep }}/index.md)

{% endfor %}



\---



\## About HAQ



Discover weekly Islamic storytelling, scripts, thumbnails, and deep insights into history and Quranic narratives.

"@

Set-Content -Path "index.md" -Value $IndexContent

