# ===========================================
# Generate all episode folders and files
# Idempotent: safe to run multiple times
# ===========================================

# Path to your CSV file
$CSVPath = "C:\Users\Rizwan\GitHub\Haqq\episodes_list.csv"

# Base folder for episodes
$BaseFolder = "C:\Users\Rizwan\GitHub\Haqq\episodes"

# Import CSV
$episodes = Import-Csv -Path $CSVPath

foreach ($ep in $episodes) {

    # Format episode number with leading zeros
    $epNum = "{0:D3}" -f [int]$ep.episode_number
    $epFolder = Join-Path $BaseFolder "episode-$epNum"

    # Create episode folder if it doesn't exist
    if (-not (Test-Path $epFolder)) {
        New-Item -ItemType Directory -Path $epFolder | Out-Null
    }

    # Thumbnail.jpg: create only if it doesn't exist
    $thumbPath = Join-Path $epFolder "thumbnail.jpg"
    if (-not (Test-Path $thumbPath)) {
        New-Item -ItemType File -Path $thumbPath | Out-Null
    }

    # Script.txt: overwrite if transcript exists
    $scriptPath = Join-Path $epFolder "script.txt"
    if (Test-Path $ep.transcript_file) {
        Copy-Item -Path $ep.transcript_file -Destination $scriptPath -Force
    } else {
        if (-not (Test-Path $scriptPath)) {
            New-Item -ItemType File -Path $scriptPath | Out-Null
        }
    }

    # Index.md: always update with latest YouTube link and date
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

    # Write/overwrite index.md
    Set-Content -Path $indexPath -Value $indexContent
}

Write-Host "✅ All episodes generated/updated successfully!"