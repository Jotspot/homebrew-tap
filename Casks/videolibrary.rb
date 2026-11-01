cask "videolibrary" do
  version "26.10.4"
  sha256 "b261019b860c9453c2d7353f5afee64013699b59c39485daedc6c52b17454eda"

  url "https://github.com/Jotspot/VideoLibrary/releases/download/v#{version}/VideoLibrary.zip"
  name "VideoLibrary"
  desc "Download, organise and watch videos offline"
  homepage "https://video.mistr.uk/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on formula: ["yt-dlp", "ffmpeg", "deno"]
  depends_on macos: :tahoe

  app "VideoLibrary.app"

  # The app is ad-hoc signed, not notarized: clear quarantine so it opens
  # straight away instead of being blocked by Gatekeeper.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/VideoLibrary.app"]
  end

  uninstall quit: "com.videolibrary.app"

  # Your videos (~/Movies/VideoLibrary) and library folders are never removed.
  zap trash: [
    "~/Library/Application Support/VideoLibrary",
    "~/Library/Caches/com.videolibrary.app",
    "~/Library/HTTPStorages/com.videolibrary.app",
    "~/Library/Preferences/com.videolibrary.app.plist",
    "~/Library/Saved Application State/com.videolibrary.app.savedState",
  ]

  caveats <<~EOS
    After each update macOS asks once for Keychain access (the app is
    ad-hoc signed). Click "Always Allow" to keep your saved sign-ins.
  EOS
end
