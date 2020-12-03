$foo = get-content "C:\Users\jole001\Source\AdventOfCode2020\Day3\input.txt"
$Count = 0
$map = foreach ($row in $foo)
{
    $row #.ToCharArray()
}
$mod = $map[0].length
for ($i = 1; $i -lt $map.Count; $i++) {
    # Down 1, Over 3, Mod simulates the repeating pattern
    if ($map[$i][(($i * 3) % $mod)] -eq '#')
    {
        $Count++
    }
}
$count