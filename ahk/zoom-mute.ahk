; A system-wide mute toggle for Zoom Meetings.
; For auto-start, paste shortcut into C:\Users\[username]\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

$F9::
   ; Zoom appears not to accept ControlSend when in the background, so
   ; we isolate the Zoom and current windows, switch over to Zoom, send
   ; its own mute-toggle hotkey, and then switch back.
   ;
   ; Get the current window
   WinGet, active_window, ID, A
   ;
   ; First check if we're sharing our screen and capture the toolbar:
   zoom_window := WinExist("ahk_class ZPFloatToolbarClass")
   ;
   ; If we aren't sharing our screen, pull the Zoom window:
   if (zoom_window = "0x0") {
      zoom_window := WinExist("ahk_class ZPContentViewWndClass")
   }
   ;
   ; Do we know we have a zoom_window? If not, bail.
   if (zoom_window = "0x0") {
      Send {F9}
      return
   }
   ;
   ; Whichever we have, switch over to it:
   WinActivate, ahk_id %zoom_window%
   ;
   ; Toggle Mute
   Send !a
   ;
   ; Go back
   WinActivate ahk_id %active_window%
Return