$aduser = Get-ADUser -LDAPFilter "(name=*)" -SearchBase "OU=staff,DC=corp,DC=jbnutter,DC=com" -SearchScope OneLevel 
$ITUser = Get-ADUser -LDAPFilter "(name=*)" -SearchBase "OU=Information Technology,OU=staff,DC=corp,DC=jbnutter,DC=com" -SearchScope OneLevel 

Foreach ($user in $aduser) {
    $getuser = get-aduser -Identity $user -Properties description
    $nameofuser = $getuser.SamAccountName
    $supervisor = $getuser.description
    $email = $getuser.UserPrincipalName
    $groups = Get-ADPrincipalGroupMembership -Identity $user | Select-Object -ExpandProperty name
        foreach ($group in $groups) {
            Write-Output "$nameofuser,$supervisor,$email,$group" | Out-File c:\temp\emplist.txt -append
            }
    }

    Foreach ($user in $ituser) {
    $getuser = get-aduser -Identity $user -Properties description
    $nameofuser = $getuser.SamAccountName
    $supervisor = $getuser.description
    $email = $getuser.UserPrincipalName
    $groups = Get-ADPrincipalGroupMembership -Identity $user | Select-Object -ExpandProperty name
        foreach ($group in $groups) {
            Write-Output "$nameofuser,$supervisor,$email,$group" | Out-File c:\temp\emplist.txt -append
            }
    }


    Write-Host "Browse to c:\temp\emplist.txt for output"
    Pause