/* Simple Chat
 * Copyright (c) 2008-2014 Alexander Sedov <imp@schat.me>
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

!ifndef SCHAT_NSH_
!define SCHAT_NSH_

Var update

!include "engine\translations.nsh"
!AddPluginDir "contrib\plugins"

/*
 * C��������� ����� ������.
 * ������� �� MUI2.nsh.
 */
!define Name "!insertmacro MUI_SET MOD_ID "


/*
 * ������ ��� ��������� ��������� ��������� ����������/��������������
 * ��������� ������.
 * \param _STATE 1 - ������ ������� �� ���������, 0 - �� �������.
 */
!define State "!insertmacro SCHAT_MOD_STATE "
!macro SCHAT_MOD_STATE _STATE
  !ifdef SCHAT_INIT
    ${SectionState} "${MOD_ID}" ${_STATE} ${${MOD_ID}_idx}
  !endif

  !ifdef SCHAT_POST
    !insertmacro SAVE_SECTION ${${MOD_ID}_idx} "${MOD_ID}"
  !endif
!macroend


/*
 * ������ ��������� ��� ����������� �������� ����� ������.
 * ������������ �����: ${Body} � ${BodyEnd}.
 * ���������� ����� ��������� ������ ��� ����������� SCHAT_SECTIONS.
 * ������������� ������������� �������� ��� ������.
 */
!define Body "!insertmacro SCHAT_MOD_BODY "
!define BodyEnd "!endif"
!macro SCHAT_MOD_BODY
  !ifdef SCHAT_DESC
    !insertmacro MUI_DESCRIPTION_TEXT ${${MOD_ID}_idx} "$(desc_${MOD_ID})"
  !endif
  !ifdef SCHAT_SECTIONS
!macroend


/*
 * ������ ������� ��� ������� ����������� ������ ��� ������.
 * ������������ �����: ${Section} � ${SectionEnd}
 * � ������ ���������� ������ ${Body}.
 */
!define Section "!insertmacro SCHAT_SECTION "
!macro SCHAT_SECTION
  Section "$(sec_${MOD_ID})" ${MOD_ID}_idx
    SetOverwrite on
!macroend

!define SectionEnd "!insertmacro SCHAT_SECTION_END "
!macro SCHAT_SECTION_END
  SectionEnd
!macroend


!define Uninstall "!insertmacro SCHAT_MOD_UNINSTALL "
!define UninstallEnd "!endif"
!macro SCHAT_MOD_UNINSTALL
  !ifdef SCHAT_UNINSTALL
!macroend


/*
 * ��������� ������� ������.
 */
!define SectionState "!insertmacro SectionState"
!macro SectionState _KEY _DEF _SEC
  Push $0
  ClearErrors
  ReadIniStr $0 "$INSTDIR\uninstall.ini" "${SCHAT_NAME}" "${_KEY}"
  ${Unless} ${Errors}
    ${If} $0 != 1
    ${AndIf} $0 != 0
      StrCpy $0 ${_DEF}
    ${EndIf}
  ${Else}
    StrCpy $0 ${_DEF}
  ${EndUnless}

  ${If} $0 == 1
    !insertmacro SelectSection ${_SEC}
  ${Else}
    !insertmacro UnselectSection ${_SEC}
  ${EndIf}

  Pop $0
!macroend


/*
 * ��������� ������ ������.
 */
!macro SAVE_SECTION _SEC _KEY
  ${If} ${SectionIsSelected} ${_SEC}
    WriteINIStr "$INSTDIR\uninstall.ini" "${SCHAT_NAME}" "${_KEY}" 1
  ${Else}
    WriteINIStr "$INSTDIR\uninstall.ini" "${SCHAT_NAME}" "${_KEY}" 0
  ${EndIf}
!macroend


/*
 * ��������� ����� ��������� ������ "-update".
 * ���� ��������� ���������� �� ���� ������� ���� ������������ exe �����.
 */
!macro UPDATE_CMD
  ${GetParameters} $R0
  ${GetOptionsS} $R0 "-update" $R0
  ${Unless} ${Errors}
    ${GetParent} "$EXEDIR" $R0
    StrCpy $INSTDIR $R0
    StrCpy $update true
  ${Else}
    StrCpy $update false
  ${EndUnless}
!macroend


/**
 * ��������� ��� �������� � �������� ������
 */
!macro KILL_ALL _NAME
 !if ${SCHAT_CHECK_RUN} == 1
  FindProcDLL::FindProc "${_NAME}"
  Pop $R0

  ${If} $R0 == 1
    ExecWait '"${_NAME}" -exit'

    ${While} $R0 == 1
      FindProcDLL::FindProc "${_NAME}"
      Pop $R0
      Sleep 100
    ${EndWhile}
  ${EndIf}
 !endif
!macroend

!endif /* SCHAT_NSH_ */
