@echo off
setlocal enabledelayedexpansion

echo Creating Datara (D++) project structure...

REM Create top-level directories
mkdir src 2>nul
mkdir tests 2>nul
mkdir docs 2>nul
mkdir examples 2>nul
mkdir tools 2>nul

echo Creating source directories...
REM Create source module directories
mkdir src\datara 2>nul
mkdir src\datara\lexer 2>nul
mkdir src\datara\parser 2>nul
mkdir src\datara\ast 2>nul
mkdir src\datara\interpreter 2>nul
mkdir src\datara\runtime 2>nul
mkdir src\datara\stdlib 2>nul
mkdir src\datara\utils 2>nul
mkdir src\datara\ds_features 2>nul
mkdir src\datara\extensions 2>nul
mkdir src\datara\cli 2>nul

echo Creating test directories...
REM Create test directories
mkdir tests\lexer 2>nul
mkdir tests\parser 2>nul
mkdir tests\ast 2>nul
mkdir tests\interpreter 2>nul
mkdir tests\runtime 2>nul
mkdir tests\stdlib 2>nul
mkdir tests\utils 2>nul
mkdir tests\ds_features 2>nul
mkdir tests\extensions 2>nul
mkdir tests\cli 2>nul
mkdir tests\integration 2>nul

echo Creating documentation directories...
REM Create documentation directories
mkdir docs\language_spec 2>nul
mkdir docs\tutorials 2>nul
mkdir docs\api 2>nul

echo Creating example directories...
REM Create example directories
mkdir examples\basic 2>nul
mkdir examples\dataframes 2>nul
mkdir examples\visualization 2>nul
mkdir examples\statistics 2>nul
mkdir examples\machine_learning 2>nul

echo Creating empty __init__.py files in all Python directories...

REM Create empty __init__.py files in source directories
type nul > src\__init__.py
type nul > src\datara\__init__.py
type nul > src\datara\lexer\__init__.py
type nul > src\datara\parser\__init__.py
type nul > src\datara\ast\__init__.py
type nul > src\datara\interpreter\__init__.py
type nul > src\datara\runtime\__init__.py
type nul > src\datara\stdlib\__init__.py
type nul > src\datara\utils\__init__.py
type nul > src\datara\ds_features\__init__.py
type nul > src\datara\extensions\__init__.py
type nul > src\datara\cli\__init__.py

REM Create empty __init__.py files in test directories
type nul > tests\__init__.py
type nul > tests\lexer\__init__.py
type nul > tests\parser\__init__.py
type nul > tests\ast\__init__.py
type nul > tests\interpreter\__init__.py
type nul > tests\runtime\__init__.py
type nul > tests\stdlib\__init__.py
type nul > tests\utils\__init__.py
type nul > tests\ds_features\__init__.py
type nul > tests\extensions\__init__.py
type nul > tests\cli\__init__.py
type nul > tests\integration\__init__.py

REM Create empty __init__.py files in example directories
type nul > examples\__init__.py
type nul > examples\basic\__init__.py
type nul > examples\dataframes\__init__.py
type nul > examples\visualization\__init__.py
type nul > examples\statistics\__init__.py
type nul > examples\machine_learning\__init__.py

REM Create empty __init__.py file in tools directory
type nul > tools\__init__.py

echo Project structure setup complete!
