Import-Module ActiveDirectory

$DisabledUsers = Search-AdAccount -AccountDisabled -SearchBase "OU=Disabled Users,DC=CORP,DC=JBNutter,DC=com"

ForEach ( $user in $DisabledUsers )
{
    $userID = $user.SamAccountName
    $groups = @((Get-aduser $userID -properties MemberOf).MemberOf)
    if ( $groups.Count -gt 1 ) { 
        ForEach ($group in $groups)
        {
            Write-Output "$userID	$group"
        }
    }
}