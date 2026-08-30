# The Alpha Circuit — Homebrew tap

```bash
brew install --cask thealphacircuit/tap/speakup
```

## Casks

| Cask | What it is |
| --- | --- |
| `speakup` | Local dictation for macOS. [Site](https://speakup.thealphacircuit.com/) |

## Upgrading

Every app here ships Sparkle and updates itself, so the casks declare
`auto_updates true` and a plain `brew upgrade` deliberately skips them —
otherwise Homebrew would reinstall over a copy the app had already updated, and
the two would fight over the same bundle.

To upgrade through Homebrew anyway — which is the only upgrade path if you have
turned the app's automatic checks off:

```bash
brew upgrade --greedy --cask thealphacircuit/tap/speakup
```
