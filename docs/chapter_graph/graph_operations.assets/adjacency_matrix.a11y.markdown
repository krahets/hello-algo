<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 0f6dcff06c9bd623b4f38fc81b894f25cdc27e322650f8df5ad037e931e9f028 -->

# 邻接矩阵的增删操作

从五顶点六条边出发，依次添加边 1—2、删除边 1—3、添加孤立顶点 6，最后删除顶点 3 及其对应行列。

## 问题与输入

初始图包含五个顶点，顶点列表 V = \[1, 3, 2, 5, 4\] 对应索引 0 至 4；初始仅有六条无向边 1—3、1—5、3—2、2—5、2—4、5—4（尚未连接 1—2）。邻接矩阵元素 M\[i,j\] 表示索引 i 与索引 j 对应的两个顶点是否相连：1 表示有边，0 表示无边。

## 结构与关系

无向边连接两个顶点，增删一条边时须同步更新矩阵中对称的两个位置 M\[i,j\] 与 M\[j,i\]。每帧状态表列出该步操作完成后的完整矩阵。

添加顶点时在矩阵末尾增加全为 0 的一行一列；删除顶点时移除其对应的整行整列，后续顶点的矩阵索引随之递减，但顶点自身身份不变、不会改名。

<a id="source-179"></a>

## 第 1 步：初始化五顶点图

用顶点列表 \[1, 3, 2, 5, 4\] 对应矩阵行列索引 0 至 4，将初始 6 条无向边对应的对称位置记为 1。

<details><summary>本步完整状态</summary><p>初始状态：当前顶点列表依次为 [1, 3, 2, 5, 4]（索引 0 至 4），共有 6 条无向边（1—3、1—5、3—2、2—5、2—4、5—4，尚未连接 1—2）。矩阵为 5×5，1 表示相连，0 表示不相连。</p><table><caption>初始化顶点列表与六条边</caption><thead><tr><th scope="col">行：索引／顶点</th><th scope="col">列 0／顶点 1</th><th scope="col">列 1／顶点 3</th><th scope="col">列 2／顶点 2</th><th scope="col">列 3／顶点 5</th><th scope="col">列 4／顶点 4</th></tr></thead><tbody><tr><th scope="row">0／1</th><td>0</td><td>1</td><td>0</td><td>1</td><td>0</td></tr><tr><th scope="row">1／3</th><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">2／2</th><td>0</td><td>1</td><td>0</td><td>1</td><td>1</td></tr><tr><th scope="row">3／5</th><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td></tr><tr><th scope="row">4／4</th><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td></tr></tbody></table></details>

<a id="source-180"></a>

## 第 2 步：添加边 1—2

顶点 1、2 的矩阵索引分别为 0、2；添加无向边 1—2 时，将对称位置 M\[0,2\] 和 M\[2,0\] 同步从 0 改为 1。

<details><summary>本步完整状态</summary><p>已添加无向边 1—2：当前顶点列表仍为 [1, 3, 2, 5, 4]（索引 0 至 4），M[0,2] 与 M[2,0] 均已置 1，无向边增至 7 条。5×5 矩阵完整取值见当前状态表。</p><table><caption>添加无向边 1—2</caption><thead><tr><th scope="col">行：索引／顶点</th><th scope="col">列 0／顶点 1</th><th scope="col">列 1／顶点 3</th><th scope="col">列 2／顶点 2</th><th scope="col">列 3／顶点 5</th><th scope="col">列 4／顶点 4</th></tr></thead><tbody><tr><th scope="row">0／1</th><td>0</td><td>1</td><td>1</td><td>1</td><td>0</td></tr><tr><th scope="row">1／3</th><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">2／2</th><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td></tr><tr><th scope="row">3／5</th><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td></tr><tr><th scope="row">4／4</th><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td></tr></tbody></table></details>

<a id="source-181"></a>

## 第 3 步：删除边 1—3

