
####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was MylibConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################
# 包含导出的 targets CMAKE_CURRENT_LIST_DIR当前脚本文件所在目录路径
include("${CMAKE_CURRENT_LIST_DIR}/MylibTargets.cmake")
# 如果你的库还依赖别的包（例如 Eigen），可以写：
# find_dependency(Eigen3 REQUIRED)
# 设置一些路径变量（可选）是因为在老的CMake项目中，不是通过find_packages()进行包的查找，
# 他们会通过定义的宏，将动态链接库与头文件包含至项目中，因此需要设置一些标准的约定俗成的规律
# set(MyLib_INCLUDE_DIRS "")
