@echo off
::Extensions for each kind of files
set documents=.pdf .doc .txt .xls .xlsx
set archives=.zip .rar .7z .tar .tar.gz
set movies=.avi .mkv .mp4 .flv
set music=.mp3 .flac .wav
set images=.png .jpg .jpeg .bmp

::Directories for each type of files
set documents_dir=Documents
set archives_dir=Archives
set movies_dir=Movies
set music_dir=Music
set images_dir=Images

set directories=%documents_dir% %archives_dir% %movies_dir% %music_dir% %images_dir%

::Create directories
::-------------------------------------------------------------
echo Creating destination directories...
call :create_directories "%directories%"
echo Directories created...
::-------------------------------------------------------------

::Move files to directories
::-------------------------------------------------------------
echo Moving files to directories:

echo Moving documents...
call :move_files_with_extension %documents_dir% "%documents%"

echo Moving Archives...
call :move_files_with_extension %archives_dir% "%archives%"

echo Moving movies...
call :move_files_with_extension %movies_dir% "%movies%"

echo Moving music...
call :move_files_with_extension %music_dir% "%music%"

echo Moving images...
call :move_files_with_extension %images_dir% "%images%"
::-------------------------------------------------------------

goto :EOF


::Procedure to create directories passed as a parameter
:create_directories
set directories_to_create=%~1

echo %directories_to_create%

for %%d in (%directories_to_create%) do (
	if not exist %%d mkdir %%d
)
goto :EOF
::-------------------------------------------------------------


:: Procedure to move files with extenstions passed as second argument
:: to destination directory passed as first argument
:move_files_with_extension
set destination=%~1
set extensions=%~2

for %%e in (%extensions%) do (
	for %%f in (*%%e) do (
		move "%%f" "%destination%"
	)
)
echo Files moved successfully!
goto :EOF
::-------------------------------------------------------------

