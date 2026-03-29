# ===========================================
# Generate all episode folders/files AND update homepage
# Fully automated for HAQ website
# ===========================================

# Paths
$CSVPath = "C:\Users\Rizwan\GitHub\Haqq\episodes_list.csv"
$BaseFolder = "C:\Users\Rizwan\GitHub\Haqq\episodes"
$HomePagePath = "C:\Users\Rizwan\GitHub\Haqq\index.md"

# Import CSV
$episodes = Import-Csv -Path $CSVPath

# -------------------------------------------
# Step 1: Generate/Update Episode Folders
# -------------------------------------------
foreach ($ep in $episodes) {

    $epNum = "{0:D3}" -f [int]$ep.episode_number
    $epFolder = Join-Path $BaseFolder "episode-$epNum"

    if (-not (Test-Path $epFolder)) {
        New-Item -ItemType Directory -Path $epFolder | Out-Null
    }

    $thumbPath = Join-Path $epFolder "thumbnail.jpg"
    if (-not (Test-Path $thumbPath)) {
        New-Item -ItemType File -Path $thumbPath | Out-Null
    }

    $scriptPath = Join-Path $epFolder "script.txt"
    if (Test-Path $ep.transcript_file) {
        Copy-Item -Path $ep.transcript_file -Destination $scriptPath -Force
    } else {
        if (-not (Test-Path $scriptPath)) {
            New-Item -ItemType File -Path $scriptPath | Out-Null
        }
    }

    $indexPath = Join-Path $epFolder "index.md"
    $date = Get-Date -Format "yyyy-MM-dd"
    $youtubeLink = $ep.youtube_link
    $epTitle = "Episode $epNum - Title Here"

    $indexContent = @"
---
title: "$epTitle"
date: $date
tags: [HAQ, Islamic history, Ruh-Al-Tarikh]
---

# $epTitle

🎥 Watch on YouTube: [$youtubeLink]($youtubeLink)

## Script
See `script.txt` for full transcript.

## Thumbnail
![Episode Thumbnail](thumbnail.jpg)
"@

    Set-Content -Path $indexPath -Value $indexContent
}

Write-Host "✅ All episodes generated/updated successfully!"

# -------------------------------------------
# Step 2: Update Homepage (index.md)
# -------------------------------------------

# Homepage content header
$homepageHeader = @"
---
title: "HAQ - Forgotten Islamic Stories"
layout: default
---

# Welcome to HAQ

Discover forgotten Islamic history, Quranic mysteries, and powerful storytelling.

🎥 Visit our YouTube Channel: [Ruh-Al-Tarikh](https://www.youtube.com/@Ruh-Al-Tarikh)

---

## Latest Episodes
"@

# Generate episode list dynamically
$episodeList = ""
foreach ($ep in $episodes | Sort-Object {[int]$_.episode_number}) {
    $epNum = "{0:D3}" -f [int]$ep.episode_number
    $epTitle = "Episode $epNum - Title Here"
    $epLink = "episodes/episode-$epNum/index.md"
    $episodeList += "- [$epTitle]($epLink)`n"
}

# Combine header and list
$homepageContent = $homepageHeader + "`n" + $episodeList

# Write to homepage index.md
Set-Content -Path $HomePagePath -Value $homepageContent

Write-Host "✅ Homepage updated with all episodes!"