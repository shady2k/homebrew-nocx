# homebrew-nocx

Homebrew tap for nocx, a local-first terminal for modern agent TUIs.

Install with:

```sh
brew tap shady2k/nocx
brew install --cask nocx
```

## Security and quarantine

This tap's cask deliberately removes `com.apple.quarantine` from
`/Applications/nocx.app` after installation. nocx is unsigned and is not
notarized. Clearing quarantine lets macOS launch it without the Gatekeeper
quarantine dialog; it is not a signature or a verification of the app. Install
only if you trust this tap and the nocx release artifacts.

The cask uses `auto_updates true` because nocx updates itself through its
signed update manifest. Homebrew upgrades should not replace that update path.
