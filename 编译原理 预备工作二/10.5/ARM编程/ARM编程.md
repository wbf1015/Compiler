```text
$ arm-linux-gnueabi-as [source file] –o [object file] 生成目标文件
$ arm-linux-gnueabi-ld [object file] –o [executable file]  生成可执行文件
arm-linux-gnueabi-as test.s -o test.o
arm-linux-gnueabi-ld test.o -o test
```

从.C文件直接转化为ARM汇编的可执行文件

```
arm-linux-gnueabi-gcc -o test test.c -static
qemu-arm ./test
```

```
最终使用的版本：
rm-linux-gnueabi-gcc test.c -S -o test.s 把C程序转换成.s程序查看其ARM代码
arm-linux-gnueabi-gcc -o test test.s -static 把arm程序转换为可执行程序
qemu-arm ./test 利用qemu执行程序
```

