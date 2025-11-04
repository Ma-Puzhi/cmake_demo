cmake_minimum_required(VERSION 3.10)
project(Mylib)

set(CMAKE_INSTALL_PREFIX "/usr/local/Mylib")

add_library(mylib SHARED src/mylib.cpp)
target_include_directories(mylib PUBLIC 
                            $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include> 
                            $<INSTALL_INTERFACE:mylib/include>)
add_executable(main main.cpp)
target_link_libraries(main PRIVATE mylib)

# 安装命令
install(TARGETS mylib
        EXPORT MylibTargets
        LIBRARY DESTINATION mylib/lib/shared
        INCLUDES DESTINATION mylib/include)
install(EXPORT MylibTargets
        NAMESPACE Mylib::
        DESTINATION mylib/lib/cmake) 
install(DIRECTORY include/ DESTINATION mylib/include)
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    ${CMAKE_SOURCE_DIR}/cmake/MylibConfigVersion.cmake  # 输出路径，比如 cmake/MyLibConfigVersion.cmake
    VERSION 3.1.0 # 版本号，比如 1.0.0
    COMPATIBILITY ExactVersion # 版本兼容策略
)
configure_package_config_file(
  ${CMAKE_SOURCE_DIR}/cmake/MylibConfig.cmake.in              # 模板文件：例如 cmake/MyLibConfig.cmake.in
  ${CMAKE_SOURCE_DIR}/cmake/MylibConfig.cmake               # 输出的配置文件：通常放到 build 目录下
  INSTALL_DESTINATION  mylib/lib/cmake  # 安装路径（相对于 CMAKE_INSTALL_PREFIX）
)
install(FILES
    ${CMAKE_SOURCE_DIR}/cmake/MylibConfig.cmake
    ${CMAKE_SOURCE_DIR}/cmake/MylibConfigVersion.cmake
    DESTINATION mylib/lib/cmake
)