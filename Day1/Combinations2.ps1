[int[]]$data = get-content -Path .\Day1\inputdata.txt
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
            if (($item + $other + $again) -eq 2020)
            { 
                "$($item) + $($other) + $($again) = $($item + $other + $again)"
                #"in $iterations iterations"
                "$($item) x $($other) x $($again) = $($item * $other * $again)"
                return
            }
        }
    }
    $start++
}