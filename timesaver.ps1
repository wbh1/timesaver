#####---------------------------------------------------------------------------------------#####
# Most of the code in this script has been borrowed from google and dlehrman's AccountsTool.ps1 #
#####---------------------------------------------------------------------------------------#####

# initiate function for an in or out punch
function onePunch($luid, $pass) {
    python .\timesaver_io.py $luid $pass;
}

# initiate functions for lunch
function teaTime($luid, $pass) {
    python .\timesaver_occlunch.py $luid $pass;
}

function getFat($luid, $pass){
	python .\timesaver_lunch.py $luid $pass;
}

# initiate functions to clock in and out for the entire day
function longHaul() {
    onePunch($luid, $pass);
    Start-Sleep 18000 # sleep for 5 hours
    teaTime($luid, $pass);
    Start-Sleep 18000 # sleep for 5 hours
    onePunch($luid, $pass);
    goHomeBuck;
}
	
function normies() {
    onePunch($luid, $pass);
    Start-Sleep 14400 # sleep for 4 hours
    getFat($luid, $pass);
    Start-Sleep 14400 # sleep for 4 hours
    onePunch($luid, $pass);
    goHomeBuck;
}

# initialize function to exit 
function goHomeBuck() {
    # kick back and pop a top
	Exit;
}

# initiate function for main menu
function mainMenu() {
    cls;
    Write-Host "`n`t1. Clock in or out. Single timepunch."
    Write-Host "`t2. OCC Lunch, 3 minutes."
	Write-Host "`t3. Lunch, 1 hour."
    Write-Host "`t4. OCC Shift. 10 hours."
	Write-Host "`t5. Normal Shift. 8 hours."
    Write-Host "`n`tX. Exit.`n"
    $pickSomething = Read-Host -Prompt 'Pick something so we can get this over with';
    do {
		switch ($pickSomething) {
            1 { onePunch($luid, $pass); mainMenu; }
            2 { teaTime($luid, $pass); mainMenu; }
            3 { getFat($luid, $pass); mainMenu; }
			4 { longHaul($luid, $pass); }
			5 { normies($luid, $pass); }
            X {break}
			default {mainMenu}
        }
	} while ($pickSomething -eq "")
    goHomeBuck;
}

# main
cls;
$luid = read-host -prompt 'LUID';
$pass = read-host -assecurestring -prompt 'Password';
$pass = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass));
mainMenu;
goHomeBuck;