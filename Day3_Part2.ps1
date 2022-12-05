$CodeInput = Get-Content .\input3.txt
$Array = @()
$Sum = 0
for ($i = 3; $i -le $CodeInput.count; $i += 3){
    $3Lines = $CodeInput[($i-3)..$i]
    $1 = [int[]][char[]]$3Lines[0]
    $2 = [int[]][char[]]$3Lines[1]
    $3 = [int[]][char[]]$3Lines[2]
    foreach ($Number in $1){
        if ($Number -in $2 -and $Number -in $3){
            if ($Number -le 90) {
                $Value = $Number - 38
            }
            else {
                $Value = $Number - 96
            }
            $Array += $Value
            $Sum += $Value
            break
        }
    }
}