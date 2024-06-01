

# ----- Edit these Variables for your own Use Case -----

$PASSWORD_FOR_USERS   = "#Change this variable#"

$OU_PATH             = "ou= #Change this variable# Sync,dc= #Change this variable# ,dc= #Change this variable#"  # Provide the correct path to your existing OU

# ------------------------------------------------------ #

 

$password = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force

 

# Prompt user for full name

$name = Read-Host "Enter the New User First and Last Name (e.g., Zig Ziggler)"

$first = $name.Split(" ")[0]

$last = $name.Split(" ")[1]

 

# Generate username and display name

$username = "$($first.Substring(0,1).ToLower())$($last.ToLower())"

$displayName = "$($first.Substring(0,1).ToUpper())$($first.Substring(1).ToLower()) $($last.Substring(0,1).ToUpper())$($last.Substring(1).ToLower())"

 

# Prompt user for department description

$department = Read-Host "What department will this user be in? (Please capitalize the first letter of each word)"

 

Write-Host "Creating user: $($username)" -BackgroundColor Black -ForegroundColor Cyan

Write-Host "Display Name: $($displayName)" -ForegroundColor Cyan

Write-Host "Username: $($username)" -ForegroundColor Cyan

Write-Host "Department: $department" -ForegroundColor Cyan

 

# Create the new AD user

New-AdUser -AccountPassword $password `

           -GivenName $first `

           -Surname $last `

           -DisplayName $displayName `

           -SamAccountName $username `

           -UserPrincipalName $username@domain.com `

           -EmployeeID $username `

           -Description $department `

           -PasswordNeverExpires $true `

           -Path $OU_PATH `

           -Enabled $true `

           -ScriptPath "#Change this variable#"

 

# Set the proxyAddresses attribute and primary email address

$primaryEmail = "$($first.Substring(0,1).ToLower())$($last.ToLower())@esprigas.com"

$proxyAddresses = "SMTP:$primaryEmail", "smtp:$($first.Substring(0,1).ToLower())$($last.ToLower())@domain.com"

Set-ADUser -Identity $username -Replace @{proxyAddresses=$proxyAddresses; mail=$primaryEmail}

 

# Add the user to the specified groups (checking membership first)

$groups =  "#Change this variable#", "#Change this variable#", "#Change this variable#"

foreach ($group in $groups) {

    if (-not (Get-ADGroupMember -Identity $group -ErrorAction SilentlyContinue | Where-Object { $_.SamAccountName -eq $username })) {

        Add-ADGroupMember -Identity $group -Members $username

        Write-Host "Added user $($username) to group $($group)"

    }

}

 

# Display additional information

Write-Host "User is a member of the following groups:"

Get-ADPrincipalGroupMembership -Identity $username | Select-Object -ExpandProperty Name

 

Write-Host "Logon script: Script.cmd"  # You can customize this based on your actual logon script

 

Write-Host "Proxy addresses created:"

$proxyAddresses

 
