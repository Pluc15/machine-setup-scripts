$pathDevGit = "D:\Dev\Git"
$gitFolders = (
    "mediaclip-hub",
    "mediaclip-cms",
    "mediaclip-hub-admin-ui",
    "mediaclip-hub-dev-store",
    "mediaclip-hub-libs",
    "mediaclip-hub-maintenance-utils",
    "mediaclip-hub-public-doc",
    "mediaclip-hub-reports-api",
    "mediaclip-ppcs",
    "mediaclip-ppcs\mediaclip-library-test",
    "mediaclip-ppcs\mediaclip-ppcs-doc",
    "mediaclip-ppcs\mediaclip-ppcs-dotnet",
    "mediaclip-ppcs\mediaclip-ppcs-locales",
    "mediaclip-ppcs\mediaclip-ppcs-designer-html5",
    "mediaclip-scripts")

foreach ($gitFolder in $gitFolders) {
    $fullGitPath = Join-Path -Path $pathDevGit -ChildPath $gitFolder
    Push-Location $fullGitPath
    try {
        Write-Output "Pulling $gitFolder"
        git fetch
        git pull
    }
    finally {
        Pop-Location
    }
}