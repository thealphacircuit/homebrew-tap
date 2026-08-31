cask "pilcrow" do
  version "1.0.1"
  sha256 "f35e8420c593f43cd8e3acba071b7c9fa7c3a0eb962e6a686b6b8a1ca6ce67d8"

  url "https://github.com/thealphacircuit/pilcrow-releases/releases/download/v#{version}/Pilcrow-#{version}.dmg",
      verified: "github.com/thealphacircuit/pilcrow-releases/"
  name "Pilcrow"
  desc "Local dictation for macOS"
  homepage "https://pilcrow.thealphacircuit.com/"

  # The app ships Sparkle and updates itself, so `brew upgrade` leaves it alone
  # unless run with --greedy. Declaring this is not optional politeness: without
  # it Homebrew would reinstall over a copy the app had already updated, and the
  # two would fight over the same bundle.
  auto_updates true

  # Matches the minimum in Info.plist and on the website. macOS 26 is :tahoe,
  # and the bare symbol means "this or newer" — the ">= :tahoe" string form
  # that also works is deprecated.
  depends_on macos: :tahoe

  app "Pilcrow.app"

  # Pilcrow writes no documents — transcripts live in memory and are gone when
  # it quits — so this is only its own preferences, Sparkle's update state, and
  # the saved-state blob macOS keeps for any app.
  zap trash: [
    "~/Library/Caches/com.thealphacircuit.Pilcrow",
    "~/Library/HTTPStorages/com.thealphacircuit.Pilcrow",
    "~/Library/Preferences/com.thealphacircuit.Pilcrow.plist",
    "~/Library/Saved Application State/com.thealphacircuit.Pilcrow.savedState",
  ]

  caveats <<~EOS
    Pilcrow runs in the menu bar with no Dock icon and no window.

    It needs Accessibility access to paste into the app you were typing in, and
    Microphone access to hear you. macOS will ask on first use; both can be
    granted later in System Settings > Privacy & Security.
  EOS
end
