# 如何运行代码

支持丰富的调试和运行方式，让你随心所欲

## 命令行运行

```sh
zig build run_array # zig build run_{file} 
```

```sh
zig build test # 运行所有的算法代码
```

```sh
zig build test -Dtest-filter="basic array" # 过滤运行某个代码
```

## vscode 运行

**运行单个代码**

- 直接点击 vscode 每个测试上的绿色对勾即可运行
- 直接点击 F5 也可以运行只不过是在 Debug 模式下

**调试单个代码**

- 打开单个 zig 文件
- 在需要的代码上打断点
- 直接点击 F5 运行