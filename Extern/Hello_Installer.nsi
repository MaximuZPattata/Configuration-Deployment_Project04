!include "LogicLib.nsh"

# Name of the installer
OutFile "hello_installer.exe"

# Defining StudentNumber and RegistryKey variable
Var RegistryKeyPath

# Creating Function to check 'Hello' folder existence
Function FolderExistenceCheck
    ${If} ${FileExists} "$DESKTOP\Hello"
        MessageBox MB_YESNO|MB_ICONSTOP "Folder already exist. Do you wish to overwrite ?" \
        IDYES Yes IDNO No
        Yes: 
            DetailPrint "Overwriting existing Hello folder."
            Goto Next
        No: 
            DetailPrint "Cancelling new folder creation."
            Quit
        Next:
    ${EndIf}
FunctionEnd

# Default Section start
Section

Call FolderExistenceCheck

# Creating the Hello folder on the desktop
SetOutPath "$DESKTOP\Hello"

# Adding hello.txt to the Hello folder
File "hello.txt"

# Adding hello.exe to the Hello folder
File "hello.exe"

# Initializing variable with registry path
StrCpy $RegistryKeyPath "SOFTWARE\Wow6432Node\Configuration2023\Project4"

# Writing Student Number to Registry HKEY_LOCAL_MACHINE
WriteRegStr HKLM "$RegistryKeyPath" "StudentNumber" "1128059"

# Creating Uninstaller
WriteUninstaller "$EXEDIR\hello_uninstaller.exe"

# Default Section end
SectionEnd

# Uninstall Section defines what uninstaller does
Section "Uninstall"

# Deleting hello_uninstaller.exe
Delete "$INSTDIR\hello_uninstaller.exe"

# Deleting hello_installer.exe
Delete "$INSTDIR\hello_installer.exe"

# Deleting hello.txt
Delete "$DESKTOP\Hello\hello.txt"

# Deleting hello.exe
Delete "$DESKTOP\Hello\hello.exe"

# Deleting Hello folder
RMDir /r "$DESKTOP\Hello"

# Deleting the entire registry key (uncomment line below)
DeleteRegKey HKLM "SOFTWARE\Wow6432Node\Configuration2023\Project4"

# Uninstall Section End
SectionEnd