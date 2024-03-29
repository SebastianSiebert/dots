Write-Host "Copy default.gitconfig as .gitconfig"
if (Test-Path -Path "../.gitconfig" -PathType Leaf) {
    Write-Host ".gitconfig already exists"
}
else {
    Copy-Item -Path "default.gitconfig" -Destination "../.gitconfig"
    Write-Host ".gitconfig copied"
}

Write-Host

Write-Host "Link .ideavimrc"
if (Test-Path -Path "../.ideavimrc" -PathType Leaf) {
    Write-Host ".ideavimrc already exists"
}
else {
    New-Item -Path "../.ideavimrc" -ItemType SymbolicLink -Value ".ideavimrc"
    Write-Host "link created for .ideavimrc"
}

Write-Host

Write-Host "Link .nvimrc"
if (Test-Path -Path "../.nvimrc" -PathType Leaf) {
    Write-Host ".nvimrc already exists"
}
else {
    New-Item -Path "../.nvimrc" -ItemType SymbolicLink -Value ".nvimrc"
    Write-Host "link created for .nvimrc"
}