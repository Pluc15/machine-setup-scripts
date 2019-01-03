# Prerequisite

git
greenshot
hackfont
visualstudiocode
conemu

# Installing for Powershell

```powershell
git clone --recurse-submodules https://github.com/Pluc15/dotfiles.git
.\dotfiles\win10\install.ps1 -PowershellHomeLocation "c:\workspace" -MachineScriptsLocation "c:\workspace\scripts"
```

Note: Both installer arguments are optional

# Installing for Windows Subsystem for Linux

* Install / Open Bash on Ubuntu For Windows
* `cd your-dotfiles-clone`
* `sh wsl/install.sh`