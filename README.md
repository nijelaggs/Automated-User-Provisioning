<h1>Automated User Provisioning</h1>


<h2>Description</h2>
Project consists of a simple PowerShell script that walks the user through "Automated User Provisioning", onboarding indiviudal users based on our organizations requirements. You can customize the variables in the script but this is what our organization needed. I have blurred out some variable values that should be utilized by the user of this script. Please ensure that you change things such as the organzational unit, password, and domains as they will differ organzation to organization.

<h2>Languages and Utilities Used</h2>

- <b>Powershell</b> 

<h2>Environments Used </h2>

- <b>Windows 10</b> (21H2)

<h2>Program walk-through:</h2>

<p align="center">
Launch the Powershell ISE in Admin Mode: <br/>
<img src="https://drive.google.com/file/d/1f7lVQK9Z3MIkYIU4uix4sY1HhBkUT2kk/view?usp=sharing.png" height="100%" width="100%" alt="Launch Powershell in Admin Mode"/>
<br />
<br />
Download and open the - "Adding Users to Active Directory" Script:  <br/>
<img src="https://imgur.com/a/0Qu9EQr.png" height="80%" width="80%" alt="Download and open - Adding Users to Active Directory Script"/>
<br />
<br />
At the top - press the green arrow to run the script: <br/>
<img src="https://imgur.com/a/0Qu9EQr.png" height="80%" width="80%" alt="At the top - press the green arrow to run the script"/>
<br />
<br />
Enter the department and user first and last name as see below then press enter:  <br/>
<img src="https://drive.google.com/file/d/1tsdi_JMLOxKs1yv68lIei5YdtbdoDHeV/view?usp=sharing" height="80%" width="80%" alt="Enter the department and user first and last name as see below then press enter"/>
<br />
<br />
Enter the user first and last name again, then press enter:  <br/>
<img src="https://drive.google.com/file/d/1DVl3geC_PIlT2oKKrTxg7TrrSCPGox91/view?usp=sharing" height="80%" width="80%" alt="Enter the user first and last name again, then press enter"/>
<br />
<br />
There will be a printout of all the properties that have been changed and you're finished!:  <br/>
<img src="https://drive.google.com/file/d/1o1WhKJ9TdTBcAVboArpg7adEvsHiIE-2/view?usp=sharing" height="80%" width="80%" alt="There will be a printout of all the properties that have been changed and you're finished!"/>
<br />
<br />

<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>

