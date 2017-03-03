﻿; A system-wide mute toggle for Zoom Meetings.

F9::
   ; Zoom appears not to accept ControlSend when in the background, so
   ; we isolate the Zoom and current windows, switch over to Zoom, send
   ; its own mute-toggle hotkey, and then switch back.
   ;
   ; Get the current window
   WinGet, active_window, ID, A
   ;
   ; Get a video/screenshare in a window
   WinGet, zoom_window, ID, ahk_class ZPContentViewWndClass
   WinActivate, ahk_id %zoom_window%
   ;
   ; Toggle Mute
   Send !a
   ;
   ; Go back
   WinActivate ahk_id %active_window%
Return