cask "nocx" do
  version "0.6.1"
  sha256 "832c5a8f4ee6b800fc6fccf904aec2535a3eb339c18e7f982b3a2abd8fa2d462"

  url "https://github.com/shady2k/nocx/releases/download/v#{version}/nocx-#{version}-darwin-universal.zip"
  name "nocx"
  desc "Local-first terminal for modern agent TUIs"
  homepage "https://github.com/shady2k/nocx"

  auto_updates true
  depends_on macos: :sonoma

  app "nocx.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "/Applications/nocx.app"]
  end

  caveats <<~EOS
    This tap removes com.apple.quarantine from /Applications/nocx.app after installation.
    This lets the unsigned app open without Gatekeeper quarantine checks. Install only if you
    trust this tap and its release artifacts.
  EOS
end
