@echo off

REM  Input options
REM  =================
set target=C:\Program Files\Windows Media Player\wmplayer.exe
REM  =C:\Program Files\Windows Media Player\wmplayer.exe
set hash=0
REM  =0


set hashAlg=SHA256
REM  hashAlg choices: MD2 MD4 MD5 SHA1 SHA256 SHA384 SHA512



REM  Program
REM  =================
echo hash=%hash%, algorithm=%hashAlg%, target=%target%

set command=PowerShell -C "$($(CertUtil -hashfile '%target%' %hashAlg%)[1] -replace ' ','')"
set targethash=O
IF exist "%target%" (
	FOR /F "delims=" %%i IN ('%command%') DO set targethash=%%i
)

IF /i %targethash%==%hash% (
	Powershell write-host -foregroundcolor Green "Hash values match"
) ELSE (
	Powershell write-host -foregroundcolor Red "Hash values do not match"
)

echo %targethash% | clip
echo Target hash %targethash% was copied to clipboard

pause
