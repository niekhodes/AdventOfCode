$CodeInput = Get-Content .\input4.txt
$list = @()
foreach ($Line in $CodeInput){
    $1 = $Line.Split(',')[0]
    [int]$11 = $1.split('-')[0]
    [int]$12 = $1.split('-')[1]
    $2 = $Line.Split(',')[1]
    [int]$21 = $2.split('-')[0]
    [int]$22 = $2.split('-')[1]

    if ($12 -ge $21 -and $11 -le $22){
        $List += $Line
    }
    elseif ($22 -ge $11 -and $21 -le $12){
        $List += $Line
    }
}