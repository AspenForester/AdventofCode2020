$data = Get-Content C:\Users\jole001\Source\AdventOfCode2020\Day2\input.txt
$count = 0
[regex]$inputRegex = "(\d+)-(\d+) (\w): (\w+)$"

foreach($string in $data[0])
{
    $myMatches = $inputRegex.Matches($string)

    $minCount = $myMatches.groups[1].Value
    $maxCount = $myMatches.groups[2].Value
    $requiredLetter = $myMatches.groups[3].Value
    $pass = $myMatches.groups[4].Value
    
    $array = $pass.ToCharArray()

    $rightLetters = $array.Where({$_ -eq $requiredLetter})

    if ($rightLetters.count -ge $minCount -and $rightLetters.count -le $maxCount)
    {
        $count++
    }
}

$count

