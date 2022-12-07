$CodeInput = Get-Content .\input7.txt
$Total = @{}
[array]$Ans = @()
$Folders = @{}
$Next = $Folders
foreach ($Line in $CodeInput) {
    #Calculate Size
    if ($Line -match 'cd' -and $Line -ne '$ cd /'){
        $Size = 0
        foreach ($File in $Next.GetEnumerator() ){
            $Size += $File.Value.Size
        }
        $Next.Size = $Size
        $Total.($Navigation -join '.') = $Size
    }
    #Navigate
    if ($Line -eq '$ cd /') {
        $Navigation = @()
        Continue
    }
    elseif ($Line -match 'cd [A-z]') {
        $Navigation += "$($Line.split(' ')[2])"
        $Next = $Next."$($Line.split(' ')[2])"
        Continue
    }
    elseif ($Line -eq '$ cd ..') {
        $Next = $Folders
        [array]$Navigation = ($Navigation | Select-Object -SkipLast 1)
        foreach ($Step in $Navigation) {
            $Next = $Next.$Step
        }
        Continue
    }
    elseif ($Line -eq '$ ls') {
        Continue
    }
    #Add folder or file to $Folders
    if ($Line -match 'dir') {
        $Next.($Line.split(' ')[1]) = @{Type = 'Folder'; Size = 0 }
    }
    else {
        $Next.($Line.split(' ')[1]) = @{Type = 'File'; Size = ($Line.split(' ')[0]) }
    }
}
#Calculate answer
$MinDelete = $Folders.Size - 40000000
foreach ($T in $Total.GetEnumerator()){
    if ($T.Value -ge $MinDelete){
        [array]$Ans += $T.Value
    }
}
$Ans | Sort-Object -Top 1