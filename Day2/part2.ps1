$data = Get-Content C:\Users\jole001\Source\AdventOfCode2020\Day2\input.txt
$count = 0

# Regular expression to split up the input lines - adv: used named captures
[regex]$inputRegex = "(\d+)-(\d+) (\w): (\w+)$"

foreach($string in $data)
{
    $myMatches = $inputRegex.Matches($string)
    # Same parsing of the input line
    # But this time the first two values refer to positions
    $posOne = $myMatches.groups[1].Value
    $posTwo = $myMatches.groups[2].Value
    $requiredLetter = $myMatches.groups[3].Value
    $pass = $myMatches.groups[4].Value
    
    $array = $pass.ToCharArray()
    # The specified character shall be in exactly one of the locations.  input is 1-indexed
    if ($array[$posOne - 1] -eq $requiredLetter -xor $array[$posTwo - 1] -eq $requiredLetter)
    {
        $count++
    }
    else {
        write-verbose "$($array[$posOne - 1]) = $requiredLetter and $($array[$posTwo - 1]) =/= $requiredLetter"
    }
}

$count