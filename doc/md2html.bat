rem @echo off

if "%1"=="" goto all
@echo on
pandoc %1.md -f markdown -t html -s -o %MD2_OUT%\%1.md
@echo off
goto end

:all
rem span up a directory tree for output
set MD2_ROOT="%CD%"
set MD2_CMD=%MD2_ROOT%\md2html.bat
md ..\output\doc
pushd ..\output\doc
set MD2_OUT="%CD%"
xcopy /s /y %MD2_ROOT%\*.md .
del *.* /s /q
popd
rem convert the files
call %MD2_CMD% README
call %MD2_CMD% repository-services-01\README
call %MD2_CMD% repository-services-01\nem-feedback
call %MD2_CMD% repository-services-01\upload-model\README
call %MD2_CMD% repository-services-01\upload-model\schema
pause
goto end

:end
