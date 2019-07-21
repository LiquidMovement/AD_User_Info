#param ($x)
$x = read-host "Enter User Name"
Get-ADPrincipalGroupMembership $x | select Name > C:\Temp\$x.txt