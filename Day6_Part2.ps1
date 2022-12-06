$CodeInput = Get-Content .\input6.txt
#$CodeInput = "bvwbjplbgvbhsrlpgdmjqwftvncz"
[char[]]$Text = $CodeInput
$i = 0
foreach ($Char in $Text){
    $Length = ($Text[$i..($i+13)] | Select-Object -Unique).Count
    if ($Length -eq 14){
        write-host ($i+14) -ForegroundColor Red
        break
    }
    $i++
}