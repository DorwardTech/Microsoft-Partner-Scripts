# Config Settings
$AdminFirstName = "FILL ME IN"
$AdminLastName = "FILL ME IN"
$AdminUserName = "FILL ME IN"
# Set-MsolUserPassword : You must choose a strong password that contains 8 to 16 characters, a combination of letters, and at least one number or symbol.
$AdminPassword = "FILL ME IN"

$RCA = "Company Administrator" #DO NOT EDIT
$RCAID = "62e90394-69f5-4237-9190-012177145e10" #DO NOT EDIT

Get-MsolPartnerContract -All | Select-Object TenantId | ForEach-Object {
    $TenantId = $_.TenantId
    Get-MsolDomain -TenantId $TenantId | Where-Object {$_.Name -clike "*.onmicrosoft.com"} | ForEach-Object {

        $domain = $_.Name
        $upn = "$($AdminUserName)@$($domain)" 

        #Create User, If User Does Not Exist
        if ( -not (Get-MsolUser -TenantId $TenantId -UserPrincipalName $upn -ErrorAction SilentlyContinue)){
            Write-Output "Creating New User: $upn"
            New-MsolUser -TenantId $TenantId -UserPrincipalName $upn -DisplayName "$AdminFirstName $AdminLastName" -FirstName $AdminFirstName -LastName $AdminLastName
        }
        #Set Admin Password
        Write-Output "Setting password for $upn"
        Set-MsolUserPassword -TenantId $TenantId -UserPrincipalName $upn -NewPassword $AdminPassword -ForceChangePassword $False

        #Set GA Role, If Not Already Set
        if  ( -not (Get-MsolRoleMember -TenantId $TenantId -RoleObjectId $RCAID | Where-Object {$_.EmailAddress -clike $upn})){
            Write-Output "Adding $upn to Global Administrators"
            Add-MsolRoleMember -TenantId $TenantId -RoleMemberEmailAddress $upn -RoleName $RCA
        }
        
        Write-Output ""
    }
}