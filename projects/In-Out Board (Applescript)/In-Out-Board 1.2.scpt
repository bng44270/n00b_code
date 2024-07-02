set Options to {"In", "In a Meeting", "Out to Lunch", "Out on Business", "Out on Break", "Out for the Day", "Out Sick", "Out on Vacation", "Out Other"}

set IOTimes to {"8:00 AM", "8:30 AM", "9:00 AM", "9:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM", "12:00 PM", "12:30 PM", "1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", Â
	"3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM"}

set people to {} as list

set LocalHD to item 1 of (list disks) as string

set PrefFile to LocalHD & ":System Folder:Preferences:IOBoard Prefs" as alias

--Get Server Name
set FileNo to (open for access (PrefFile))
set ServerAlias to (read FileNo)
close access FileNo

set ListFile to ServerAlias & "UsrList" as alias
set UsrLogFile to ServerAlias & "UsrLog" as alias

set ViewOption to button returned of (display dialog "Welcome to In-Out-Board" buttons {"View All Users", "Personal Settings", "Quit"} default button "Quit")

if ViewOption is equal to "Personal Settings" then
	
	
	--Open Files
	set FileNo to (open for access (ListFile))
	set people to people & (read FileNo using delimiter return as string to (get eof FileNo)) as list
	close access FileNo
	
	choose from list people OK button name "Select User" cancel button name "Quit"
	
	if result is not equal to false then
		
		set MyName to result as string
		
		set MyStatusFile to ServerAlias & MyName & ":Status" as alias
		set MyPasswordFile to ServerAlias & MyName & ":passwd" as alias
		
		display dialog "Options:" buttons {"Change Status", "Change Password", "Quit"} default button "Quit"
		set Action to result
		
		if button returned of Action is equal to "Change Status" then
			set FileNo to (open for access MyPasswordFile)
			set CurPasswd to (read FileNo) as string
			close access FileNo
			set MyPasswd to (display dialog "Enter Password" default answer "")
			if MyPasswd is not equal to false then
				if (text returned of MyPasswd) is equal to CurPasswd then
					set FileNo to (open for access MyStatusFile)
					set PrevStat to (read FileNo) as string
					close access FileNo
					set FileNo to (open for access MyStatusFile with write permission)
					set eof FileNo to 0
					choose from list Options OK button name "Change and Quit"
					if result is not equal to false then
						set BeBack to result as string
						if BeBack is equal to "Out to Lunch" or BeBack is equal to "Out on Business" or BeBack is equal to "Out on Break" then
							choose from list IOTimes with prompt "When will you be back?" OK button name "Select"
							if result is not equal to false then
								set BeBack to BeBack & ", be back at " & result as string
								write (BeBack as string) to FileNo
								set LogNo to (open for access UsrLogFile with write permission)
								set LogStr to (return & MyName & ": " & BeBack & " at " & ((current date) as string) & return) as string
								write (LogStr as string) starting at (get eof LogNo) to LogNo
								close access LogNo
							else
								write (PrevStat as string) to FileNo
								set LogNo to (open for access UsrLogFile with write permission)
								set LogStr to (return & "Retaining Old Info:  " & MyName & ": " & BeBack & " at " & ((current date) as string)) as string
								write (LogStr as string) starting at (get eof LogNo) to LogNo
								close access LogNo
							end if
						else
							write (BeBack as string) to FileNo
							set LogNo to (open for access UsrLogFile with write permission)
							set LogStr to (return & MyName & ": " & BeBack & " at " & ((current date) as string) & return) as string
							write (LogStr as string) starting at (get eof LogNo) to LogNo
							close access LogNo
						end if
						
					else
						write (PrevStat as string) to FileNo
						write (PrevStat as string) to FileNo
						set LogNo to (open for access UsrLogFile with write permission)
						set LogStr to (return & "Retaining Old Info:  " & MyName & ": " & BeBack & " at " & ((current date) as string) & return) as string
						write (LogStr as string) starting at (get eof LogNo) to LogNo
						close access LogNo
					end if
					close access FileNo
				else
					display dialog "Incorrect Password" buttons {"OK"} default button "OK"
				end if
			end if
		else if button returned of Action is equal to "Change Password" then
			set FileNo to (open for access MyPasswordFile)
			set CurPasswd to (read FileNo) as string
			close access FileNo
			if CurPasswd is equal to "password" then
				set NewPasswd to (text returned of (display dialog "Enter New Password" default answer "")) as string
				set FileNo to (open for access MyPasswordFile with write permission)
				set eof FileNo to 0
				write (NewPasswd as string) to FileNo
				close access FileNo
				set LogNo to (open for access UsrLogFile with write permission)
				set LogStr to (return & MyName & ": Changed Password at " & ((current date) as string) & return) as string
				write (LogStr as string) starting at (get eof LogNo) to LogNo
				close access LogNo
				display dialog "Password Changed" buttons {"OK"} default button "OK"
			else
				set OldPasswd to (display dialog "Enter Old Password" default answer "")
				if result is not equal to false then
					if (text returned of OldPasswd) is equal to CurPasswd then
						set NewPasswd to (text returned of (display dialog "Enter New Password" default answer "")) as string
						set FileNo to (open for access MyPasswordFile with write permission)
						set eof FileNo to 0
						write (NewPasswd as string) to FileNo
						close access FileNo
						set LogNo to (open for access UsrLogFile with write permission)
						set LogStr to (return & MyName & ": Changed Password at " & ((current date) as string) & return) as string
						write (LogStr as string) starting at (get eof LogNo) to LogNo
						close access LogNo
						display dialog "Password Changed" buttons {"OK"} default button "OK"
					else
						display dialog "Incorrect Password.  You will retain your old password" buttons {"OK"} default button "OK"
						set FileNo to (open for access MyPasswordFile with write permission)
						set eof FileNo to 0
						write (CurPasswd as string) to FileNo
						close access FileNo
						set LogNo to (open for access UsrLogFile with write permission)
						set LogStr to (return & MyName & ": Change Password Failed at " & ((current date) as string) & return) as string
						write (LogStr as string) starting at (get eof LogNo) to LogNo
						close access LogNo
					end if
				end if
			end if
			
		end if
	end if
	
else if ViewOption is equal to "View All Users" then
	set UsrInfo to {}
	--Open Files
	set FileNo to (open for access (ListFile))
	set people to people & (read FileNo using delimiter return as string to (get eof FileNo)) as list
	close access FileNo
	
	set UsrCount to length of people
	
	set i to 1 as integer
	repeat with i from 1 to UsrCount
		set MyName to (item (i) of people) as string
		set MyStatusFile to ServerAlias & MyName & ":Status" as alias
		
		set FileNo to (open for access (MyStatusFile))
		set UsrInfo to UsrInfo & (MyName & ":  " & ((read FileNo) as string)) as list
		close access FileNo
	end repeat
	choose from list UsrInfo cancel button name "Quit" OK button name "" with prompt "All Users:"
	
end if

