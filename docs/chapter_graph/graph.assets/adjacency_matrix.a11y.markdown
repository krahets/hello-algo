<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 91f0cfca2a1e26c24b148c72790c3abbaf18a9709ade0d5faadddb86af2c4cac -->

# 无向图的邻接矩阵

顶点列表按 1、3、2、5、4 排列；七条无向边在 5×5 邻接矩阵中各对应两个关于主对角线对称的 1。

## 问题与输入

图的顶点列表为 V=\[1, 3, 2, 5, 4\]，按此顺序对应矩阵的行、列索引 0 至 4。注意顶点编号与矩阵索引不完全相同：顶点 1、2、4 恰好位于索引 0、2、4，而顶点 3 位于索引 1、顶点 5 位于索引 3。表头同时列出索引与顶点编号，查询时须先按顶点找到对应索引。

## 结构与关系

邻接矩阵元素 M\[i, j\]=1 表示索引 i 的顶点 V\[i\] 与索引 j 的顶点 V\[j\] 之间有边相连，M\[i, j\]=0 表示无边。由于无向图的每条边在两个方向上等价，同一条无向连接会同时在 M\[i, j\] 和 M\[j, i\] 两处记为 1，使矩阵关于主对角线对称；本图无自环，主对角线 M\[i, i\] 全为 0。

图中用颜色高亮标出三组无向边与矩阵对称单元的对应：边 1—2（索引 0 与 2）对应 M\[0, 2\]=1 与 M\[2, 0\]=1；边 3—2（索引 1 与 2）对应 M\[1, 2\]=1 与 M\[2, 1\]=1；边 5—4（索引 3 与 4）对应 M\[3, 4\]=1 与 M\[4, 3\]=1。完整 5×5 矩阵见数据表。

<table><caption>图中邻接矩阵</caption><thead><tr><th scope="col">行：索引／顶点</th><th scope="col">列 0／顶点 1</th><th scope="col">列 1／顶点 3</th><th scope="col">列 2／顶点 2</th><th scope="col">列 3／顶点 5</th><th scope="col">列 4／顶点 4</th></tr></thead><tbody><tr><th scope="row">0／1</th><td>0</td><td>1</td><td>1</td><td>1</td><td>0</td></tr><tr><th scope="row">1／3</th><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">2／2</th><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td></tr><tr><th scope="row">3／5</th><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td></tr><tr><th scope="row">4／4</th><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td></tr></tbody></table>

<a id="source-177"></a>

查边时先将两个顶点换算为 V=\[1, 3, 2, 5, 4\] 中的行列索引，再读取交叉单元：例如查顶点 3（索引 1）与顶点 2（索引 2），M\[1, 2\] 与对称位置 M\[2, 1\] 均为 1，说明两点有边；若查顶点 3（索引 1）与顶点 4（索引 4），M\[1, 4\]=0，说明两点无边。

## 结果

五个顶点构成 5×5 邻接矩阵，七条无向边在主对角线两侧对称产生 14 个值为 1 的矩阵元素，主对角线元素全为 0。
