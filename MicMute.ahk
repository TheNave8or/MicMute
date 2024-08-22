#Include VA.ahk
#SingleInstance, Force
iniread, togglekey, settings.ini, settings, togglekey
iniread, silentkey, settings.ini, settings, silentkey
iniread, silent, settings.ini, settings, silent
iniread, gui_show, settings.ini, settings, gui_show
iniread, xpos, settings.ini, settings, xpos
iniread, ypos, settings.ini, settings, ypos
iniread, soundpack, settings.ini, settings, soundpack
iniread, micname, settings.ini, settings, micname
If (silentkey != "Error")
   Hotkey, %silentkey%, ToggleSilent
Hotkey, %togglekey%, ToggleMute

;Make sure the mic is on.
If !MicActive()
   ToggleMic()
Menu, Tray, Icon, MicOn.ico
Return

ToggleMute:
ToggleMic()
If MicActive() { ; Mic Active
   If (!silent)
      SoundPlay, unmute%soundpack%.mp3
   Gui, Destroy
   Menu, Tray, Icon, MicOn.ico
}
Else { ; Mic muted
   If (!silent)
      SoundPlay, mute%soundpack%.mp3
   GoSub, BuildGUI
   Menu, Tray, Icon, MicOff.ico
}
Return
Esc::ExitApp

ToggleSilent:
silent := !silent
If (silent) {
   SoundPlay, nonexistent.avi
   ToolTipMessage("Silent on", 1000)
}
If (!silent)
   ToolTipMessage("Silent off", 1000)
Return

BuildGUI:
Gui, +Border +Owner -Caption -MaximizeBox +AlwaysOnTop +LastFound +ToolWindow +E0x20
Gui, Color, 000000
Gui, Add, Picture, x0 y0 w40 h40, MicOff.ico
Gui, Show, NA x%xpos% y%ypos%
WinSet, TransColor, 000000
Return

;Toggles the mic mute state
ToggleMic() {
   VA_SetMasterMute(!VA_GetMasterMute(micname), micname)
   Return
}

;Returns true or false depending on the mic status (true for active, false for muted.)
MicActive() {
   Return !VA_GetMasterMute(micname)
}

;Displays a tooltip with a {message} for {timeinms} miliseconds in (x, y) (default sleep is 1400 ms)
ToolTipMessage(Message, TimeInMs := 1400, X := 0, Y := 0)
{
   if (X != 0) || (Y != 0)
   {
    ToolTip, %Message%, X, Y
    sleep %TimeInMs%
    ToolTip
   }
   Else
   {
    ToolTip, %Message%
    sleep %TimeInMs%
    ToolTip
   }
	 Return
}

; Right alt to instantly stop any sound playing
~RAlt::SoundPlay, nonexistent.avi