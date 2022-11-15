$key = Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Enrollments\"



foreach ($keys in $key.GetSubKeyNames()) {
    
   
    if($keys -notmatch "Ownership" -and $keys -notmatch "Context" -and $keys -notmatch "PollOnLoginTasksCreated" -and $keys -notmatch "Status" -and $keys -notmatch "ValidNodePaths") {

        #Write-Host "Jeg sletter denne " $keys -ForegroundColor Red
        Remove-Item -Path HKLM:\SOFTWARE\Microsoft\Enrollments\$keys -Force -Recurse
    }
}


Gpupdate /force
