[int[]]$data = get-content -Path .\Day1\inputdata.txt
$start = 1
$iterations = 0
foreach ($item in $data)
{
    foreach ($other in $data[$start..($data.count-1)])
    {
        $iterations++
        #"$item === $other"
        if ($item + $other -eq 2020)
        { 
            #"$item + $other = $($item + $other)"
            #"in $iterations iterations"
            "$item x $other = $($item * $other)"
            return
        }
    }
    $start++
}