. C:\Users\alexander.nyquist\Posh-HG\profile.example.ps1

Set-Alias subl 'C:\Program Files\Sublime Text 2\sublime_text.exe'

Function FindRec($filepattern, $pattern) {
	Get-ChildItem -Recurse -Include $filepattern | Select-String -Pattern $pattern | Group path | Select Name, Count | Sort Count
}

Function Desktop() {
	Set-Location -Path C:\Users\alexander.nyquist\Desktop
}

Set-Alias d Desktop

Function Goto($project) {
	If (Test-Path C:\Development\Projects\$project) {
		Set-Location -Path C:\Development\Projects\$project
	} ElseIf (Test-Path C:\wamp\www\$project) {
		Set-Location -Path C:\wamp\www\$project
	}
}

Set-Alias g Goto

Function Explore() {
	$exe = "explorer.exe"
	&$exe .
}

Set-Alias e Explore

Function OpenVisualStudioSolution($project) {
    if (Test-Path C:\Development\Projects\$project) {
        Set-Location -Path C:\Development\Projects\$project
        $file = Get-ChildItem -Recurse -Filter *.sln | Select-Object -First 1
        if ($file) {
            $exe = "C:/Program Files (x86)/Microsoft Visual Studio 11.0/Common7/IDE/devenv.exe";
            start $exe $file.FullName
        }
    }
}

Set-Alias sln OpenVisualStudioSolution