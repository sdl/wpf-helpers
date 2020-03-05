@echo off

nuget "install" "FAKE.Core" "-OutputDirectory" "tools" "-ExcludeVersion" "--removeLegacyFakeWarning"
nuget restore
:Build


SET TARGET="BuildApp"

IF NOT [%1]==[] (set TARGET="%1")

SET BUILDMODE="RELEASE"

IF NOT [%2]==[] (set BUILDMODE="%2")

if %TARGET%=="BuildApp" (SET RunBuild=1)
if %TARGET%=="CreatePackages" (SET RunBuild=1)

"tools\FAKE.Core\tools\Fake.exe" run ".\CommunityWPFHelpers\build.fsx" "target=%TARGET%" "buildMode=%BUILDMODE%"

:Quit
exit /b %errorlevel%