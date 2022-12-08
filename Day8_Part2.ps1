$CodeInput = Get-Content .\input8.txt
$j = 0
$ScenicScores = @()
foreach ($Line in $CodeInput.trim()) {
    [char[]]$Line = $Line
    $Trees = $Line
    $i = 0
    foreach ($Tree in $Trees) {
        if ($j -eq 0 -or $j -eq ($codeinput.count-1) -or $i -eq 0 -or $i -eq ($codeinput.count-1)) {
            $ans ++
        }
        else {
            #Check above
            $AboveTrees = $CodeInput[0..($j - 1)].substring($i, 1)
            [array]::Reverse($AboveTrees)
            $AboveVisible = $true
            $ScenicScoreAbove = 0
            foreach ($AboveTree in $AboveTrees) {
                $ScenicScoreAbove ++
                if ($AboveTree -ge $Tree) {
                    $AboveVisible = $false
                    break
                }
            }
            #Check below
            $BelowTrees = $CodeInput[($j + 1)..($CodeInput.count - 1)].substring($i, 1)
            $BelowVisible = $true
            $ScenicScoreBelow = 0
            foreach ($BelowTree in $BelowTrees) {
                $ScenicScoreBelow ++
                if ($BelowTree -ge $Tree) {
                    $BelowVisible = $false
                    break
                }
            }
            #Check left
            $LeftTrees = $CodeInput[$j][0..($i-1)]
            $ScenicScoreLeft = 0
            [array]::Reverse($LeftTrees)
            $LeftVisible = $true
            foreach ($LeftTree in $LeftTrees) {
                $ScenicScoreLeft ++
                if ($LeftTree -ge $Tree) {
                    $LeftVisible = $false
                    break
                }
            }
            #Check right
            $RightTrees = $CodeInput[$j][($i + 1)..($CodeInput.count - 1)]
            $RightVisible = $true
            $ScenicScoreRight = 0
            foreach ($RightTree in $RightTrees) {
                $ScenicScoreRight ++
                if ($RightTree -ge $Tree) {
                    $RightVisible = $false
                    break
                }
            }
            #Check visibility
            if ($AboveVisible -or $BelowVisible -or $LeftVisible -or $RightVisible) {
                $ans ++
            }
            [array]$ScenicScores += ($ScenicScoreAbove * $ScenicScoreBelow * $ScenicScoreLeft * $ScenicScoreRight)
        }
        $i ++
    }
    $j ++
}
$ScenicScores | Sort-Object -Descending -top 1