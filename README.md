# Homebrew Tap for Nano Typeless

This is a [Homebrew](https://brew.sh/) tap for [Nano Typeless](https://github.com/ZhaoChaoqun/nano-typeless) - a lightweight macOS voice-to-text tool powered by local FunASR AI.

## Installation

```bash
brew tap ZhaoChaoqun/typeless
brew install --cask nano-typeless
xattr -cr "/Applications/Nano Typeless.app"
```

## About Nano Typeless

- 🎤 **Push-to-Talk**: Hold `Fn` key to record, release to transcribe
- 🔒 **100% Local**: FunASR model runs entirely on-device
- 🌐 **Multilingual**: Native support for Chinese-English mixed input
- 💻 **Universal Binary**: Runs natively on both Apple Silicon and Intel Macs
- ⚡ **Lightweight**: Instant transcription without cloud processing

## Requirements

- macOS 14.0 (Sonoma) or later
- 8GB+ RAM recommended

## Permissions

After installation, you need to grant:
- **Microphone**: for voice recording
- **Accessibility**: for global Fn key detection

Go to: System Settings > Privacy & Security
