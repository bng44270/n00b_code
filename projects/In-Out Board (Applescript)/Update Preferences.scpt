
	set OKMsg to button returned of (display dialog "This will delete your current IOBoard Prefs file.  Continue?" buttons {"Yes", "No"} default button "No")
	if OKMsg is equal to "Yes" then
		
		set NewFile to (choose folder with prompt "Select the folder for In-Out-Board Data") as string
		tell application "Finder"
			if exists file "IOBoard Prefs" of preferences folder then
				delete file "IOBoard Prefs" of preferences folder
			end if
		end tell
		
		set FileNo to (open for access (LocalHD & ":System Folder:Preferences:IOBoard Prefs") with write permission)
		write NewFile to FileNo
		close access FileNo
	end if