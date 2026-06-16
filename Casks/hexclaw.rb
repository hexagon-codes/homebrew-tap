cask "hexclaw" do
  version "0.4.2"

  on_arm do
    url "https://github.com/hexagon-codes/hexclaw-desktop/releases/download/v#{version}/HexClaw_#{version}_aarch64.dmg"
    sha256 "788daaa9a4bda82a249853768768295b8d2f337a24fe9f92a2294c48c2a49ce2"
  end

  on_intel do
    url "https://github.com/hexagon-codes/hexclaw-desktop/releases/download/v#{version}/HexClaw_#{version}_x64.dmg"
    sha256 "842a38e925123dd65352d1935047ff85ad688a17523ece3185f8bb80ccb6ccd7"
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
