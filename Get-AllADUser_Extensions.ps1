$aduser = Get-ADUser -LDAPFilter "(name=*)" -SearchBase "OU=XXXX,DC=XXXX,DC=XXXX,DC=XXXX" -SearchScope OneLevel | Select-Object -ExpandProperty SamAccountName
$standard = "****Normal user from XXXX OU**** `n"
$ITUser = "`n ****IT User from XXXX OU**** `n"

$standard | Out-File -FilePath c:\temp\userext.txt -Append


Foreach ($user in $aduser) {
    $ext = Get-ADUser -Identity $user -Properties telephoneNumber | Select-Object -ExpandProperty telephoneNumber
    $userName = Get-ADUser -Identity $user -Properties name | Select-Object -ExpandProperty name
    $count = $count+1
    Write-Output "$ext" 
    "$userName $ext" | Out-File -FilePath c:\temp\userext.txt -Append

    }

$ITUser | Out-File -FilePath c:\temp\userext.txt -Append
    
$aduser2 = Get-ADUser -LDAPFilter "(name=*)" -SearchBase "OU=XXXX,OU=XXXX,DC=XXXX,DC=XXXX,DC=XXXX" -SearchScope OneLevel | Select-Object -ExpandProperty SamAccountName

Foreach ($user in $aduser2) {
    $ext = Get-ADUser -Identity $user -Properties telephoneNumber | Select-Object -ExpandProperty telephoneNumber
    $userName = Get-ADUser -Identity $user -Properties name | Select-Object -ExpandProperty name
    $count = $count+1
    Write-Output "$ext" 
    "$userName $ext" | Out-File -FilePath c:\temp\userext.txt -Append

    }

Write-Output "`n total users: $count"
"`n total users: $count" | out-file -FilePath c:\temp\userext.txt -Append