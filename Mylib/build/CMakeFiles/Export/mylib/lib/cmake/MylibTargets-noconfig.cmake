#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Mylib::mylib" for configuration ""
set_property(TARGET Mylib::mylib APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(Mylib::mylib PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/mylib/lib/shared/libmylib.so"
  IMPORTED_SONAME_NOCONFIG "libmylib.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS Mylib::mylib )
list(APPEND _IMPORT_CHECK_FILES_FOR_Mylib::mylib "${_IMPORT_PREFIX}/mylib/lib/shared/libmylib.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
