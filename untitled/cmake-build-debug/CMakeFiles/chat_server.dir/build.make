# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2021.1\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2021.1\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\mahafonova\Desktop\GL\untitled

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\mahafonova\Desktop\GL\untitled\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles\chat_server.dir\depend.make

# Include the progress variables for this target.
include CMakeFiles\chat_server.dir\progress.make

# Include the compile flags for this target's objects.
include CMakeFiles\chat_server.dir\flags.make

CMakeFiles\chat_server.dir\chat_server.cpp.obj: CMakeFiles\chat_server.dir\flags.make
CMakeFiles\chat_server.dir\chat_server.cpp.obj: ..\chat_server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\mahafonova\Desktop\GL\untitled\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/chat_server.dir/chat_server.cpp.obj"
	C:\PROGRA~2\MIB055~1\2019\COMMUN~1\VC\Tools\MSVC\1428~1.299\bin\Hostx64\x64\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\chat_server.dir\chat_server.cpp.obj /FdCMakeFiles\chat_server.dir\ /FS -c C:\Users\mahafonova\Desktop\GL\untitled\chat_server.cpp
<<

CMakeFiles\chat_server.dir\chat_server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/chat_server.dir/chat_server.cpp.i"
	C:\PROGRA~2\MIB055~1\2019\COMMUN~1\VC\Tools\MSVC\1428~1.299\bin\Hostx64\x64\cl.exe > CMakeFiles\chat_server.dir\chat_server.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\mahafonova\Desktop\GL\untitled\chat_server.cpp
<<

CMakeFiles\chat_server.dir\chat_server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/chat_server.dir/chat_server.cpp.s"
	C:\PROGRA~2\MIB055~1\2019\COMMUN~1\VC\Tools\MSVC\1428~1.299\bin\Hostx64\x64\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\chat_server.dir\chat_server.cpp.s /c C:\Users\mahafonova\Desktop\GL\untitled\chat_server.cpp
<<

# Object files for target chat_server
chat_server_OBJECTS = \
"CMakeFiles\chat_server.dir\chat_server.cpp.obj"

# External object files for target chat_server
chat_server_EXTERNAL_OBJECTS =

chat_server.exe: CMakeFiles\chat_server.dir\chat_server.cpp.obj
chat_server.exe: CMakeFiles\chat_server.dir\build.make
chat_server.exe: chat_message.lib
chat_server.exe: C:\CLI\vcpkg\installed\x64-windows\debug\lib\boost_system-vc140-mt-gd.lib
chat_server.exe: C:\CLI\vcpkg\installed\x64-windows\debug\lib\boost_thread-vc140-mt-gd.lib
chat_server.exe: C:\CLI\vcpkg\installed\x64-windows\debug\lib\boost_chrono-vc140-mt-gd.lib
chat_server.exe: C:\CLI\vcpkg\installed\x64-windows\debug\lib\boost_date_time-vc140-mt-gd.lib
chat_server.exe: C:\CLI\vcpkg\installed\x64-windows\debug\lib\boost_atomic-vc140-mt-gd.lib
chat_server.exe: CMakeFiles\chat_server.dir\objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\mahafonova\Desktop\GL\untitled\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable chat_server.exe"
	"C:\Program Files\JetBrains\CLion 2021.1\bin\cmake\win\bin\cmake.exe" -E vs_link_exe --intdir=CMakeFiles\chat_server.dir --rc=C:\PROGRA~2\WI3CF2~1\10\bin\100190~1.0\x64\rc.exe --mt=C:\PROGRA~2\WI3CF2~1\10\bin\100190~1.0\x64\mt.exe --manifests -- C:\PROGRA~2\MIB055~1\2019\COMMUN~1\VC\Tools\MSVC\1428~1.299\bin\Hostx64\x64\link.exe /nologo @CMakeFiles\chat_server.dir\objects1.rsp @<<
 /out:chat_server.exe /implib:chat_server.lib /pdb:C:\Users\mahafonova\Desktop\GL\untitled\cmake-build-debug\chat_server.pdb /version:0.0 /machine:x64 /debug /INCREMENTAL /subsystem:console  chat_message.lib C:\CLI\vcpkg\installed\x64-windows\debug\lib\boost_system-vc140-mt-gd.lib C:\CLI\vcpkg\installed\x64-windows\debug\lib\boost_thread-vc140-mt-gd.lib C:\CLI\vcpkg\installed\x64-windows\debug\lib\boost_chrono-vc140-mt-gd.lib C:\CLI\vcpkg\installed\x64-windows\debug\lib\boost_date_time-vc140-mt-gd.lib C:\CLI\vcpkg\installed\x64-windows\debug\lib\boost_atomic-vc140-mt-gd.lib kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib 
<<
	C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -noprofile -executionpolicy Bypass -file C:/CLI/vcpkg/scripts/buildsystems/msbuild/applocal.ps1 -targetBinary C:/Users/mahafonova/Desktop/GL/untitled/cmake-build-debug/chat_server.exe -installedDir C:/CLI/vcpkg/installed/x64-windows/debug/bin -OutVariable out

# Rule to build all files generated by this target.
CMakeFiles\chat_server.dir\build: chat_server.exe

.PHONY : CMakeFiles\chat_server.dir\build

CMakeFiles\chat_server.dir\clean:
	$(CMAKE_COMMAND) -P CMakeFiles\chat_server.dir\cmake_clean.cmake
.PHONY : CMakeFiles\chat_server.dir\clean

CMakeFiles\chat_server.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles" C:\Users\mahafonova\Desktop\GL\untitled C:\Users\mahafonova\Desktop\GL\untitled C:\Users\mahafonova\Desktop\GL\untitled\cmake-build-debug C:\Users\mahafonova\Desktop\GL\untitled\cmake-build-debug C:\Users\mahafonova\Desktop\GL\untitled\cmake-build-debug\CMakeFiles\chat_server.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles\chat_server.dir\depend

