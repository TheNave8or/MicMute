## Overview

This AutoHotkey (AHK) script provides a simple way to manage your microphone's mute status, with visual and audio feedback. The script allows you to toggle your microphone's mute status and switch between normal and silent modes using customizable hotkeys. The script also displays a small GUI when the microphone is muted, and uses tray icons to reflect the current microphone status.

## Requirements

- **AutoHotkey Version**: This script requires **AutoHotkey v1** to run.

## Files Included

- **MicrophoneControl.ahk**: The main script file.
- **VA.ahk**: Library for controlling audio settings.
- **settings.ini**: Configuration file where you can set hotkeys, GUI positions, and other preferences.
- **MicOn.ico**: Icon displayed when the microphone is active (unmuted).
- **MicOff.ico**: Icon displayed when the microphone is muted.
- **mute(1/2).mp3** and **unmute(1/2).mp3**: Audio files for feedback when muting/unmuting the microphone (X represents the soundpack number).

## Setup

1. **Extract all files** into the same directory to ensure the script works correctly.
2. **Edit the `settings.ini` file** to customize hotkeys, GUI positions, soundpacks, and other settings according to your preferences.

### Example `settings.ini`:

```ini
[Settings]
togglekey=F1
silentkey=F2
silent=True
gui_show=True
xpos=0
ypos=0
soundpack=2
micname=Microphone
```

## Usage

- **Toggle Mute**: Press the hotkey specified in `togglekey` (default: `F1`) to mute or unmute the microphone.
- **Toggle Silent Mode**: Press the hotkey specified in `silentkey` (default: `F2`) to switch between silent and normal modes.
  - When in silent mode, no audio feedback will be played when muting/unmuting the microphone.
- **Visual Feedback**:
  - The tray icon changes to reflect the microphone status.
  - A small GUI window appears when the microphone is muted, which is positioned based on the coordinates in `xpos` and `ypos` in the `settings.ini`.
- **Audio Feedback**: The script plays the audio files (`muteX.mp3` and `unmuteX.mp3`) when muting or unmuting, depending on the selected soundpack.

## Audio Files

  The following audio files are used to provide feedback for muting and unmuting the microphone. You can listen to sample files here:

    - [mute1.mp3]((https://github.com/TheNave8or/MicMute/raw/main/mute1.mp3)/): Audio cue played when the microphone is muted.
    - [mute2.mp3](https://github.com/TheNave8or/MicMute/raw/main/mute2.mp3/): Alternative audio cue played when the microphone is muted (used based on the selected soundpack).
    - [unmute1.mp3](https://github.com/TheNave8or/MicMute/raw/main/unmute1.mp3/) Audio cue played when the microphone is unmuted.
    - [unmute1.mp3](https://github.com/TheNave8or/MicMute/raw/main/unmute2.mp3/): Alternative audio cue played when the microphone is unmuted (used based on the selected soundpack).

## Default hotkeys

- `F1`: Toggle microphone mute/unmute (or the key set in `settings.ini`).
- `F2`: Toggle silent mode on/off (or the key set in `settings.ini`).
- `Right Alt`: Instantly stops any sound playing.

## Customization

You can customize the script further by editing the `settings.ini` file or modifying the script directly. Adjust the GUI's appearance, change the icons, or swap out the audio files to better suit your preferences.
