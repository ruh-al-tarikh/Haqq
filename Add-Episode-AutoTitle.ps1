# ==========================================
# HAQ Weekly Episode Automation Script (Auto Title)
# ==========================================

# --------------------------
# 1️⃣ Configuration
# --------------------------
$RepoRoot = "C:\Users\Rizwan\GitHub\Haqq"   # <-- Your repo path
$EpisodesFolder = Join-Path $RepoRoot "episodes"
$HomepageFile = Join-Path $RepoRoot "index.md"
$YouTubeChannel = "https://www.youtube.com/@Ruh-Al-Tarikh"  # your homepage link

# --------------------------
# 2️⃣ Input Episode Info
# --------------------------
$EpisodeNumber = Read-Host "Enter Episode Number (e.g., 003)"
$YouTubeLink = Read-Host "Enter YouTube Link"

# --------------------------
# 3️⃣ Fetch Video Title from YouTube
# --------------------------
try {
    $Response = Invoke-WebRequest -Uri $YouTubeLink -UseBasicParsing
    $TitleMatch = [regex]::Match($Response.Content, '<title>(.*?)</title>')
    if ($TitleMatch.Success) {
        $EpisodeTitle = $TitleMatch.Groups[1].Value
        # Remove " - YouTube" suffix from title
        $EpisodeTitle = $EpisodeTitle -replace ' - YouTube',''
        Write-Host "Auto-fetched video title: $EpisodeTitle"
    } else {
        $EpisodeTitle = "Episode $EpisodeNumber"
        Write-Host "Could not fetch title. Using default: $EpisodeTitle"
    }
} catch {
    $EpisodeTitle = "Episode $EpisodeNumber"
    Write-Host "Error fetching video title. Using default: $EpisodeTitle"
}

$EpisodeDate = Get-Date -Format "yyyy-MM-dd"

# --------------------------
# 4️⃣ Create Episode Folder & Files
# --------------------------
$EpisodeFolder = Join-Path $EpisodesFolder "episode-$EpisodeNumber"
if (!(Test-Path $EpisodeFolder)) {
    New-Item -Path $EpisodeFolder -ItemType Directory | Out-Null
    New-Item -Path "$EpisodeFolder\index.md" -ItemType File | Out-Null
    New-Item -Path "$EpisodeFolder\script.txt" -ItemType File | Out-Null
    New-Item -Path "$EpisodeFolder\thumbnail.jpg" -ItemType File | Out-Null
    Write-Host "Created folder and files for Episode $EpisodeNumber"
}

# --------------------------
# 5️⃣ Update Episode index.md
# --------------------------
$IndexFile = Join-Path $EpisodeFolder "index.md"
$IndexContent = @"
---
title: "Episode $EpisodeNumber - $EpisodeTitle"
description: "Explore forgotten Islamic history, prophetic stories, and hidden truths."
date: $EpisodeDate
tags: [Islamic history, Quran, prophetic stories, Haq, Ruh-Al-Tarikh]
---

# Episode $EpisodeNumber - $EpisodeTitle

🎥 **Watch on YouTube:** [$YouTubeLink]($YouTubeLink)

---

## Script

Paste the full episode script here or summarize key points from the video.

---

## Key Insights

- Insight 1: Highlight the main lesson or Quranic reference.  
- Insight 2: Mention any prophetic story or historical point.  
- Insight 3: Include a reflective takeaway for viewers.

---

## Thumbnail

![Episode Thumbnail](thumbnail.jpg)

---

## SEO / Notes

- Use the `tags` in front matter for search optimization.  
- Update `date` for each new episode.  
- Keep `title` concise and engaging.
"@

$IndexContent | Set-Content -Path $IndexFile
Write-Host "Updated index.md for Episode $EpisodeNumber"

# --------------------------
# 6️⃣ Update Homepage Listing
# --------------------------
$EpisodeLinks = Get-ChildItem $EpisodesFolder -Directory | 
                Sort-Object Name -Descending | 
                ForEach-Object { "- [`$($_.Name.Replace('episode-','Episode '))`]($($_.FullName.Replace($RepoRoot,'').Replace('\','/'))/index.md)" }

$HomepageContent = @"
---
title: "HAQ - Forgotten Islamic Stories"
description: "Explore forgotten Islamic history, Quranic mysteries, and prophetic stories through weekly videos."
---

# Welcome to HAQ

Discover forgotten Islamic history, prophetic stories, and Quranic mysteries.  
We release **weekly episodes** exploring hidden truths, historical lessons, and powerful insights.

---

## Latest Episode

🎥 **Episode $EpisodeNumber - $EpisodeTitle**  
[Watch on YouTube]($YouTubeLink)  

---

## All Episodes

$($EpisodeLinks -join "`n")

---

## Support the Channel

🎥 [Visit YouTube Channel]($YouTubeChannel)  
💬 Like, Subscribe, and Share to spread knowledge.
"@

$HomepageContent | Set-Content -Path $HomepageFile
Write-Host "Homepage index.md updated with all episodes"

# --------------------------
# 7️⃣ Git Commit & Push
# --------------------------
cd $RepoRoot
git add .
git commit -m "Add Episode $EpisodeNumber: $EpisodeTitle"
git push origin main
Write-Host "Episode $EpisodeNumber committed and pushed to GitHub successfully!"