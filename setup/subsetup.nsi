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
  OutFile "..\build\sub-setup-${VERSION}.exe"
  BrandingText "Java lib export sub setup ${VERSION}"
  Unicode True

  ;Default installation folder
  InstallDir "$LOCALAPPDATA\Programs\SubSetup"
  
  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\SubSetup" ""

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

Section "SubSetup example" SecSubSetup

  SetOutPath "$INSTDIR"
  
  File "ok.exe"
  
  ;Store installation folder
  WriteRegStr HKCU "Software\SubSetup" "" $INSTDIR
  
  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"
  
  SetErrorLevel 4722

SectionEnd

;--------------------------------
;Descriptions

;Language strings
LangString DESC_SecSubSetup ${LANG_ENGLISH} "SubSetup section"

;Assign language strings to sections
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${SecSubSetup} $(DESC_SecSubSetup)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"
  Delete "$INSTDIR\Uninstall.exe"
  DeleteRegKey /ifempty HKCU "Software\SubSetup"
  RMDir /r "$INSTDIR"
SectionEnd