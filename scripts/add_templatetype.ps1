param (
    [string]$filePath
)

# Read the content of the file
$content = Get-Content $filePath

# Create a list to hold the modified lines
$modifiedContent = @()

# Loop through each line in the content
foreach ($line in $content) {
    # Check if the line contains "ModType":
    if ($line -match '"ModType":') {
        # Add the new line before the current line
        $modifiedContent += "`t`t""TemplateType"": ""mod""," # Two tabs
    }
    # Add the current line
    $modifiedContent += $line
}

# Write the modified content back to the file
Set-Content $filePath -Value $modifiedContent
