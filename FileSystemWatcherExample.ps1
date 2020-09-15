### KIES DIRECTORY
    $fileSystemWatcher = New-Object System.IO.FileSystemWatcher
    $fileSystemWatcher.Path = "C:\Users\eamza\Documents\Projects\FileSystemWatcher\TestDirectory1"
    $fileSystemWatcher.Filter = "*.*"
    ##$fileSystemWatcher.IncludeSubdirectories = $true
    $fileSystemWatcher.EnableRaisingEvents = $true
    

### DEFINIEER EEN ACTIE
    $actionOnEvent = { 
        $destinationPath = "C:\Users\eamza\Documents\Projects\FileSystemWatcher\TestDirectory2\"
        $path = $Event.SourceEventArgs.FullPath
            Copy-Item $path $destinationPath
        $changeType = $Event.SourceEventArgs.ChangeType
        $logline = "$(Get-Date), $changeType, $path"
            Add-content "C:\Users\eamza\Documents\Projects\FileSystemWatcher\Logging\log.txt" -value $logline              
              }    

### VOER ACTIE UIT WANNEER EVENT OPTREEDT
Register-ObjectEvent $fileSystemWatcher "Created" -Action $actionOnEvent