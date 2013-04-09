IF(NOT EXISTS "/Users/krysmopompas/dev/OpenFrameworks-ng/extern/trees/assimp/install_manifest.txt")
  MESSAGE(FATAL_ERROR "Cannot find install manifest: \"/Users/krysmopompas/dev/OpenFrameworks-ng/extern/trees/assimp/install_manifest.txt\"")
ENDIF(NOT EXISTS "/Users/krysmopompas/dev/OpenFrameworks-ng/extern/trees/assimp/install_manifest.txt")

FILE(READ "/Users/krysmopompas/dev/OpenFrameworks-ng/extern/trees/assimp/install_manifest.txt" files)
STRING(REGEX REPLACE "\n" ";" files "${files}")
FOREACH(file ${files})
  MESSAGE(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
  EXEC_PROGRAM(
    "/usr/local/Cellar/cmake/2.8.8/bin/cmake" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
    OUTPUT_VARIABLE rm_out
    RETURN_VALUE rm_retval
    )
  IF(NOT "${rm_retval}" STREQUAL 0)
    MESSAGE(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
  ENDIF(NOT "${rm_retval}" STREQUAL 0)
ENDFOREACH(file)
