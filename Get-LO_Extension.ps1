#Get-ADUser -filter {(Title -like "Local Loan Officer" -or Title -like "National Loan Officer" -or Title -like "National Loan Officer Supervisor") -and (Department -like "Loan Loan Officers" -or Department -like "National Loan Officers")} -Properties telephoneNumber | Select-Object Name,telephoneNumber


$titles = @("National Loan Officer", "Local Loan Officer", "National Loan Officer Supervisor")
$LoList = @()
foreach($title in $titles){
    $LOs = Get-ADUser -Filter {Title -like $title} -Properties telephoneNumber | Select-Object name,telephoneNumber
    $LoList = $LoList + $LOs
}

$alfo = $LoList | Sort-Object -Property Name -Descending

$alfo