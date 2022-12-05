$CodeInput = Get-Content .\input2.txt
$Score = 0
foreach ($Line in $CodeInput){
    $DeltaScore = 0
    $Player1 = $Line.split(" ")[0]
    $Player2 = $Line.split(" ")[1]
    Switch ($Player1) {
        "A" { $Player1Number = 1}
        "B" { $Player1Number = 2}
        "C" { $Player1Number = 3}
    }    

    if ($Player2 -eq "X"){
        $Temp = $Player1Number-1
        if ($Temp -eq 0){
            $Temp = 3
        }
        $DeltaScore += $Temp
    }
    elseif ($Player2 -eq "Y"){
        $DeltaScore += 3
        $DeltaScore += $Player1Number
    }
    elseif ($Player2 -eq "Z"){
        $Temp = $Player1Number+1
        if ($Temp -eq 4){
            $Temp = 1
        }
        $DeltaScore += 6+$Temp
    }
    Write-Host $Line $DeltaScore
    $Score += $DeltaScore
}

#12062
