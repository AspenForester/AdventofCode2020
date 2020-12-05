$in = get-content ".\Day5\input.txt"

$allBoardingPasses = foreach ($item in $in) {
    # The first seven chars are the row, the last three are the columns
    $frontBack = $item[0..6] -join ''
    $leftright = $item[7..9] -join ''

    # Convert the Fs and Bs to 0s and 1s, respectively
    # The Replace METHOD uses regular expressions and thus is case sensitive.
    # Can I do it in just one Replace operation?
    $fbBin = $frontBack.Replace('F','0').Replace('B','1')
    $lrBin = $leftright.Replace('R','1').Replace('L','0')
    Write-verbose "[$frontBack] : [$leftright]"
    Write-Verbose "[$fbBin] : [$lrBin]"

    # Convert from binary to int32
    $row = [convert]::ToInt32($fbBin,2)
    $seat = [convert]::ToInt32($lrbin,2)
    
    # Calculate the seat's unique ID
    $seatID = ($row * 8) + $seat

    Write-verbose "[$item]: Row [$row], column [$seat], seat ID [$seatID]" 
    $seatID
}

$PossibleSeats = for ($row = 0; $row -lt 128; $row++) {
    for ($column = 0; $column -lt 8; $column++) {
        ($row * 8) + $column
    }
}

$unaccountedSeats = Compare-Object $PossibleSeats $allBoardingPasses | Select-Object -ExpandProperty inputObject

# We know that there are rows that don't exist
# so we can eliminate a row at a time
# or is there another way to find the non-contiguous number?

# 