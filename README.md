# Active Directory Update
This repository houses a Powershell Script to update an Active Directory with data from a CSV file. 

## Example Usage
To use this script you need to provide two pieces of data at the top of the script. These are:

~~~~powershell
# User Defined Variables
$csvlocation = "c:\ADUPDATE_TEST.csv"
$domain = "dc=domain,dc=com" 
~~~~

This will allow the script to run. An example CSV file can be seen below. Please note the headers on the CSV file must match those specified in the script!

| userPrincipalName | title      | department  | telephoneNumber | mobile      | physicalDeliveryOfficeName | 
| ----------------- | ---------- | ----------- | --------------- | ----------- | -------------------------- |
| thomaspickup      | Technician | ICT         | 01543 678213    | 07382475384 | Southwark Office - HQ      |
| josephhyed        | Director   | Engineering | 01543 678233    | 07382475392 | Ginger Street Site         |

The script then finds these user accounts on the Active Directory and updates the information related to them from the CSV file. 

Any information already in the directory will be overwritten if the script is provided with new information. Although the script allows to send a homePhone number the CSV file above would not override this data, this is the case for any field that is not included in the CSV file.

