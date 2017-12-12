@{

    # Version number of this module.
    ModuleVersion = '1.0'

    # ID used to uniquely identify this module
    GUID = '064536e1-c77a-4b40-85ab-e8c6882d22f5'

    # Author of this module
    Author = 'Brandon Padgett'

    # Company or vendor of this module
    CompanyName = 'Microsoft Corporation'

    # Copyright statement for this module
    Copyright = '(c) 2016 Microsoft Corporation. All rights reserved.'

    # Description of the functionality provided by this module
    Description = 'Example Module with Plater Templates'

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @()

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()

    # Variables to export from this module
    VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{
        PSData = @{
            Extensions = @(
                @{
                    Module = "Plaster"
                    MinimumVersion = "0.3.0"
                    Details = @{
                        TemplatePaths = @("NewPSAppDeployToolkitDemo", "NewModuleDemo")
                    }
                }
            )
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}
