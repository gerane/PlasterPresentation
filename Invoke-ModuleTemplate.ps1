function Invoke-ModuleTemplate
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [String]$ModuleName,

        [Parameter(Mandatory)]
        [String]$ModuleDesc,

        [String]$Version = '1.0.0',

        [String]$Author = 'Brandon Padgett',

        [ValidateSet('None','MIT','Apache')]
        [String]$License = 'MIT'
    )

    Process
    {
        $Params = @{
            ModuleName      = $ModuleName
            ModuleDesc      = $ModuleDesc
            Version         = $Version
            Author          = $Author
            License         = $License
            TemplatePath    = "$PSScriptRoot\PlasterTemplates\NewModuleDemo"
            DestinationPath = "$PSScriptRoot\Output\$ModuleName"
            Force           = $True
        }

        Invoke-Plaster @Params
    }
}

