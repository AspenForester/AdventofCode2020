$in = get-content .\Day4\input.txt 
$requiredProperties = ('byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid')
$Count = 0
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

# Create PSObjects representing each passport
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

# Validate the passports have the 7 required properties
foreach ($item in $passportObjects)
{
    # Compare the properties of each passport to the list of required properties, ignoring cid.
    if (-not (Compare-Object -ReferenceObject ($item.psobject.Properties.name.where({$_ -ne 'cid'})) -DifferenceObject $requiredProperties))
    {
        $count++
    }
}
$count