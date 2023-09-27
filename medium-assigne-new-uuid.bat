@echo off

CALL paths.bat
CALL vars.bat

REM Fixes following error, when moving a .vdi file

REM VBoxManage.exe: error: Cannot register the hard disk 'C:\.\.\.\VBoxManage\hdd\OracleLinux6Test.vdi' {c6d12cf7-c83b-4a81-a396-5750590caaa3} because a hard disk 'C:\.\.\.\vm test\hdd\OracleLinux6Test.vdi' with UUID {c6d12cf7-c83b-4a81-a396-5750590caaa3} already exists
REM VBoxManage.exe: error: Details: code E_INVALIDARG (0x80070057), component VirtualBoxWrap, interface IVirtualBox, callee IUnknown
REM VBoxManage.exe: error: Context: "OpenMedium(Bstr(pszFilenameOrUuid).raw(), enmDevType, enmAccessMode, fForceNewUuidOnOpen, pMedium.asOutParam())" at line 201 of file VBoxManageDisk.cpp

if "%1" == "" (
    ECHO "Name of the medium is missing."
    exit /b 1  
)

VBoxManage internalcommands sethduuid "%array[general][VM_PATH]%/%1"
