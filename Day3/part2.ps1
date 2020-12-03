$foo = get-content "C:\Users\jole001\Source\AdventOfCode2020\Day3\input.txt"
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
        Write-verbose "Slope = $right : $down" -verbose
        $Count = 0
        for ($i = 1; $i -lt $map.Count; $i++)
        {
            Write-Verbose "$(($i * $right) % $mod) : $($i * $down)" 
            if ( $down * $i -gt $map.Count) {break}
            # Down 1, Over 3, Mod simulates the repeating pattern
            if ($map[$i * $down][(($i * $right) % $mod)] -eq '#')
            {
                $Count++
            }
        }
        "Right $Right, Down $down = $count"
        $parts = $parts + $count
    }
}

$product = 1
$parts.ForEach({$product*= $_})
$product