顶点 1、3 的矩阵索引分别为 0、1；删除无向边 1—3 时，将对称位置 M\[0,1\] 和 M\[1,0\] 同步从 1 改为 0。

<details><summary>本步完整状态</summary><p>已删除无向边 1—3：当前顶点列表仍为 [1, 3, 2, 5, 4]（索引 0 至 4），M[0,1] 与 M[1,0] 均已清零，保留 1—2 等 6 条无向边。5×5 矩阵完整取值见当前状态表。</p><table><caption>删除无向边 1—3</caption><thead><tr><th scope="col">行：索引／顶点</th><th scope="col">列 0／顶点 1</th><th scope="col">列 1／顶点 3</th><th scope="col">列 2／顶点 2</th><th scope="col">列 3／顶点 5</th><th scope="col">列 4／顶点 4</th></tr></thead><tbody><tr><th scope="row">0／1</th><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td></tr><tr><th scope="row">1／3</th><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">2／2</th><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td></tr><tr><th scope="row">3／5</th><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td></tr><tr><th scope="row">4／4</th><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td></tr></tbody></table></details>

<a id="source-182"></a>

## 第 4 步：添加孤立顶点 6

在顶点列表末尾追加孤立顶点 6（索引 5），矩阵扩展为 6×6，新增的索引为 5 的行与列全部填 0。

<details><summary>本步完整状态</summary><p>已添加孤立顶点 6：当前顶点列表扩为 [1, 3, 2, 5, 4, 6]（索引 0 至 5），共有 6 条无向边。矩阵扩为 6×6，索引 5 对应的顶点 6 行列全为 0。</p><table><caption>添加孤立顶点 6</caption><thead><tr><th scope="col">行：索引／顶点</th><th scope="col">列 0／顶点 1</th><th scope="col">列 1／顶点 3</th><th scope="col">列 2／顶点 2</th><th scope="col">列 3／顶点 5</th><th scope="col">列 4／顶点 4</th><th scope="col">列 5／顶点 6</th></tr></thead><tbody><tr><th scope="row">0／1</th><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">1／3</th><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td></tr><tr><th scope="row">2／2</th><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td></tr><tr><th scope="row">3／5</th><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td><td>0</td></tr><tr><th scope="row">4／4</th><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">5／6</th><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr></tbody></table></details>

<a id="source-183"></a>

## 第 5 步：删除顶点 3

删除索引 1 的顶点 3 及其对应行列，原先与 3 相连的边 2—3 随之移除。剩余顶点 2、5、4、6 的矩阵索引各前移一位（如顶点 2 的索引从 2 变为 1），但各顶点保持原有身份、不会改名。

<details><summary>本步完整状态</summary><p>已删除顶点 3 及关联边 2—3：当前顶点列表更新为 [1, 2, 5, 4, 6]（对应索引 0 至 4，各顶点不改名），共有 5 条无向边，顶点 6 仍为无邻居的孤立顶点。矩阵恢复为 5×5，完整取值见当前状态表。</p><table><caption>删除顶点 3 及对应行列</caption><thead><tr><th scope="col">行：索引／顶点</th><th scope="col">列 0／顶点 1</th><th scope="col">列 1／顶点 2</th><th scope="col">列 2／顶点 5</th><th scope="col">列 3／顶点 4</th><th scope="col">列 4／顶点 6</th></tr></thead><tbody><tr><th scope="row">0／1</th><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">1／2</th><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td></tr><tr><th scope="row">2／5</th><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td></tr><tr><th scope="row">3／4</th><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">4／6</th><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr></tbody></table></details>

## 结果

五步操作结束后，顶点列表更新为 \[1, 2, 5, 4, 6\]（索引 0 至 4），图中保留五条无向边 1—5、2—5、2—4、5—4、1—2；新增顶点 6 为无边相连的孤立顶点，原顶点 3 及其关联边已从图和 5×5 矩阵中彻底移除。
