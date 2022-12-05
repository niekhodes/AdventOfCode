$CodeInput = Get-Content .\input.txt
$Elves = @()
$Ans = 0
$Cals = 0

foreach ($Line in $CodeInput) {
    if ($Line -match '[0-9]') {
        [int]$Cals += $Line
    }
    else {
        $Elves += $Cals
        $Cals = 0
    }
}
$Elves | Sort-Object -top 1 -Descending

$Top3 = $Elves | Sort-Object -top 3 -Descending
$Top3 | ForEach-Object { $Ans += $_ }
$Ans