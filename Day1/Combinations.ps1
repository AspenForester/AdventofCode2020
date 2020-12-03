$data = get-content -Path D:\Users\JB\Documents\Source\Advent2020\Day1\inputdata.txt
$start = 1
$iterations = 0
foreach ($item in $data)
{
    foreach ($other in $data[$start..($data.count-1)])
    {
        $iterations++
        #"$item === $other"
        if ([int]$item + $other -eq 2020)
        { 
            #"$item + $other = $($item + $other)"
            #"in $iterations iterations"
            "$item x $other = $([int]$item * $other)"
            return
        }
    }
    $start++
}