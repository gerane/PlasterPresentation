return

# Clear out stored Plaster variable values.
Remove-Item -Path "$env:LOCALAPPDATA\Plaster\NewModule-1.0.0-8c7a8db8-a619-4978-8c8a-cd3fa55cf47a.clixml" -ErrorAction SilentlyContinue
Remove-Item -Path "$env:LOCALAPPDATA\Plaster\NewPSAppDeployToolkit-1.0.0-1d68ec6f-29da-4766-a11f-9d97ac9f0a8f.clixml" -ErrorAction SilentlyContinue
# Clear Examples
Remove-Item -Path .\Output -Recurse -ErrorAction SilentlyContinue
# Clear Example Module
Remove-Item -Path $HOME\OneDrive\Documents\WindowsPowerShell\Modules\PlasterTemplates -Recurse -Force -ErrorAction SilentlyContinue


# Module Command
get-command -module Plaster
# Link to Github Help Page
'https://github.com/PowerShell/Plaster/blob/master/docs/en-US/about_Plaster_CreatingAManifest.help.md'


# Run Toolkit Template
Invoke-Plaster -TemplatePath .\PlasterTemplates\NewPSAppDeployToolkitDemo -DestinationPath .\Output\DemoToolkit
# Run Module Template
Invoke-Plaster -TemplatePath .\PlasterTemplates\NewModuleDemo -DestinationPath .\Output\DemoModule

# Look at Item type Templates in default Templates
$Template = Get-PlasterTemplate | Where-Object {$_.title -eq 'AddPSScriptAnalyzerSettings'}
Invoke-Plaster -TemplatePath $Template.TemplatePath -DestinationPath .\Output\DemoModule
# Look at the AddPSScriptAnalyzerSettings plasterManifest
$psEditor.Workspace.OpenFile("$($Template.TemplatePath)\plasterManifest.xml")


# Find Templates
Get-PlasterTemplate
# Module Templates in psd1
$psEditor.Workspace.OpenFile(".\PlasterTemplates\PlasterTemplates.psd1")
# Example Module with Plaster Templates
Copy-Item -Path .\PlasterTemplates -Destination $HOME\OneDrive\Documents\WindowsPowerShell\Modules -Container -Recurse -Force
Get-PlasterTemplate -IncludeInstalledModules


# Create a new manifest
New-Item -Path .\Output\NewManifest -ItemType Directory
New-PlasterManifest -Path .\Output\NewManifest\plasterManifest.xml -TemplateName NewManifest -TemplateType Project


# Create a new manifest and autofill files.
New-Item -Path .\Output\AddContent -ItemType Directory
Copy-Item -Path .\PlasterTemplates\NewPSAppDeployToolkitDemo\Toolkit -Destination .\Output\AddContent -Container -Force -Recurse
New-PlasterManifest -Path .\Output\AddContent\plasterManifest.xml -TemplateName AddContent -AddContent -TemplateType Project
$psEditor.Workspace.OpenFile(".\Output\AddContent\plasterManifest.xml")


# Dot source example wrappers.
. "C:\Github\PlasterPresentation\Invoke-ModuleTemplate.ps1"
. "C:\Github\PlasterPresentation\Invoke-ToolkitTemplate.ps1"


# Run toolkit example to show logs
& "C:\Github\PlasterPresentation\Output\TestToolkit\Toolkit\Deploy-Application.exe"