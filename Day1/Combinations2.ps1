$data = get-content -Path D:\Users\JB\Documents\Source\Advent2020\Day1\inputdata.txt
$start = 1
$iterations = 0
foreach ($item in $data)
{
    foreach ($other in $data[$start..($data.count - 1)])
    {
        foreach ($again in $data[($start+1)..($other.count - 1)])
        {
            $iterations++
            #"$item === $other"
            if (([int]$item + [int]$other + [int]$again) -eq 2020)
            { 
                "$([int]$item) + $([int]$other) + $([int]$again) = $([int]$item + [int]$other + [int]$again)"
                #"in $iterations iterations"
                "$([int]$item) x $([int]$other) x $([int]$again) = $([int]$item * [int]$other * [int]$again)"
                return
            }
        }
    }
    $start++
}