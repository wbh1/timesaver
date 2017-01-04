###
#
# Totes stole this script from here: http://www.systemcentercentral.com/automating-application-installation-using-powershell-without-dsc-oneget-2/
#
###

$source = 'C:\source' 

If (!(Test-Path -Path $source -PathType Container)) {New-Item -Path $source -ItemType Directory | Out-Null} 
 
$packages = @( 
@{title='Python 3.5.2';url='https://www.python.org/ftp/python/3.5.2/python-3.5.2.exe';Arguments='/passive';Destination=$source}
) 
 
 
foreach ($package in $packages) { 
        $packageName = $package.title 
        $fileName = Split-Path $package.url -Leaf 
        $destinationPath = $package.Destination + "\" + $fileName 
 
If (!(Test-Path -Path $destinationPath -PathType Leaf)) { 
 
    Write-Host "Downloading $packageName" 
    $webClient = New-Object System.Net.WebClient 
    $webClient.DownloadFile($package.url,$destinationPath) 
    } 
    }
 
 
#Once we've downloaded all our files lets install them. 
foreach ($package in $packages) { 
    $packageName = $package.title 
    $fileName = Split-Path $package.url -Leaf 
    $destinationPath = $package.Destination + "\" + $fileName 
    $Arguments = $package.Arguments 
    Write-Output "Installing $packageName" 
 
 
Invoke-Expression -Command "$destinationPath $Arguments" 
}

###
#
# Below is OC, jrhorner1
#
###

#Now that all thats done lets install pip and selenium

$gimmeCandies = read-host 'press F to show respect'