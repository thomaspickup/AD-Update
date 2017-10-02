# Created by Thomas Pickup 
# Latest Rev 02/10/2017
# ToDo: 
# Add in additional user fields in AD

# User Defined Variables
$csvlocation = "c:\ADUPDATE_TEST.csv"
$domain = "dc=domain,dc=com" 

# Imports
Import-Module ActiveDirectory 
 
# Loads in the CSV Containing User Info
$users = Import-Csv -Path $csvlocation
 
# Cycles through all users in CSV
foreach ($user in $users) {
	# Loads in account name from CSV and uses it to create a new user object which
	# we use to update
	$SamAc = $user.userPrincipalName
	$usertoupdate = Get-ADUser -Filter "sAMAccountName -eq '$SamAc'" -SearchBase $domain
 
	# Updates all values in $usertoupdate
	# Performs check to see if value exists before writing.
	if ($user.department -ne "") {
		$usertoupdate.department = $user.department
	}
 
	if ($user.telephoneNumber -ne "") {
		$usertoupdate.telephoneNumber = $user.telephoneNumber
	}
 
	if ($user.physicalDeliveryOfficeName -ne "") {
		$usertoupdate.physicalDeliveryOfficeName = $user.physicalDeliveryOfficeName
	}
 
	if ($user.title -ne "") {
		$usertoupdate.title = $user.title
	}
 
	if ($user.homePhone -ne "") {
		$usertoupdate.homePhone = $user.homePhone
	}
 
	if ($user.mobile -ne "") {
		$usertoupdate.mobile = $user.mobile
	}
 
	if ($user.extensionAttribute1 -ne "") {
		$usertoupdate.extensionAttribute1 = $user.extensionAttribute1
	}
 
	if ($user.extensionAttribute2 -ne "") {
		$usertoupdate.extensionAttribute2 = $user.extensionAttribute2
	}
 
	# Echo for debugging
	echo $usertoupdate
 
	# Sets user object to the user in the domain
	Set-ADUser -Instance $usertoupdate
}