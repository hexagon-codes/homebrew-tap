cask "hexclaw" do
  version "0.3.12"

  on_arm do
    url "https://github.com/hexagon-codes/hexclaw-desktop/releases/download/v#{version}/HexClaw_#{version}_aarch64.dmg"
    sha256 "094f96b865eff05691851c8868c0b9028085a43c921daba902228e72950e6168"
  end

  on_intel do
    url "https://github.com/hexagon-codes/hexclaw-desktop/releases/download/v#{version}/HexClaw_#{version}_x64.dmg"
    sha256 "666cc9ac56a64130b0e5498829172eb26d6375b3961876c4ffe21526b03a73ee"
  end

  name "HexClaw"
  desc "Enterprise-grade personal AI Agent desktop client"
  homepage "https://github.com/hexagon-codes/hexclaw-desktop"

  depends_on macos: ">= :big_sur"

  app "HexClaw.app"

  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/HexClaw.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.hexclaw.desktop",
    "~/Library/Caches/com.hexclaw.desktop",
    "~/Library/Preferences/com.hexclaw.desktop.plist",
    "~/Library/Saved Application State/com.hexclaw.desktop.savedState",
    "~/.hexclaw",
  ]
end
