param (
    [string]$mod_version,
    [string]$spt_version
)

# Define the release directory
$releaseDir = ".\release"

# Create release directory if it doesn't exist
if (-Not (Test-Path -Path $releaseDir)) {
    New-Item -ItemType Directory -Path $releaseDir -Force
}

# Create directory names within the release directory
$baseDir = "$releaseDir\wtt-realism-compatibility_${mod_version}_SPT-v${spt_version}"

# Define the inner directory structure
$innerDir = "user\mods\SPT-Realism\db\put_new_stuff_here\WTT Weapons"

# Create the directories
New-Item -ItemType Directory -Path "$baseDir\$innerDir" -Force

# Define the list of files to move
$filesToMove = @(
    'WTT Weapons\Arisaka_Type_99.json',
    'WTT Weapons\Barrett_M107A1.json',
    'WTT Weapons\Beretta_ARX160.json',
    'WTT Weapons\Desert_Eagle.json',
    'WTT Weapons\Hoshizora_SCAR_17.json',
    'WTT Weapons\IWI_Tavor_X95.json',
    'WTT Weapons\Remington_ACR.json',
    'WTT Weapons\Remington_R5.json'
    'WTT Weapons\Zastava_M76.json'
)

# Move files to both directories
foreach ($file in $filesToMove) {
    Copy-Item -Path $file -Destination "$baseDir\$innerDir"
}

# Create zip files
Compress-Archive -Path "$baseDir\*" -DestinationPath "$releaseDir\wtt-realism-compatibility_${mod_version}_SPT-v${spt_version}.zip" -Force

# Clean up the created directories
Remove-Item -Recurse -Force "$baseDir"