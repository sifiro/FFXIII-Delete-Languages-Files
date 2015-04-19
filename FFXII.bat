@echo off
title Herramienta de Eliminar idiomas by Sifiro ver. 0.6
:game
echo "Cual Juego quieres usar la herramienta?"
echo "1. Final Fantasy XIII"
rem echo "2. Final Fantasy XIII-2"
set /p gamever= Cual es su opcion? (1)
if %gamever%==1 set ffver=Final Fantasy XIII
rem if %gamever%==2 set ffver=Final Fantasy XIII-2

set ffdir=\Steam\SteamApps\common\%ffver%\while_data\
if exist "%HOMEDRIVE%\Program Files (x86)" then
set steam-pwd="%HOMEDRIVE%\Program Files (x86)%ffdir%"
else
set steam-pwd="%HOMEDRIVE%\Program Files%ffdir%"
set ff-video=%steam-pwd%\movie
set ff-sys=%steam-pwd%\sys
set ff-zone=%steam-pwd%\zone
set ff-zone-tmp=%ff-zone%\tmp
set ff-redist=%steam-pwd%\_CommonRedist
cls
echo "Que idioma deseas eliminar?"
echo "1. Japones"
echo "2. Ingles"
set /p opcion= Cual es su opcion? (1 o 2)
if %opcion%==1 goto japones
if %opcion%==2 goto ingles

:japones
set lang=japones
cls
echo "La Opcion de eliminar videos esta en WIP"
rem del %ff-video%\*..win32.wmp
del %ff-sys%\*c.win32.bin
del %ff-sys%\*c.win32.sdat
del %ff-zone%\*c_img.win32.bin
goto terminar
:ingles
set lang=ingles
echo "Eliminando Archivos del juego..."
del %ff-sys%\*u.win32.bin
del %ff-sys%\*u.win32.sdat
mkdir %ff-zone%\tmp
move %ff-zone%\white_z001u_img.win32.bin %ff-zone-tmp%
move %ff-zone%\white_z005u_img.win32.bin %ff-zone-tmp%
move %ff-zone%\white_z007u_img.win32.bin %ff-zone-tmp%
move %ff-zone%\white_z009u_img.win32.bin %ff-zone-tmp%
move %ff-zone%\white_z025u_img.win32.bin %ff-zone-tmp%
move %ff-zone%\white_z028u_img.win32.bin %ff-zone-tmp%
del %ff-zone%\*u_img.win32.bin
move %ff-zone-tmp%\* %ff-zone%
del %ff-zone-tmp%
echo "Archivos del Juego Eliminados"
echo "Eliminando Videos..."
del %ff-video%\*us.win32.wmp
echo "Video Eliminados"
goto terminar

:terminar
echo el Idioma %lang% ha sido eliminiado
PAUSE > NUL
echo Desea eliminar los instaladores extras (DirectX, Physix, etc)?
echo 1.Si
echo 2.No
set /p extra= Cual es su opcion? (1 o 2)
if %extra% == 1 then
del %ff-redist%\*
PAUSE > NUL
