function Get-Combinations {
    [CmdletBinding()]
    param (
        [parameter()]
        [int64[]]
        $Set
    )

    for ($i = 0; $i -lt $set.Count -1; $i++) {
        for ($j = $i+1; $j -lt $set.Count; $j++) {
            [PSCustomObject]@{
                pair = @($set[$i],$Set[$j])
            }
        }
    }
}


$in = [int64[]](get-content ".\Day9\input.txt")
$round = 0

$preambleLength = 25
$previousSet = $in[0..($preambleLength -1)]
foreach ($item in $in[$preambleLength..($in.count - 1)])
{
    $combos = ( Get-Combinations -set $previousSet ).pair
    $sumSet = for ($k = 0; $k -lt $combos.Count; $k+=2) {
        $combos[$k] + $combos[$k+1]
    }
    If ($item -notin $sumSet)
    {
        "[$item] is not valid!"
        break 
    }


    $round++
    $previousSet = $in[$round..(($preambleLength -1 + $round))]
}

break
$sumSet = foreach ($pair in $firstCombos)
{
    $pair[0] + $pair[1]
}

$item = 40
If ($item -in $sumSet) {"Valid"}