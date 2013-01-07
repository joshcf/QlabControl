property oscport : "8000"
property osclabel : "/1/level"
property osccommand : "sendOSC -h localhost "

set changeAmount to "-2"

tell application "QLab"
	set theSelection to selected of front workspace
	repeat with eachCue in theSelection
		if q type of eachCue is "Audio" or q type of eachCue is "Fade" then
			tell front workspace
				set currentLevel to eachCue getLevel row 0 column 0
				set newLevel to currentLevel + changeAmount
				eachCue setLevel row 0 column 0 db newLevel
			end tell
		end if
	end repeat
end tell

set my_osc to osccommand & oscport & " " & osclabel & "," & "\"" & newLevel & "\""
do shell script my_osc