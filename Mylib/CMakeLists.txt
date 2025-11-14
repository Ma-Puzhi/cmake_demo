cmake_minimum_required(VERSION 3.10)
project(Mylib)

# 设置安装前缀地址
set(CMAKE_INSTALL_PREFIX "/usr/local/Mylib")

# 将源文件编译成动态链接库
add_library(mylib SHARED src/mylib.cpp)

# 设置编译时包含的头文件.h路径
# 设置安装后编译器的头文件路径
target_include_directories(mylib PUBLIC 
                            $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include> 
                            $<INSTALL_INTERFACE:mylib/include>)

# 生成可执行文件
add_executable(main main.cpp)

# 链接动态库
target_link_libraries(main PRIVATE mylib)

# 安装命令

# 安装动态库至前缀地址+DESTINATION，并且将动态库加入export set -> MylibTargets
install(TARGETS mylib
        EXPORT MylibTargets
        LIBRARY DESTINATION mylib/lib/shared)
# 通过 export set -> MylibTargets 生成 MylibTargets.cmake，
# 注：该文件名由EXPORT MylibTargets决定,一般还会生成：MylibTargets-noconfig.cmake
install(EXPORT MylibTargets
        NAMESPACE Mylib::
        DESTINATION mylib/lib/cmake) 
# 安装头文件
install(DIRECTORY include/ DESTINATION mylib/include)

# 生成config.cmake文件
include(CMakePackageConfigHelpers)
# 首先生成版本配置文件
write_basic_package_version_file(
    ${CMAKE_SOURCE_DIR}/cmake/MylibConfigVersion.cmake  # 输出路径，比如 cmake/MyLibConfigVersion.cmake
    VERSION 3.1.0 # 版本号，比如 1.0.0
    COMPATIBILITY ExactVersion # 版本兼容策略
)
# 接着生成config.cmake文件
configure_package_config_file(
  ${CMAKE_SOURCE_DIR}/cmake/MylibConfig.cmake.in          # 模板文件：例如 cmake/MyLibConfig.cmake.in
  ${CMAKE_SOURCE_DIR}/cmake/MylibConfig.cmake             # 输出的配置文件：通常放到 build 目录下
  INSTALL_DESTINATION    mylib/lib/cmake                 

  # 安装路径（相对于 CMAKE_INSTALL_PREFIX）
  # 不安装目的是为了让通过.cmake.in文件生成的.cmake文件中的PACKAGE_PREFIX_DIR找到正确的库文件的根目录
  # 理论上说只需要给出安装后的config.cmake文件与根目录的相对路径即可，如将mylib/lib/cmake替换为aaa/bbb/ccc也可以
  # 只要下面的install(FILES DESTINATION)不写错就行
)
# 整体控制安装路径感觉比较好config.cmake文件
install(FILES
    ${CMAKE_SOURCE_DIR}/cmake/MylibConfig.cmake
    ${CMAKE_SOURCE_DIR}/cmake/MylibConfigVersion.cmake
    DESTINATION mylib/lib/cmake
)

add_custom_target(uninstall
    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_INSTALL_PREFIX}
)