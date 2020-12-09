$in = get-content .\Day6\input.txt 
$thisgroup = @()
$counts = 0
$in | foreach-object -process {
    
    if ($_ -ne "")
    {
        $thisgroup += $_.ToCharArray()
    }
    else
    {
        # join them into a single array, select, count and record the unique items
        $flatgroup = @()
        foreach ($row in $thisgroup)
        {
            $flatgroup = $flatgroup + $row
        }
        $uniqueAnswers = (-join $flatgroup).ToCharArray() | Select-Object -Unique
        Write-Verbose $uniqueAnswers.Count -verbose
        $Counts += $uniqueAnswers.count
        $thisgroup = @()
    }
} -End {
    # join them into a single array, select, count and record the unique items
    $flatgroup = @()
    # join to a single array
    foreach ($row in $thisgroup)
    {
        $flatgroup = $flatgroup + $row
    }
    # join the array to a single string,  make a charArray, then select the unique elements
    $uniqueAnswers = (-join $flatgroup).ToCharArray() | Select-Object -Unique
    Write-Verbose $uniqueAnswers.count -verbose
    # Count the elements and add to the sum
    $Counts += $uniqueAnswers.count
}

$Counts