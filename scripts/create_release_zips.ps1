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
$innerDir = "user\mods\SPT-Realism\db\put_new_stuff_here\WTT Armory"

# Create the directories
New-Item -ItemType Directory -Path "$baseDir\$innerDir" -Force

# Define the list of files to move
$filesToMove = @(
    'WTT Armory\Arisaka_Type_99.json',
    'WTT Armory\Barrett_M107A1.json',
    'WTT Armory\Beretta_ARX160.json',
    'WTT Armory\Blicky_Glock.json',
    'WTT Armory\Cheytac_Intervention.json',
    'WTT Armory\CZ75.json',
    'WTT Armory\Desert_Eagle.json',
    'WTT Armory\Drum_Mags.json',
    'WTT Armory\Hoshizora_SCAR_17.json',
    'WTT Armory\IWI_Tavor_TAR21.json',
    'WTT Armory\IWI_Tavor_X95.json',
    'WTT Armory\Remington_ACR.json',
    'WTT Armory\Remington_MSR.json',
    'WTT Armory\Remington_R5.json',
    'WTT Armory\Springfield_Prodigy.json',
    'WTT Armory\SVD.json',
    'WTT Armory\Wages_of_Sin_AR15.json',
    'WTT Armory\Wilson_Combat_EDC_X9.json',
    'WTT Armory\Zastava_M76.json'
)

# Move files to both directories
foreach ($file in $filesToMove) {
    Copy-Item -Path $file -Destination "$baseDir\$innerDir"
}

# Create zip files
Compress-Archive -Path "$baseDir\*" -DestinationPath "$releaseDir\wtt-realism-compatibility_${mod_version}_SPT-v${spt_version}.zip" -Force

# Clean up the created directories
Remove-Item -Recurse -Force "$baseDir"