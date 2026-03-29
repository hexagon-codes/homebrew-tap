cask "hexclaw" do
  version "0.2.2"

  on_arm do
    url "https://github.com/hexagon-codes/hexclaw-desktop/releases/download/v#{version}/HexClaw_#{version}_aarch64.dmg"
    sha256 "03d91010f9962fece4f3df1c436a956369250ae9a9ece1c36db41ed92299fa20"
  end

  on_intel do
    url "https://github.com/hexagon-codes/hexclaw-desktop/releases/download/v#{version}/HexClaw_#{version}_x86_64.dmg"
    sha256 :no_check
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
