@echo off
setlocal EnableExtensions

call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86

set WorkingDir=%CD%
echo Working directory: %WorkingDir%

echo Preparing environment...

rem Remove old compilation temporary files...
del /S *.nupkg > NUL: 2> NUL:

set nuget=nuget

pushd %WorkingDir%
%nuget% pack codetitans-playbook-qt4-core.nuspec
popd

:EOF

echo DONE!
endlocal

pause

