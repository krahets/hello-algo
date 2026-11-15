<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 000aa3bdac2b8bb7523597b9f0ec4cbd4b54144196567dca21af8bf13dc14a3e -->

# 编辑距离：两个三步转换示例

展示将 kitten 转为 sitting（2 次替换、1 次添加）以及将 hello 转为 algo（1 次删除、2 次替换）的字符对应关系，两组示例的最少编辑步数均为 3。

## 问题与输入

编辑距离（Levenshtein 距离）衡量两个字符串之间互相转换所需的最少单字符编辑次数。每次允许执行三种操作之一：插入（添加）一个字符、删除一个字符，或将一个字符替换为任意字符。

## 结构与关系

画面左右并列展示两组字符串转换的字符逐位对齐图：

左图将源字符串 s = kitten 转换为目标字符串 t = sitting：首字母 k 替换为 s（蓝色），第 5 个字母 e 替换为 i（蓝色），并在末尾添加字母 g（紫色）；其余未修改的 4 个字母 i、t、t、n 原样保留，中间行与目标行以竖直虚线对齐。

右图将源字符串 s = hello 转换为目标字符串 t = algo：首字母 h 被删除（在中间过渡行以淡橙色虚化显示 h，不再向下进入目标串），第 2 个字母 e 替换为 a（蓝色），两个连续 l 中的后一个 l 替换为 g（蓝色），而前一个 l 与末尾 o 原样保留，中间行与目标行以竖直虚线对齐。图中箭头用于标示各字符位置的编辑类型与对应关系，并不强行规定这三次编辑的唯一先后执行顺序。

<table><caption>两组编辑操作</caption><thead><tr><th scope="col">起点</th><th scope="col">终点</th><th scope="col">替换</th><th scope="col">插入或删除</th><th scope="col">步数</th></tr></thead><tbody><tr><td>kitten</td><td>sitting</td><td>k→s；e→i</td><td>末尾插入g</td><td>3</td></tr><tr><td>hello</td><td>algo</td><td>e→a；后一个l→g</td><td>删除开头h</td><td>3</td></tr></tbody></table>

<a id="source-441"></a>

## 字符逐位对齐展示两组三步编辑过程

左侧对 s = kitten 执行 k → s、e → i 两次替换并在末尾添加 g，长度由 6 变为 7 得到 t = sitting；右侧对 s = hello 删除开头 h（中间行淡色 h 标示删除），并将 e → a、后一个 l → g，长度由 5 变为 4 得到 t = algo。两例均通过 3 次基本编辑操作完成转换。

## 结果

左图 kitten → sitting 通过 2 次替换加 1 次添加完成，右图 hello → algo 通过 1 次删除加 2 次替换完成，两组示例的编辑距离均为 3。
