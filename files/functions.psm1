function shortcut
{
	$pyname=$args[0]
	$pyscript=$args[1]
	
	robocopy "$env:thispath\files\shortcut" "$env:workdir"
	$targetpath="$env:workdir\shortcut.cmd"
	
	(Get-Content "$targetpath") -replace '__pyscript', '$pyscript' | Set-Content "$targetpath"
	
	cd "$env:workdir"
	IF (Test-Path "$pyname.cmd") {
		del "$pyname.cmd"
	}

	Rename-Item shortcut.cmd "$pyname.cmd"
}
