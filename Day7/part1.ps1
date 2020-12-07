$in = get-content .\Day7\input.txt 

function bagsthathold
{
    [CmdletBinding()]
    param (
        [parameter(Position = 0)]
        [string]
        $heldColor,

        # inputdata
        [Parameter( )]
        [String[]]
        $Rules,

        # Recurse Switch
        [Parameter()]
        [Switch]
        $Recurse
    )

    write-verbose "Evaluating [$heldColor] bags" 
    $results = $rules | Where-Object { $_ -like "* $heldColor*" } | ForEach-Object { ($_ -split "bags")[0].Trim() }
    write-verbose "hold [$heldColor] bags" 
    if ($Recurse)
    {
        foreach ($result in $results)
        {
            $result
            bagsthathold -heldColor $result -Rules $Rules -Recurse 
        }
    }
    else {
        $results
    }
}

$bags = bagsthathold -heldColor "shiny gold" -Rules $in -Recurse | select-object -unique
$bags.count
$bags

# 50 is too low(?) - wrong for sure
