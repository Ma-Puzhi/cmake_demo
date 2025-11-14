# 先对库文件进行编译

```cpp
cd Mylib
cd build
sudo rm -rf *
cmake ..
make
sudo make install
```
完成上述步骤就可以在指定位置安装好库文件，在User工程中使用安装好的库文件

`如果想将已经安装的库删除，只需在build目录下执行：`
```cpp
sudo make uninstall
```

# 编译使用文档
```cpp
cd User
cd build
sudo rm -rf *
cmake ..
make 
./main

```
