$CodeInput = Get-Content .\input6.txt
#$CodeInput = "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
[char[]]$Text = $CodeInput
$i = 0
foreach ($Char in $Text){
    $Length = ($Text[$i..($i+3)] | Select-Object -Unique).Count
    if ($Length -eq 4){
        write-host ($i+4) -ForegroundColor Red
        break
    }
    $i++
}