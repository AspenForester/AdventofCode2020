$in = get-content .\Day7\input.txt 

function bagsheldin
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

    write-verbose "Evaluating [$heldColor] bags" -Verbose
    # Find the rule for the given-colored bag
    $results = $rules | Where-Object { $_ -like "$heldColor*" } | foreach-object {
        # split out the collection of what this bag contains
        $bagsTherein = ($_ -split "bags contain ")[-1] -split ", "
        
        foreach ($item in $bagsTherein)
        {
            # It's always <x> <adj.> <color>
            $number = ($item -split " ")[0]
            if ($number -ne 'no')
            {
                [PSCustomObject]@{
                    number    = $number
                    fullColor = ($item -split " ")[1..2] -join " "
                }
            }
            # Else the bag doesn't contain anything and we output nothing for that color's bag
        }
    }

    # tally up the sum of the of the bags in this bag
    $sum = ($results | Measure-Object -property number -sum).sum

    write-verbose "hold [$heldColor] bags" 
    if ($Recurse)
    {
        $sum
        foreach ($result in $results)
        {
            # have to account for the number of bags in *EACH* bag, so multiply
            $ThisCount = bagsheldin -heldColor $result.fullColor -Rules $Rules -Recurse
            $ThisCount * $result.number
        }
    }
    else
    {
        $sum
    }
}

$bagcapacities = bagsheldin -heldColor "shiny gold" -Rules $in -Recurse

$bagcapacities # an array of bag capacities
$bagcapacities | Measure-Object -sum # sum those up
