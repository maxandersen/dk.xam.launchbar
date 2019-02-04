-- Inspired by:
-- https://gist.github.com/adgedenkers/3874427

on handle_string(vpnName)
  tell application "System Events"
    tell current location of network preferences
      set VPNservice to service vpnName
      set isConnected to connected of current configuration of VPNservice
      if isConnected then
        disconnect VPNservice
      else
        connect VPNservice
      end if
    end tell
  end tell
end handle_string
