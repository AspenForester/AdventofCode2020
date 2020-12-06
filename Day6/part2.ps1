$in = get-content .\Day6\input.txt 
$thisgroup = @()
$counts = 0
$memberCount = 0
$in | foreach-object -process {
    if ($_ -ne "")
    {
        $memberCount++
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
        $allAnswers = (-join $flatgroup).ToCharArray()
        $answerGroups = $allAnswers | Group-Object -NoElement
        # This gets ugly because we have arrays of objects that have a "count" property
        [array]$countableAnswers = ([array]$answerGroups) | Where-Object count -eq $memberCount
        Write-Verbose $countableAnswers.Count -verbose
        $Counts += $countableAnswers.Count
        # Reset the group
        $thisgroup = @()
        $memberCount = 0
    }
} -End {
    # join them into a single array, select, count and record the unique items
    $flatgroup = @()
    # join to a single array
    foreach ($row in $thisgroup)
    {
        $flatgroup = $flatgroup + $row
    }
    $allAnswers = (-join $flatgroup).ToCharArray()
    $answerGroups = $allAnswers | Group-Object -NoElement
    # This gets ugly because we have arrays of objects that have a "count" property
    [array]$countableAnswers = ([array]$answerGroups) | Where-Object count -eq $memberCount
    Write-Verbose $countableAnswers.Count -verbose
    $Counts += $countableAnswers.count
}

$Counts