$CodeInput = Get-Content .\input8.txt
$ans = 0
$j = 0
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
            $AboveVisible = $true
            foreach ($AboveTree in $AboveTrees) {
                if ($AboveTree -ge $Tree) {
                    $AboveVisible = $false
                }
            }
            #Check below
            $BelowTrees = $CodeInput[($j + 1)..($CodeInput.count - 1)].substring($i, 1)
            $BelowVisible = $true
            foreach ($BelowTree in $BelowTrees) {
                if ($BelowTree -ge $Tree) {
                    $BelowVisible = $false
                }
            }
            #Check left
            $LeftTrees = $CodeInput[$j][0..($i-1)]
            $LeftVisible = $true
            foreach ($LeftTree in $LeftTrees) {
                if ($LeftTree -ge $Tree) {
                    $LeftVisible = $false
                }
            }
            #Check right
            $RightTrees = $CodeInput[$j][($i + 1)..($CodeInput.count - 1)]
            $RightVisible = $true
            foreach ($RightTree in $RightTrees) {
                if ($RightTree -ge $Tree) {
                    $RightVisible = $false
                }
            }
            #Check visibility
            if ($AboveVisible -or $BelowVisible -or $LeftVisible -or $RightVisible) {
                $ans ++
            }
        }
        $i ++
    }
    $j ++
}
$ans