$in = [int64[]](get-content ".\Day9\input.txt")

[int64]$flaw = 3199139634
#[int64]$flaw = 127


for ($i = 0; $i -lt $in.Count; $i++)
{
    # The index to start from
    $collectionToSum = @()
    [int64]$mySum = 0
    $j = $i
    while ($mySum -lt $flaw)
    {
        $collectionToSum += $in[$j]
        $mySum += $in[$j]
        $j++
    } 

    #"The sum of [$($collectionToSum -join ", ")] is $mySum"
    if ($mySum -eq $flaw)
    {
        $collectionToSum -join ", "
        $collectionToSum = $collectionToSum | Sort-Object
        $magicNumber = $collectionToSum[0] + $collectionToSum[-1]
        
        "The Magic number is: $magicNumber"
        break 
    }
    
}
