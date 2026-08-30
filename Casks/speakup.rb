cask "speakup" do
  version "1.0.1"
  sha256 "665ea77faa2ebcc8ee41106a121c16acfe20e80bdcc1f6a2a7c7bcb4a9a6e2cb"

  url "https://github.com/thealphacircuit/speakup-releases/releases/download/v#{version}/SpeakUp-#{version}.dmg",
      verified: "github.com/thealphacircuit/speakup-releases/"
  name "SpeakUp"
  desc "Local dictation for macOS"
  homepage "https://speakup.thealphacircuit.com/"

  # The app ships Sparkle and updates itself, so `brew upgrade` leaves it alone
  # unless run with --greedy. Declaring this is not optional politeness: without
  # it Homebrew would reinstall over a copy the app had already updated, and the
  # two would fight over the same bundle.
  auto_updates true

  # Matches the minimum in Info.plist and on the website. macOS 26 is :tahoe,
  # and the bare symbol means "this or newer" — the ">= :tahoe" string form
  # that also works is deprecated.
  depends_on macos: :tahoe

  app "SpeakUp.app"

  # SpeakUp writes no documents — transcripts live in memory and are gone when
  # it quits — so this is only its own preferences, Sparkle's update state, and
  # the saved-state blob macOS keeps for any app.
  zap trash: [
    "~/Library/Caches/com.thealphacircuit.SpeakUp",
    "~/Library/HTTPStorages/com.thealphacircuit.SpeakUp",
    "~/Library/Preferences/com.thealphacircuit.SpeakUp.plist",
    "~/Library/Saved Application State/com.thealphacircuit.SpeakUp.savedState",
  ]

  caveats <<~EOS
    SpeakUp runs in the menu bar with no Dock icon and no window.

    It needs Accessibility access to paste into the app you were typing in, and
    Microphone access to hear you. macOS will ask on first use; both can be
    granted later in System Settings > Privacy & Security.
  EOS
end
