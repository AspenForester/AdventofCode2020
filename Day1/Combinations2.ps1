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

With part 2, it's technically 3D, but it works the same in that we don't need to
evaluate a,a,a, or b,c,a assuming we've evaluated a,b,c already

looking for an a + b + c = 2020
multiply a x b x c for the answer
#>
[int[]]$data = get-content -Path .\Day1\inputdata.txt
$start = 1
$iterations = 0
# This would be clearer as a for loop, like Tyler did it.
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