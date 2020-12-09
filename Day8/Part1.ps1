$in = get-content ".\Day8\input-corrected.txt"

$linesExecuted = @()
$thisLineNumber = 0
[int]$accumulator = 0
$CommandParser = [regex]"^(?<Operation>nop|acc|jmp) (?<argument>[+-]\d+$)"

while ($thisLineNumber -notin $linesExecuted) {
    $m = $CommandParser.Match($in[$thisLineNumber])
    $linesExecuted = $linesExecuted + $thisLineNumber
    switch ($m.Groups["Operation"].value) {
        acc { 
            $accumulator = $accumulator + [int]($m.Groups["argument"].value)
            $thisLineNumber++
        }
        jmp {
            $thisLineNumber += [int]($m.Groups["argument"].value)
        }
        nop {
            $thisLineNumber++
        }
        Default { Throw "Operation [$($m.Groups["Operation"].value)] is not expected"}
    }
}
$accumulator