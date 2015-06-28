@echo off
setlocal EnableExtensions

call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86

set WorkingDir=%CD%
set TempFolder=%CD%\content
echo Working directory: %WorkingDir%

rem Remove old compilation and temporary files...
del /S *.nupkg > NUL: 2> NUL:
rd /S /Q %TempFolder% 2> NUL:

mkdir "%TempFolder%"
mkdir "%TempFolder%\core\QtLibs\armle-v7"
mkdir "%TempFolder%\core\QtLibs\armle-v7\platforms"
mkdir "%TempFolder%\core\QtLibs\x86"
mkdir "%TempFolder%\core\QtLibs\x86\platforms"

echo Copying binaries: %TempFolder%
cp ..\Qt-4.8\playbook-arm\lib\libQtCore.so.4.8.3 "%TempFolder%\core\QtLibs\armle-v7\libQtCore.so"
cp ..\Qt-4.8\playbook-arm\lib\libQtGui.so.4.8.3 "%TempFolder%\core\QtLibs\armle-v7\libQtGui.so"
cp ..\Qt-4.8\playbook-arm\lib\libQtOpenGL.so.4.8.3 "%TempFolder%\core\QtLibs\armle-v7\libQtOpenGL.so"
cp ..\Qt-4.8\playbook-arm\plugins\platforms\libblackberry.so "%TempFolder%\core\QtLibs\armle-v7\platforms\libblackberry.so"

cp ..\Qt-4.8\playbook-x86\lib\libQtCore.so.4.8.3 "%TempFolder%\core\QtLibs\x86\libQtCore.so"
cp ..\Qt-4.8\playbook-x86\lib\libQtGui.so.4.8.3 "%TempFolder%\core\QtLibs\x86\libQtGui.so"
cp ..\Qt-4.8\playbook-x86\lib\libQtOpenGL.so.4.8.3 "%TempFolder%\core\QtLibs\x86\libQtOpenGL.so"
cp ..\Qt-4.8\playbook-x86\plugins\platforms\libblackberry.so "%TempFolder%\core\QtLibs\x86\platforms\libblackberry.so"

echo Preparing environment...
set nuget=nuget

pushd %WorkingDir%
%nuget% pack codetitans-playbook-qt4-core.nuspec
popd

echo Removing temporary files
rd /S /Q %TempFolder%

:EOF

echo DONE!
endlocal

pause

