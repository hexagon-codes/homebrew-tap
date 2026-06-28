cask "hexclaw" do
  version "0.4.8"

  on_arm do
    url "https://github.com/hexagon-codes/hexclaw-desktop/releases/download/v#{version}/HexClaw_#{version}_aarch64.dmg"
    sha256 "a37d86ed285345c3bc58b0d99062002e97b353b3e29d9adfe3c23343dd93058b"
  end

  on_intel do
    url "https://github.com/hexagon-codes/hexclaw-desktop/releases/download/v#{version}/HexClaw_#{version}_x64.dmg"
    sha256 "d5475f0ce21c8fcdc9ccf79a5229958b004ae8ecc4a126e6e85029c7848860c3"
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
