function Invoke-ToolkitTemplate
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [String]$ToolkitName,

        [String]$Version = '1.0.0',

        [String]$AppVersion = '1.0.0',

        [String]$Vendor,

        [String]$Author = 'Brandon Padgett',

        [ValidateSet('Interactive','NonInteractive','Silent')]
        [String]$DeployMode = 'NonInteractive',

        [String]$LogPath = "$PSScriptRoot\Logs",

        [bool]$Balloons = $true
    )

    Process
    {
        $Params = @{
            ToolkitName     = $ToolkitName
            Version         = $Version
            AppVersion      = $AppVersion
            Vendor          = $Vendor
            Author          = $Author
            DeployMode      = $DeployMode
            LogPath         = $LogPath
            Balloons        = $Balloons
            TemplatePath    = "$PSScriptRoot\PlasterTemplates\NewPSAppDeployToolkitDemo"
            DestinationPath = "$PSScriptRoot\Output\$ToolkitName"
            Force           = $True
        }

        Invoke-Plaster @Params
    }
}

