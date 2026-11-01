# Homebrew tap for VideoLibrary

Install [VideoLibrary](https://video.mistr.uk) and its download tools (yt-dlp, ffmpeg, Deno) with one command:

```sh
brew install jotspot/tap/videolibrary
```

Update with `brew upgrade`. The app opens straight away: the cask clears macOS's quarantine flag after installing.

Uninstall with `brew uninstall videolibrary` (add `--zap` to also remove its settings and saved sign-ins; your videos are never touched).

The cask is updated automatically by [VideoLibrary's release workflow](https://github.com/Jotspot/VideoLibrary/blob/main/.github/workflows/release.yml). Requires macOS 26 (Tahoe) or later on Apple silicon.
