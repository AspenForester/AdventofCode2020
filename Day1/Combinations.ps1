<# 
if you think of it as a grid you don't have to evaluate every location, 
because a,b is the same as b,a, and we know that a,a and b,b aren't options either

 abcdefg
axoooooo
bxxooooo
cxxxoooo
dxxxxooo
exxxxxoo
fxxxxxxo
gxxxxxxx
We only need to evaluate the"o" locations

Looking for a + b to equal 2020
multiply a x b for the answer
#>

$data = get-content -Path .\Day1\inputdata.txt
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