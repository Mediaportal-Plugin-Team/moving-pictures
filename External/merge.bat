@echo off

if "%programfiles(x86)%XXX"=="XXX" goto 32BIT
    :: 64-bit
    set PROGS=%programfiles(x86)%
    goto CONT
:32BIT
    set PROGS=%ProgramFiles%
:CONT

md tmp
ilmerge /out:tmp\MovingPictures.dll MovingPictures.dll CookComputing.XmlRpcV2.dll /target:dll /targetplatform:"v4,%PROGS%\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.7.2" /wildcards
IF EXIST MovingPictures_UNMERGED.dll del MovingPictures_UNMERGED.dll
ren MovingPictures.dll MovingPictures_UNMERGED.dll
IF EXIST MovingPictures_UNMERGED.pdb del MovingPictures_UNMERGED.pdb
ren MovingPictures.pdb MovingPictures_UNMERGED.pdb

ilmerge /out:tmp\Cornerstone.dll Cornerstone.dll Lucene.Net.dll /target:dll /targetplatform:"v4,%PROGS%\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.7.2" /wildcards
IF EXIST Cornerstone_UNMERGED.dll del Cornerstone_UNMERGED.dll
ren Cornerstone.dll Cornerstone_UNMERGED.dll
IF EXIST Cornerstone_UNMERGED.pdb del Cornerstone_UNMERGED.pdb
ren Cornerstone.pdb Cornerstone_UNMERGED.pdb

move tmp\*.* .
rd tmp

