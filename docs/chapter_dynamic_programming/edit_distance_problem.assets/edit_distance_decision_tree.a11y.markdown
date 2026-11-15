<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: e217e6a1c184e59bbc0c0e4e3a3b3366dffefa4988e62829ea8b2daf9f91f88b -->

# 编辑距离的决策树

将字符串作为节点、单次编辑作为有向边，在决策树中寻找从 hello 到 algo 的最短路径；图中展示一条三步转换路径，其他分支未展开。

## 问题与输入

在决策树模型下，每个节点代表一个字符串状态，从节点发出的每条有向边代表一轮决策（一次插入、删除或替换操作）。求解字符串 s = hello 到 t = algo 的编辑距离，等价于在这棵决策树中寻找从根节点 hello 到目标节点 algo 的最短路径。

## 结构与关系

画面自上而下展开左侧一条包含 4 个字符串节点、3 条有向边的具体路径：顶层根节点 s = hello 经“将 l 替换为 g”（把两个 l 中的后一个替换为 g）到达第 2 层节点 helgo；再经“将 e 替换为 a”到达第 3 层节点 halgo；最后经“删除 h”（删除首字母 h）到达底层目标节点 t = algo。

在前三层的每个展开节点（hello、helgo、halgo）右侧，还各画出 3 条指向省略号“…”的分支箭头，表示在不限制操作的情况下每个字符串都可以派生出许多其他编辑选择；这些省略分支并未写出具体字符串，本图旨在直观说明决策树最短路径视角，而非穷举整棵搜索树。

<table><caption>展开路径上的编辑</caption><thead><tr><th scope="col">边</th><th scope="col">操作</th><th scope="col">得到的字符串</th></tr></thead><tbody><tr><td>hello→helgo</td><td>后一个l替换为g</td><td>helgo</td></tr><tr><td>helgo→halgo</td><td>e替换为a</td><td>halgo</td></tr><tr><td>halgo→algo</td><td>删除开头h</td><td>algo</td></tr></tbody></table>

<a id="source-442"></a>

## hello 到 algo 的三步编辑路径

从根节点 s = hello 出发，沿左侧展开路径依次执行三步决策：第 1 步将后一个 l 替换为 g 得到 helgo，第 2 步将 e 替换为 a 得到 halgo，第 3 步删除首字母 h 得到目标串 t = algo；各节点右侧通向省略号的分支代表其余未展开的编辑选择。

## 结果

图中展开的决策树路径通过 3 条边（3 次编辑操作）从根节点 hello 抵达目标节点 algo，对应正文给出的最少编辑步数 3。
