# ==========================================
# HAQ Repo - Full Older Episodes Automation
# ==========================================

# --------------------------
# 1️⃣ Configuration
# --------------------------
$RepoRoot = "C:\Users\Rizwan\GitHub\Haqq"
$EpisodesFolder = Join-Path $RepoRoot "episodes"
$HomepageFile = Join-Path $RepoRoot "index.md"
$YouTubeChannel = "https://www.youtube.com/@Ruh-Al-Tarikh"
$CsvFile = Join-Path $RepoRoot "episodes_list.csv"

# --------------------------
# 2️⃣ Read Episode List CSV
# --------------------------
$VideoList = Import-Csv $CsvFile

foreach ($video in $VideoList) {

    $EpisodeNumber = $video.episode_number
    $YouTubeLink = $video.youtube_link
    $TranscriptFile = $video.transcript_file
    $EpisodeDate = Get-Date -Format "yyyy-MM-dd"

    Write-Host "Processing Episode $EpisodeNumber ..." -ForegroundColor Cyan

    # --------------------------
    # 3️⃣ Fetch Video Title from YouTube
    # --------------------------
    try {
        $Response = Invoke-WebRequest -Uri $YouTubeLink -UseBasicParsing
        $TitleMatch = [regex]::Match($Response.Content, '<title>(.*?)</title>')
        if ($TitleMatch.Success) { $EpisodeTitle = $TitleMatch.Groups[1].Value -replace ' - YouTube','' }
        else { $EpisodeTitle = "Episode $EpisodeNumber" }
    } catch { $EpisodeTitle = "Episode $EpisodeNumber" }

    # --------------------------
    # 4️⃣ Create Episode Folder
    # --------------------------
    $EpisodeFolder = Join-Path $EpisodesFolder "episode-$EpisodeNumber"
    if (!(Test-Path $EpisodeFolder)) { New-Item -Path $EpisodeFolder -ItemType Directory | Out-Null }

    # --------------------------
    # 5️⃣ Download Thumbnail
    # --------------------------
    try {
        if ($YouTubeLink -match "v=([a-zA-Z0-9_-]+)") { $VideoID = $Matches[1] }
        elseif ($YouTubeLink -match "youtu.be/([a-zA-Z0-9_-]+)") { $VideoID = $Matches[1] }
        if ($VideoID) {
            $ThumbnailUrl = "https://img.youtube.com/vi/$VideoID/maxresdefault.jpg"
            Invoke-WebRequest -Uri $ThumbnailUrl -OutFile (Join-Path $EpisodeFolder "thumbnail.jpg")
        }
    } catch { Write-Host "Thumbnail download failed for Episode $EpisodeNumber" }

    # --------------------------
    # 6️⃣ Create index.md
    # --------------------------
    $IndexContent = @"
---
title: "Episode ${EpisodeNumber} - ${EpisodeTitle}"
description: "Explore forgotten Islamic history, prophetic stories, and hidden truths."
date: $EpisodeDate
tags: [Islamic history, Quran, prophetic stories, Haq, Ruh-Al-Tarikh]
---

# Episode ${EpisodeNumber} - ${EpisodeTitle}

🎥 **Watch on YouTube:** [$YouTubeLink]($YouTubeLink)

---

## Script

See script.txt for full episode content.

---

## Thumbnail

![Episode Thumbnail](thumbnail.jpg)

"@

    $IndexContent | Set-Content -Path (Join-Path $EpisodeFolder "index.md")

    # --------------------------
    # 7️⃣ Populate script.txt from transcript
    # --------------------------
    if (Test-Path $TranscriptFile) {
        Copy-Item $TranscriptFile (Join-Path $EpisodeFolder "script.txt") -Force
    } else {
        New-Item -Path (Join-Path $EpisodeFolder "script.txt") -ItemType File | Out-Null
    }

    Write-Host "Episode $EpisodeNumber processed successfully!" -ForegroundColor Green
}

# --------------------------
# 8️⃣ Update Homepage index.md
# --------------------------
$EpisodeLinks = Get-ChildItem $EpisodesFolder -Directory | 
                Sort-Object Name | 
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

## All Episodes

$($EpisodeLinks -join "`n")

---

## Support the Channel

🎥 [Visit YouTube Channel]($YouTubeChannel)  
💬 Like, Subscribe, and Share to spread knowledge.
"@

$HomepageContent | Set-Content -Path $HomepageFile
Write-Host "Homepage updated with all episodes!" -ForegroundColor Yellow

# --------------------------
# 9️⃣ Commit & Push All Changes
# --------------------------
cd $RepoRoot
git add .
git commit -m "Auto-add older episodes from CSV"
git push origin main
Write-Host "All older episodes committed and pushed successfully!" -ForegroundColor Magenta