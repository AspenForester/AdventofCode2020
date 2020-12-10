$data = Get-Content C:\Users\jole001\Source\AdventOfCode2020\Day2\input.txt
$count = 0

# Regular expression to split up the input lines - adv: used named captures
[regex]$inputRegex = "(\d+)-(\d+) (\w): (\w+)$"

foreach($string in $data)
{
    $myMatches = $inputRegex.Matches($string)

    $minCount = $myMatches.groups[1].Value
    $maxCount = $myMatches.groups[2].Value
    $requiredLetter = $myMatches.groups[3].Value
    $pass = $myMatches.groups[4].Value

    # Should have used Group-Object!
    $rightLetters = $pass.ToCharArray().Where({$_ -eq $requiredLetter})

    # Because $true + $true = 2
    $count += ($rightLetters.count -ge $minCount -and $rightLetters.count -le $maxCount)

}

$count

