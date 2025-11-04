cmake_minimum_required(VERSION 3.10)
project(UserProject)
set(Mylib_DIR "/usr/local/Mylib/mylib/lib/cmake") # 指定 Mylib 的 cmake 配置文件所在目录

find_package(Mylib 3.1.0 REQUIRED)
add_executable(main main.cpp)
target_link_libraries(main PRIVATE Mylib::mylib)