tell application "Finder"
	if exists file "IOBoard Prefs" of preferences folder then
		delete file "IOBoard Prefs" of preferences folder
	end if
	
	duplicate file "IOBoard Prefs" of folder "IOBoard Setup" of disk Â
		"User Data" to preferences folder
	display dialog "Preferences Updated" buttons {"OK"} default button "OK"
end tell