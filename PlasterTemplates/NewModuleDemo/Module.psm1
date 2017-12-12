$Public = @(Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue)
$Private = @(Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue)
$Script:ModuleRoot = $PSScriptRoot

Try
{
	$Public | ForEach-Object {. $_.fullname}
	$Private | ForEach-Object {. $_.fullname}
}
Catch
{
	Write-Error -Message "Failed to import $($_.InvocationInfo.ScriptName): $_"
}

Export-ModuleMember -Function $Public.Basename