# Config Settings
$AdminUserName = "FILL ME IN"

Get-MsolPartnerContract -All | Select-Object TenantId | ForEach-Object {
    $TenantId = $_.TenantId
    Get-MsolDomain -TenantId $TenantId | Where-Object {$_.Name -clike "*.onmicrosoft.com"} | ForEach-Object {

        $domain = $_.Name
        $upn = "$($AdminUserName)@$($domain)"
        
        Remove-MsolUser -TenantId $TenantId -UserPrincipalName $upn -Force
        Write-Output "Removed $upn From Microsoft 365 Users"

        Write-Output ""
    }
}