$CodeInput = Get-Content .\input4.txt
<#$CodeInput = "2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8" -split "`n"
#>
$list = @()
foreach ($Line in $CodeInput){
    $1 = $Line.Split(',')[0]
    [int]$11 = $1.split('-')[0]
    [int]$12 = $1.split('-')[1]
    $2 = $Line.Split(',')[1]
    [int]$21 = $2.split('-')[0]
    [int]$22 = $2.split('-')[1]

    if ($11 -le $21 -and $12 -ge $22){
        $List += $Line
    }
    elseif ($21 -le $11 -and $22 -ge $12){
        $List += $Line
    }
}