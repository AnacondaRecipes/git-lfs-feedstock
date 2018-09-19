rem go one level up
cd %SRC_DIR%
cd ..

rem create the gopath directory structure
set "GOPATH=%CD%\gopath"
mkdir "%GOPATH%\src\github.com\git-lfs\git-lfs"
xcopy /s "%SRC_DIR%\*" "%GOPATH%\src\github.com\git-lfs\git-lfs\"
cd "%GOPATH%\src\github.com\git-lfs\git-lfs"

rem generate the help text, see:
rem https://github.com/git-lfs/git-lfs/issues/3159
rem https://github.com/git-lfs/git-lfs/issues/3160
go generate github.com\git-lfs\git-lfs\commands

rem build the project
go build -v
if errorlevel 1 exit 1

rem install the binary
mkdir "%LIBRARY_BIN%"
mv "git-lfs" "%LIBRARY_BIN%\git-lfs"
