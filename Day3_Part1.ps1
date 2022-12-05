$CodeInput = Get-Content .\input3.txt
$Array = @()
$Sum = 0
foreach ($Line in $CodeInput) {
    $Length = $Line.Length
    [int[]][char[]]$1st = $Line.Substring(0, $Length / 2)
    [int[]][char[]]$2nd = $Line.Substring($Length / 2, $Length / 2)

    foreach ($Number in $1st) {
        if ($Number -in $2nd) {
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
