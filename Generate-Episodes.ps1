# Path to your CSV file
$CSVPath = "C:\Users\Rizwan\GitHub\Haqq\episodes_list.csv"

# Example CSV structure: episode_number,youtube_link,transcript_file
# 005,https://youtu.be/4QI291kZ4K4,C:\Users\Rizwan\Transcripts\ep005.txt

# Import CSV
$episodes = Import-Csv -Path $CSVPath

# Base folder
$BaseFolder = "C:\Users\Rizwan\GitHub\Haqq\episodes"

foreach ($ep in $episodes) {
    $epNum = "{0:D3}" -f [int]$ep.episode_number
    $epFolder = Join-Path $BaseFolder "episode-$epNum"
    
    # Create episode folder
    if (-not (Test-Path $epFolder)) {
        New-Item -ItemType Directory -Path $epFolder
    }

    # Create thumbnail placeholder
    $thumbPath = Join-Path $epFolder "thumbnail.jpg"
    if (-not (Test-Path $thumbPath)) { New-Item -ItemType File -Path $thumbPath }

    # Create script.txt from transcript
    $scriptPath = Join-Path $epFolder "script.txt"
    if (Test-Path $ep.transcript_file) {
        Copy-Item -Path $ep.transcript_file -Destination $scriptPath -Force
    } else {
        New-Item -ItemType File -Path $scriptPath
    }

    # Create index.md
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
See \`script.txt\` for full transcript.

## Thumbnail
![Episode Thumbnail](thumbnail.jpg)
"@
    Set-Content -Path $indexPath -Value $indexContent
}

Write-Host "All episodes generated successfully!"