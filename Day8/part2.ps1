$in = get-content ".\Day8\sample.txt"

$linesExecuted = @()
$thisLineNumber = 0
[int]$accumulator = 0
$CommandParser = [regex]"^(?<Operation>nop|acc|jmp) (?<argument>[+-]\d+$)"

# do
# {
    while ($thisLineNumber -notin $linesExecuted -and $thisLineNumber -lt $in.count)
    {
        $m = $CommandParser.Match($in[$thisLineNumber])
        $linesExecuted = $linesExecuted + $thisLineNumber
        switch ($m.Groups["Operation"].value)
        {
            acc
            { 
                $accumulator = $accumulator + [int]($m.Groups["argument"].value)
                $thisLineNumber++
            }
            jmp
            {
                $thisLineNumber += [int]($m.Groups["argument"].value)
            }
            nop
            {
                $thisLineNumber++
            }
            Default { Throw "Operation [$($m.Groups["Operation"].value)] is not expected" }
        }
    }

# } until ($thisLineNumber -ge $in.count)

"$($linesExecuted[-1] + 1) : [$($in[$linesExecuted[-1]])]"
$accumulator