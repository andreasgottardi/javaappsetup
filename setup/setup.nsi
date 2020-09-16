;--------------------------------
;Include Modern UI
  !include "MUI2.nsh"
  !define MUI_ICON "icon.ico"
  !define MUI_UNICON "icon.ico"
  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP "logo.bmp"
  !define MUI_HEADERIMAGE_RIGHT
;--------------------------------
;General

  ;Name and file
  Name "Java library export example"
  OutFile "..\build\javalibexport-setup-${VERSION}.exe"
  BrandingText "Java lib export setup ${VERSION}"
  Unicode True

  ;Default installation folder
  InstallDir "$LOCALAPPDATA\Programs\JavaLibExport"
  
  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\JavaLibExport" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel user

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_LICENSE "license.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  
;--------------------------------
;Languages
 
  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section "JavaLibExport example" SecJavaLibExport

  SetOutPath "$INSTDIR"
  
  File /r "..\build\setup\bin"
  File /r "..\build\setup\lib"
  File /r "..\build\setup\config"
  File "nok.exe"
  File "ok.exe"
  
  ;Store installation folder
  WriteRegStr HKCU "Software\JavaLibExport" "" $INSTDIR
  
  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"
  
  ExecWait '"$INSTDIR\ok.exe"' $0
  DetailPrint "ok.exe program returned $0"
  
  ExecWait '"$INSTDIR\nok.exe"' $0
  DetailPrint "nok.exe program returned $0"

SectionEnd

;--------------------------------
;Descriptions

;Language strings
LangString DESC_SecJavaLibExport ${LANG_ENGLISH} "JavaLibExport section"

;Assign language strings to sections
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${SecJavaLibExport} $(DESC_SecJavaLibExport)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"
  Delete "$INSTDIR\Uninstall.exe"
  RMDir /r "$INSTDIR"
  DeleteRegKey /ifempty HKCU "Software\JavaLibExport"
SectionEnd