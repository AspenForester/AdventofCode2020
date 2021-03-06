$foo = get-content ".\Day3\input.txt"
$parts = @()
$map = foreach ($row in $foo)
{
    $row #.ToCharArray()
}
$mod = $map[0].length
foreach ($down in (1,2))
{
    foreach ($right in (1,3,5,7))
    {
        if ($down -eq 2 -and $right -eq 3){ break }
        Write-verbose "Slope = $right : $down" 
        $Count = 0
        for ($i = 1; $i -lt $map.Count; $i++)
        {
            Write-Verbose "$(($i * $right) % $mod) : $($i * $down)" 
            # The pattern doesn't repeat downward so we need to stop!
            if ( $down * $i -gt $map.Count) {break}
            # Down 1, Over 3, Mod simulates the repeating pattern
            if ($map[$i * $down][(($i * $right) % $mod)] -eq '#')
            {
                $Count++
            }
        }
        Write-verbose "Right $Right, Down $down = $count"
        $parts = $parts + $count
    }
}

# Multiply the list of tree counts together.
$product = 1
$parts.ForEach({$product*= $_})
$product