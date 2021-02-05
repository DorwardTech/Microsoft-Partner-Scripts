# Microsoft-Partner-Scripts
Unofficial Powershell Scripts for Microsoft Partners / CSP

### Pre Requirements 

https://docs.microsoft.com/en-us/microsoft-365/enterprise/connect-to-microsoft-365-powershell?view=o365-worldwide#step-1-install-the-required-software-1

Open Powershell as Administrator
Run the following command:

"Install-Module MSOnline"
If you're prompted to install the NuGet provider, type Y and press Enter.
If you're prompted to install the module from PSGallery, type Y and press Enter.

Once Prerequirements have been met:
- navigate powershell to the location you un-zipped the files
- run: "Connect-MsolService"

This will bring a login prompt, login using and Global Administrator Account that has Access to Partner Center
This will either show you an error or just continue to a new line, if error, check the account has GA & Partner Center Access

#### --NOTE LEAVE THIS POWERSHELL WINDOWS OPEN SEE BELOW USAGE--

### Usage ADD NEW GA

Right Click on "ADD Global Admin To ALL Tenants.ps1" and edit with notepad and edit the following values

- $AdminFirstName = "FirstName" - First Name of NEW Admin Account
- $AdminLastName = "LastName" - Last Name of NEW Admin Account
- $AdminUserName = "UserName" - Username of NEW Admin Account
- $AdminPassword = "SetMeToSomeThing9#$" - Password of NEW Admin Account 
NOTE: You must choose a strong password that contains 8 to 16 characters, a combination of letters, and at least one number or symbol.

Save the file
Go Back to the Powershell Window From Prerequirements
Type: '.\ADD Global Admin To ALL Tenants.ps1'

This will run through every tenant and add a new Global Administrator to everyone that your partner account has access to
If you see red errors pop-up on the screen, Usually its permissions.

### Usage Remove GA

If you would like to bulk remove the Global Administrators you just created

Right Click on "REMOVE Global Admin from ALL Tenants.ps1" and edit with notepad and edit the following values

- $AdminUserName = "Username" - In The Example of adding accounts using the script above, Type in the username you used previously.

Save the file
Go Back to the Powershell Window From Prerequirements
Type: '.\REMOVE Global Admin from ALL Tenants.ps1'
