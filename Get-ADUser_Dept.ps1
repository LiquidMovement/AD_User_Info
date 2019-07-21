$aduser = Get-ADUser -LDAPFilter "(name=*)" -SearchBase "OU=staff,DC=corp,DC=jbnutter,DC=com" -SearchScope OneLevel | Select-Object -ExpandProperty SamAccountName
$standard = "****Staff OU**** `n"

$standard | Out-File -FilePath c:\temp\userDept.txt -Append


Foreach ($user in $aduser) {
    $ext = Get-ADUser -Identity $user -Properties department | Select-Object -ExpandProperty department
    $userName = Get-ADUser -Identity $user -Properties name | Select-Object -ExpandProperty name
    $count = $count+1
    Write-Output "$ext" 
    "$userName | $ext" | Out-File -FilePath c:\temp\userDept.txt -Append

    }

Write-Output "`n total users: $count"
"`n total users: $count" | out-file -FilePath c:\temp\userDept.txt -Append