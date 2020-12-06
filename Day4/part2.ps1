$in = get-content .\day4\input.txt 


$passports = @()
$thisPassport = $null

# Get each Passport onto a single line
$in | ForEach-Object -Process {
    if ($_ -ne '')
    {
        $thisPassport = $thisPassport + $_ + " "
    }
    else
    {
        $passports = $passports + $thisPassport
        $thisPassport = $null
    }
} -End {
    # How often do you use the -end parameter for ForEach-Object?
    $passports = $passports + ($thisPassport.trim())
}

# Create PSObjects representing each passport - because why not!
$passportObjects = foreach ($item in $passports)
{
    $passport = $item -split (' ') | where-object { $_ -like '*:*' }
    $thisobject = new-object -TypeName PSObject 
    foreach ($line in $passport)
    {
        $name, $value = $line.Split(':')
        $thisobject | Add-Member -MemberType NoteProperty -Name $name -Value $value
    }
    $thisobject
}
# This is a set of AND evaluations, so we don't have to 
# explicitly look for missing properties
($passportObjects |
    Where-Object byr -in (1920..2002) |
    where-object iyr -in (2010..2020) |
    where-object eyr -in (2020..2030) |
    where-object ecl -in ('amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth') |
    where-object hcl -match "#[0-9a-f]{6}$" |
    where-object hgt -match "^1[5-8]\dcm|19[0-3]cm|59in|6\din|7[0-6]in$" |
    where-object pid -Match "^\d{9}$" ).count
# And we just don't care if there's a cid property or not
