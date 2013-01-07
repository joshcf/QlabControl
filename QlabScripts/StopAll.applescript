tell application "QLab"
	set cueList to current cue list of workspace 1
	set mySel to cues of cueList
	repeat with myCue in mySel
		if running of myCue and q type of myCue is not "Script" then
			stop myCue
		end if
	end repeat
end tell