$CodeInput = Get-Content .\input5.txt
[int[]]$Rows = $CodeInput[8].split("   ").trim()
$X = @{}

foreach ($Line in $CodeInput[0..7]) {
    $i = 0
    foreach ($Row in $Rows) {
        if ($Line.Substring($i * 4, 3).trim() -ne "") {
            [array]$X.($i + 1) += $Line.Substring($i * 4, 3)
        }
        $i ++
    }
}

foreach ($Line in $CodeInput[10..($CodeInput.count)]) {
    [int[]]$Moves = $Line -split " " -replace '[^0-9]' | Where-Object { $_ -ne "" }
    [array]$Temp = $X.($Moves[1]) | Select-Object -first $Moves[0]
    [array]$X.($Moves[1]) = $X[$Moves[1]] | Select-Object -Skip $Moves[0]
    [array]::Reverse($Temp)
    if ([array]$X.($Moves[2])) {
        [array]$X.($Moves[2]) = $Temp + [array]$X.($Moves[2])
    }
    else {
        [array]$X.($Moves[2]) = $Temp
    } 
}