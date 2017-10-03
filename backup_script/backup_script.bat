@echo off
REM - backup directory can be a file server share that the PgAgent windows service account has access to
set BACKUPDIR=C:\Users\sshaukat\Desktop\revel\db_backup\
set PGHOST="localhost"
set PGUSER="postgres"
set PGBIN="C:/Program Files/PostgreSQL/9.6/bin/"
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
 set dow=%%i
 set month=%%j
 set day=%%k
 set year=%%l
)

for /f "tokens=1-3 delims=: " %%i in ("%time%") do (
 set hh=%%i
 set nn=%%j
)

%PGBIN%pg_dump --dbname=postgresql://postgres:postgres@localhost:5433/revel_db -f %BACKUPDIR%db_backup-%year%-%month%-%day%.sql