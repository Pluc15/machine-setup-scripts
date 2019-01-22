# Prerequisite

Git - https://git-scm.com/downloads
Hack Font - https://sourcefoundry.org/hack/
Visual Studio Code - https://code.visualstudio.com/
ConEmu - https://conemu.github.io/

# Installing

* Install prerequisites
* Open powershell and run the following
```powershell
cd <path to your dotfile parent folder>
git clone --recurse-submodules https://github.com/Pluc15/dotfiles.git
.\dotfiles\win10\install.ps1 -PowershellHomeLocation "<path to your powershell home folder>" -MachineScriptsLocation "<path to your machine scripts added to path>"
```
Note: Both installer arguments are optional