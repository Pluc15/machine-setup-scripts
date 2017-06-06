$extensions = [string[]](Get-Content -Path "extensions.txt")
foreach ($extension in $extensions) {
  code --install-extension $extension
}