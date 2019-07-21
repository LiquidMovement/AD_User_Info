$aduser = Get-ADUser -LDAPFilter "(name=*)" -SearchBase "OU=XXXX,DC=XXXX,DC=XXXX,DC=XXXX" -SearchScope OneLevel | Select-Object -ExpandProperty SamAccountName
$standard = "****Normal user from XXXX OU**** `n"
$ITUser = "`n ****IT User from XXXX OU**** `n"

$standard | Out-File -FilePath c:\temp\useremails.txt -Append


Foreach ($user in $aduser) {
    $email = Get-ADUser -Identity $user | Select-Object -ExpandProperty UserPrincipalName
    $count = $count+1
    Write-Output "$email" 
    $email | Out-File -FilePath c:\temp\useremails.txt -Append

    }

$ITUser | Out-File -FilePath c:\temp\useremails.txt -Append
    
$aduser2 = Get-ADUser -LDAPFilter "(name=*)" -SearchBase "OU=XXXX,OU=XXXX,DC=XXXX,DC=XXXX,DC=XXXX" -SearchScope OneLevel | Select-Object -ExpandProperty SamAccountName

Foreach ($user in $aduser2) {
    $email = Get-ADUser -Identity $user | Select-Object -ExpandProperty UserPrincipalName
    $count = $count+1
    Write-Output "$email" 
    $email | Out-File -FilePath c:\temp\useremails.txt -Append

    }

Write-Output "`n total users: $count"
"`n total users: $count" | out-file -FilePath c:\temp\useremails.txt -Append