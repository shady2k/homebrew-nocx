cask "nocx" do
  version "0.6.0"
  sha256 "1141771494d012e37c84d8b6e452b6f6ba1f1d167a535b0b38fec3253e523e8a"

  url "https://github.com/shady2k/nocx/releases/download/v#{version}/nocx-#{version}-darwin-universal.zip"
  name "nocx"
  desc "Local-first terminal for modern agent TUIs"
  homepage "https://github.com/shady2k/nocx"

  auto_updates true
  # The SYMBOL form is a minimum, not an equality: `depends_on macos: :sonoma`
  # means Sonoma or newer. The string form this replaced (`">= :sonoma"`) still
  # works, but Homebrew warns on it on every install - "Calling string comparison
  # format for depends_on macos: is deprecated!" - which is the first thing a
  # person sees when they run `brew install --cask shady2k/nocx/nocx`
  # (nocx-1ebrs.12, found on the 0.6.0 clean-Mac pass).
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
