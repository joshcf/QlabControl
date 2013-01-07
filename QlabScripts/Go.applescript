property oscport : "8000"
property osclabel : "/1/cue"
property osccommand : "sendOSC -h localhost "

tell application "QLab"
	tell front workspace
		go
		tell current cue list
			set label to q name of playback position
		end tell
	end tell
end tell

set my_osc to osccommand & oscport & " " & osclabel & "," & "\"" & label & "\""
do shell script my_osc