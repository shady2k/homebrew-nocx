cask "nocx" do
  version "0.8.1"
  sha256 "673a28e8d154a74670d82156c47b9a1682c39646511efec92bac1815f61bc06b"

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
