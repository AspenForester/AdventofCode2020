$in = get-content ".\Day8\input.txt"



$CommandParser = [regex]"^(?<Operation>nop|acc|jmp) (?<argument>[+-]\d+$)"

$ChangeIndex =0 # The nth jmp or nop encountered should be changed
do 
{
    [int]$accumulator = 0
    $thisLineNumber = 0
    $linesExecuted = @()
    $instructionIndex = 0 # The nth jmp/nop we've encountered so far
    while ($thisLineNumber -notin $linesExecuted -and $thisLineNumber -lt $in.count)
    {
        $m = $CommandParser.Match($in[$thisLineNumber])
        $linesExecuted = $linesExecuted + $thisLineNumber
        switch ($m.Groups["Operation"].value)
        {
            acc
            { 
                $accumulator = $accumulator + [int]($m.Groups["argument"].value)
                write-verbose "[$thisLineNumber] : [$($in[$thisLineNumber ])]" -verbose
                $thisLineNumber++
                
            }
            jmp
            {
                if ($instructionIndex -eq $ChangeIndex)
                {
                    # Switch to a NOP
                    $ChangedInstruction = $thisLineNumber
                    write-verbose "[$thisLineNumber] : nop [$(($m.Groups["argument"].value))]" -verbose
                    $thisLineNumber++
                }
                else {
                    write-verbose "[$thisLineNumber] : [$($in[$thisLineNumber ])]" -verbose
                    $thisLineNumber += [int]($m.Groups["argument"].value)
                }
                $instructionIndex++
                
            }
            nop
            {
                if ($instructionIndex -eq $ChangeIndex)
                {
                    $ChangedInstruction = $thisLineNumber
                    # Change to a jmp
                    write-verbose "[$thisLineNumber] : jmp [$(($m.Groups["argument"].value))]" -verbose
                    $thisLineNumber += [int]($m.Groups["argument"].value)
                }
                else
                {
                    write-verbose "[$thisLineNumber] : [$($in[$thisLineNumber ])]" -verbose
                    $thisLineNumber++
                }
                $instructionIndex++
            }
            Default { Throw "Operation [$($m.Groups["Operation"].value)] is not expected" }
        }
    }
    "Last line executed"
    "$($linesExecuted[-1] + 1) : [$($in[$linesExecuted[-1]])]"
    # Next time around change the nth jmp/nop
    $ChangeIndex++ 

} until ($thisLineNumber -ge $in.count)


if ($linesExecuted[-1] + 1 -eq $in.Count) {"Ran to completion!"}
"Accumulator: [$accumulator]"