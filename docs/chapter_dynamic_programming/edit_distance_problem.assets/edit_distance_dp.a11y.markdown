<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: c8bce217d724028825dc0ced0d2fc31788af393cca8070574f1f4ae7e6ea9535 -->

# 编辑距离的动态规划

按源前缀与目标前缀逐格递推，求将字符串 bag 转换为 pack 的最少编辑步数。

## 问题与输入

源字符串 s 为 bag（长度 3），目标字符串 t 为 pack（长度 4）；注意本图输入与正文其他示例不同。每次可插入、删除或替换一个字符，单次操作成本均为 1。

状态 dp\[i, j\] 表示将源串 s 的前 i 个字符（源前缀）转换为目标串 t 的前 j 个字符（目标前缀）所需的最少编辑步数。二维表共 4 行 5 列：行 i = 0 至 3 对应源前缀空串、b、ba、bag；列 j = 0 至 4 对应目标前缀空串、p、pa、pac、pack。

## 结构与关系

先创建 4×5 全零表，其中 dp\[0, 0\] 已为两空串转换的有效边界 0；再初始化首行正长度格 dp\[0, j\] = j（空串连续插入 j 个字符变为目标前缀）与首列正长度格 dp\[i, 0\] = i（源前缀连续删除 i 个字符变为空串）。其余 12 个内部格按行从上到下、每行从左到右依次求解。

求解 dp\[i, j\] 时比较当前源前缀尾字符 s\[i - 1\] 与目标前缀尾字符 t\[j - 1\]：若两尾字符相同，无需新增编辑操作，直接等于左上方 dp\[i - 1, j - 1\]（不加 1）；若不同，则比较左方 dp\[i, j - 1\]（插入）、上方 dp\[i - 1, j\]（删除）、左上方 dp\[i - 1, j - 1\]（替换）三者的最小值再加 1。状态表逐格标明数值及“边界有效”“已计算”或“未计算初值”。

<table><caption>完成后的编辑距离表</caption><thead><tr><th scope="col">源前缀 / 目标前缀</th><th scope="col">空串</th><th scope="col">p</th><th scope="col">pa</th><th scope="col">pac</th><th scope="col">pack</th></tr></thead><tbody><tr><th scope="row">空串</th><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td></tr><tr><th scope="row">b</th><td>1</td><td>1</td><td>2</td><td>3</td><td>4</td></tr><tr><th scope="row">ba</th><td>2</td><td>2</td><td>1</td><td>2</td><td>3</td></tr><tr><th scope="row">bag</th><td>3</td><td>3</td><td>2</td><td>2</td><td>3</td></tr></tbody></table>

<a id="source-444"></a>

## 第 1 步：创建 4×5 初始全零 dp 表

根据源串 s = bag（长度 3）与目标串 t = pack（长度 4），创建 4×5 的二维 dp 表（行 i = 0 至 3 对应源前缀空串、b、ba、bag，列 j = 0 至 4 对应目标前缀空串、p、pa、pac、pack）。当前 20 格数值均为 0，其中 dp\[0, 0\] 已是空串转空串的有效边界；其余 19 格为未计算初值，首行与首列的正长度边界尚待设置。

<details><summary>本步完整状态</summary><p>将源串 bag（长 3）转换为目标串 pack（长 4），每次插入、删除或替换成本为 1。当前创建 4×5 全零 dp 表，dp[0, 0] 为有效边界 0，其余 19 格为未计算初值 0，等待设置首行与首列的正长度边界。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">i=1，b</th><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">i=2，ba</th><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">i=3，bag</th><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-445"></a>

## 第 2 步：初始化首行与首列空串转换边界

保留空串转空串的 dp\[0, 0\] = 0。初始化首行 dp\[0, 0\] 至 dp\[0, 4\] 为 \[0, 1, 2, 3, 4\]（源前缀为空串，转为长 j 的目标前缀空串、p、pa、pac、pack 需连续插入 j 个字符，其中空串转 pack 为 dp\[0, 4\] = 4）；初始化首列 dp\[0, 0\] 至 dp\[3, 0\] 为 \[0, 1, 2, 3\]（长 i 的源前缀空串、b、ba、bag 转为空串需连续删除 i 个字符，其中 bag 转空串为 dp\[3, 0\] = 3）。内部第 1 至 3 行、第 1 至 4 列的 12 个 0 仍为未计算初值。

<details><summary>本步完整状态</summary><p>将源串 bag 转换为目标串 pack，每次编辑成本为 1。空串边界初始化完成：首行 dp[0, 0] 至 dp[0, 4]（空串转空串、p、pa、pac、pack）设为有效边界 [0, 1, 2, 3, 4]；首列 dp[0, 0] 至 dp[3, 0]（空串、b、ba、bag 转空串）设为有效边界 [0, 1, 2, 3]；内部 12 格仍为未计算初值 0。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>1，边界有效</td><td>2，边界有效</td><td>3，边界有效</td><td>4，边界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">i=2，ba</th><td>2，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-446"></a>

## 第 3 步：计算 dp\[1, 1\]（源前缀 b 转目标前缀 p）：最少 1 步

处理 i = 1, j = 1，求源前缀 b 转为目标前缀 p 的 dp\[1, 1\]：源尾字符 b 与目标尾字符 p 不同，比较左方 dp\[1, 0\] = 1、上方 dp\[0, 1\] = 1、左上方 dp\[0, 0\] = 0，取最小值 0 加 1（对应将 b 替换为 p），写入 dp\[1, 1\] = 1。

<details><summary>本步完整状态</summary><p>将 bag 转换为 pack，每次编辑成本为 1。当前计算 dp[1, 1]（源前缀 b 转目标前缀 p）：尾字符 b 与 p 不同，比较左方 1、上方 1、左上方 0，取 min(1, 1, 0) + 1 = 1，写入 dp[1, 1] = 1。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>1，边界有效</td><td>2，边界有效</td><td>3，边界有效</td><td>4，边界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，边界有效</td><td>1，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">i=2，ba</th><td>2，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-447"></a>

## 第 4 步：计算 dp\[1, 2\]（源前缀 b 转目标前缀 pa）：最少 2 步

处理 i = 1, j = 2，求源前缀 b 转为目标前缀 pa 的 dp\[1, 2\]：源尾字符 b 与目标尾字符 a 不同，比较左方 dp\[1, 1\] = 1、上方 dp\[0, 2\] = 2、左上方 dp\[0, 1\] = 1，取最小值 1 加 1，写入 dp\[1, 2\] = 2。

<details><summary>本步完整状态</summary><p>将 bag 转换为 pack，每次编辑成本为 1。当前计算 dp[1, 2]（源前缀 b 转目标前缀 pa）：尾字符 b 与 a 不同，比较左方 1、上方 2、左上方 1，取 min(1, 2, 1) + 1 = 2，写入 dp[1, 2] = 2。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>1，边界有效</td><td>2，边界有效</td><td>3，边界有效</td><td>4，边界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">i=2，ba</th><td>2，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-448"></a>

## 第 5 步：计算 dp\[1, 3\]（源前缀 b 转目标前缀 pac）：最少 3 步

处理 i = 1, j = 3，求源前缀 b 转为目标前缀 pac 的 dp\[1, 3\]：源尾字符 b 与目标尾字符 c 不同，比较左方 dp\[1, 2\] = 2、上方 dp\[0, 3\] = 3、左上方 dp\[0, 2\] = 2，取最小值 2 加 1，写入 dp\[1, 3\] = 3。

<details><summary>本步完整状态</summary><p>将 bag 转换为 pack，每次编辑成本为 1。当前计算 dp[1, 3]（源前缀 b 转目标前缀 pac）：尾字符 b 与 c 不同，比较左方 2、上方 3、左上方 2，取 min(2, 3, 2) + 1 = 3，写入 dp[1, 3] = 3。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>1，边界有效</td><td>2，边界有效</td><td>3，边界有效</td><td>4，边界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>0，未计算初值</td></tr><tr><th scope="row">i=2，ba</th><td>2，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-449"></a>

## 第 6 步：计算 dp\[1, 4\]（源前缀 b 转目标串 pack）：最少 4 步

处理 i = 1, j = 4，求源前缀 b 转为完整目标串 pack 的 dp\[1, 4\]：源尾字符 b 与目标尾字符 k 不同，比较左方 dp\[1, 3\] = 3、上方 dp\[0, 4\] = 4、左上方 dp\[0, 3\] = 3，取最小值 3 加 1，写入 dp\[1, 4\] = 4，完成第 1 行。

<details><summary>本步完整状态</summary><p>将 bag 转换为 pack，每次编辑成本为 1。当前计算 dp[1, 4]（源前缀 b 转目标串 pack）：尾字符 b 与 k 不同，比较左方 3、上方 4、左上方 3，取 min(3, 4, 3) + 1 = 4，写入 dp[1, 4] = 4，完成第 1 行。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>1，边界有效</td><td>2，边界有效</td><td>3，边界有效</td><td>4，边界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">i=2，ba</th><td>2，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-450"></a>

## 第 7 步：计算 dp\[2, 1\]（源前缀 ba 转目标前缀 p）：最少 2 步

进入第 2 行，处理 i = 2, j = 1，求源前缀 ba 转为目标前缀 p 的 dp\[2, 1\]：源尾字符 a 与目标尾字符 p 不同，比较左方 dp\[2, 0\] = 2、上方 dp\[1, 1\] = 1、左上方 dp\[1, 0\] = 1，取最小值 1 加 1，写入 dp\[2, 1\] = 2。

<details><summary>本步完整状态</summary><p>将 bag 转换为 pack，每次编辑成本为 1。当前计算 dp[2, 1]（源前缀 ba 转目标前缀 p）：尾字符 a 与 p 不同，比较左方 2、上方 1、左上方 1，取 min(2, 1, 1) + 1 = 2，写入 dp[2, 1] = 2。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>1，边界有效</td><td>2，边界有效</td><td>3，边界有效</td><td>4，边界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">i=2，ba</th><td>2，边界有效</td><td>2，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-451"></a>

## 第 8 步：计算 dp\[2, 2\]（源前缀 ba 转目标前缀 pa）：尾字符同为 a，直接取 1

处理 i = 2, j = 2，求源前缀 ba 转为目标前缀 pa 的 dp\[2, 2\]：当前源前缀尾字符 s\[1\] 与目标前缀尾字符 t\[1\] 同为 a，两尾字符完全匹配，无需新增编辑操作，因此不在 b 转 p 的结果上加 1，直接复制左上方 dp\[1, 1\] = 1，写入 dp\[2, 2\] = 1。

<details><summary>本步完整状态</summary><p>将 bag 转换为 pack，每次编辑成本为 1。当前计算 dp[2, 2]（源前缀 ba 转目标前缀 pa）：源尾字符与目标尾字符同为 a，无需新增编辑操作，直接复制左上方 dp[1, 1] = 1（b 转 p 的步数），得 dp[2, 2] = 1。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>1，边界有效</td><td>2，边界有效</td><td>3，边界有效</td><td>4，边界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">i=2，ba</th><td>2，边界有效</td><td>2，已计算</td><td>1，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-452"></a>

## 第 9 步：计算 dp\[2, 3\]（源前缀 ba 转目标前缀 pac）：最少 2 步

处理 i = 2, j = 3，求源前缀 ba 转为目标前缀 pac 的 dp\[2, 3\]：源尾字符 a 与目标尾字符 c 不同，比较左方 dp\[2, 2\] = 1、上方 dp\[1, 3\] = 3、左上方 dp\[1, 2\] = 2，取左方最小值 1（在 ba 转 pa 的 1 步基础上插入 c）加 1，写入 dp\[2, 3\] = 2。

<details><summary>本步完整状态</summary><p>将 bag 转换为 pack，每次编辑成本为 1。当前计算 dp[2, 3]（源前缀 ba 转目标前缀 pac）：尾字符 a 与 c 不同，比较左方 1、上方 3、左上方 2，取 min(1, 3, 2) + 1 = 2，写入 dp[2, 3] = 2。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>1，边界有效</td><td>2，边界有效</td><td>3，边界有效</td><td>4，边界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">i=2，ba</th><td>2，边界有效</td><td>2，已计算</td><td>1，已计算</td><td>2，已计算</td><td>0，未计算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-453"></a>

## 第 10 步：计算 dp\[2, 4\]（源前缀 ba 转目标串 pack）：最少 3 步

处理 i = 2, j = 4，求源前缀 ba 转为完整目标串 pack 的 dp\[2, 4\]：源尾字符 a 与目标尾字符 k 不同，比较左方 dp\[2, 3\] = 2、上方 dp\[1, 4\] = 4、左上方 dp\[1, 3\] = 3，取左方最小值 2 加 1，写入 dp\[2, 4\] = 3，完成第 2 行。

<details><summary>本步完整状态</summary><p>将 bag 转换为 pack，每次编辑成本为 1。当前计算 dp[2, 4]（源前缀 ba 转目标串 pack）：尾字符 a 与 k 不同，比较左方 2、上方 4、左上方 3，取 min(2, 4, 3) + 1 = 3，写入 dp[2, 4] = 3，完成第 2 行。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>1，边界有效</td><td>2，边界有效</td><td>3，边界有效</td><td>4，边界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">i=2，ba</th><td>2，边界有效</td><td>2，已计算</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td></tr><tr><th scope="row">i=3，bag</th><td>3，边界有效</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-454"></a>

## 第 11 步：计算 dp\[3, 1\]（源串 bag 转目标前缀 p）：最少 3 步

进入第 3 行，处理 i = 3, j = 1，求完整源串 bag 转为目标前缀 p 的 dp\[3, 1\]：源尾字符 g 与目标尾字符 p 不同，比较左方 dp\[3, 0\] = 3、上方 dp\[2, 1\] = 2、左上方 dp\[2, 0\] = 2，取最小值 2 加 1，写入 dp\[3, 1\] = 3。

<details><summary>本步完整状态</summary><p>将 bag 转换为 pack，每次编辑成本为 1。当前计算 dp[3, 1]（源串 bag 转目标前缀 p）：尾字符 g 与 p 不同，比较左方 3、上方 2、左上方 2，取 min(3, 2, 2) + 1 = 3，写入 dp[3, 1] = 3。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>1，边界有效</td><td>2，边界有效</td><td>3，边界有效</td><td>4，边界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">i=2，ba</th><td>2，边界有效</td><td>2，已计算</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td></tr><tr><th scope="row">i=3，bag</th><td>3，边界有效</td><td>3，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-455"></a>

## 第 12 步：计算 dp\[3, 2\]（源串 bag 转目标前缀 pa）：最少 2 步

处理 i = 3, j = 2，求完整源串 bag 转为目标前缀 pa 的 dp\[3, 2\]：源尾字符 g 与目标尾字符 a 不同，比较左方 dp\[3, 1\] = 3、上方 dp\[2, 2\] = 1、左上方 dp\[2, 1\] = 2，取上方最小值 1（删除尾字符 g 归约到 ba 转 pa）加 1，写入 dp\[3, 2\] = 2。

<details><summary>本步完整状态</summary><p>将 bag 转换为 pack，每次编辑成本为 1。当前计算 dp[3, 2]（源串 bag 转目标前缀 pa）：尾字符 g 与 a 不同，比较左方 3、上方 1、左上方 2，取 min(3, 1, 2) + 1 = 2，写入 dp[3, 2] = 2。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>1，边界有效</td><td>2，边界有效</td><td>3，边界有效</td><td>4，边界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">i=2，ba</th><td>2，边界有效</td><td>2，已计算</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td></tr><tr><th scope="row">i=3，bag</th><td>3，边界有效</td><td>3，已计算</td><td>2，已计算</td><td>0，未计算初值</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-456"></a>

## 第 13 步：计算 dp\[3, 3\]（源串 bag 转目标前缀 pac）：最少 2 步

处理 i = 3, j = 3，求完整源串 bag 转为目标前缀 pac 的 dp\[3, 3\]：源尾字符 g 与目标尾字符 c 不同，比较左方 dp\[3, 2\] = 2、上方 dp\[2, 3\] = 2、左上方 dp\[2, 2\] = 1，取左上方最小值 1（将尾字符 g 替换为 c 归约到 ba 转 pa）加 1，写入 dp\[3, 3\] = 2。

<details><summary>本步完整状态</summary><p>将 bag 转换为 pack，每次编辑成本为 1。当前计算 dp[3, 3]（源串 bag 转目标前缀 pac）：尾字符 g 与 c 不同，比较左方 2、上方 2、左上方 1，取 min(2, 2, 1) + 1 = 2，写入 dp[3, 3] = 2。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>1，边界有效</td><td>2，边界有效</td><td>3，边界有效</td><td>4，边界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">i=2，ba</th><td>2，边界有效</td><td>2，已计算</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td></tr><tr><th scope="row">i=3，bag</th><td>3，边界有效</td><td>3，已计算</td><td>2，已计算</td><td>2，已计算</td><td>0，未计算初值</td></tr></tbody></table></details>

<a id="source-457"></a>

## 第 14 步：计算 dp\[3, 4\]（源串 bag 转目标串 pack）：最少 3 步

处理右下角 i = 3, j = 4，求完整源串 bag 转为完整目标串 pack 的 dp\[3, 4\]：源尾字符 g 与目标尾字符 k 不同，比较左方 dp\[3, 3\] = 2、上方 dp\[2, 4\] = 3、左上方 dp\[2, 3\] = 2，取最小值 2 加 1，写入 dp\[3, 4\] = 3，全表计算完成。

<details><summary>本步完整状态</summary><p>将 bag 转换为 pack，每次编辑成本为 1。当前计算 dp[3, 4]（源串 bag 转目标串 pack）：尾字符 g 与 k 不同，比较左方 2、上方 3、左上方 2，取 min(2, 3, 2) + 1 = 3，写入 dp[3, 4] = 3，全表填毕。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>1，边界有效</td><td>2，边界有效</td><td>3，边界有效</td><td>4，边界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">i=2，ba</th><td>2，边界有效</td><td>2，已计算</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td></tr><tr><th scope="row">i=3，bag</th><td>3，边界有效</td><td>3，已计算</td><td>2，已计算</td><td>2，已计算</td><td>3，已计算</td></tr></tbody></table></details>

<a id="source-458"></a>

## 第 15 步：读取右下角 dp\[3, 4\]，返回最少编辑步数 3

全部状态转移结束后，移除前驱比较高亮，单独突出右下角 dp\[3, 4\] = 3，作为将完整源串 bag 转换为完整目标串 pack 所需的最少编辑步数返回。

<details><summary>本步完整状态</summary><p>将 bag 转换为 pack，每次编辑成本为 1。全表计算完成，读取右下角 dp[3, 4] = 3，返回 bag 转 pack 的最少编辑步数 3。</p><table><caption>当前编辑距离与计算进度</caption><thead><tr><th scope="col">源前缀</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，边界有效</td><td>1，边界有效</td><td>2，边界有效</td><td>3，边界有效</td><td>4，边界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，边界有效</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td><td>4，已计算</td></tr><tr><th scope="row">i=2，ba</th><td>2，边界有效</td><td>2，已计算</td><td>1，已计算</td><td>2，已计算</td><td>3，已计算</td></tr><tr><th scope="row">i=3，bag</th><td>3，边界有效</td><td>3，已计算</td><td>2，已计算</td><td>2，已计算</td><td>3，已计算</td></tr></tbody></table></details>

## 结果

右下角 dp\[3, 4\] = 3，即将完整源串 bag 转换为完整目标串 pack 最少需要 3 步编辑。动态规划表给出最少步数，不唯一指定具体的编辑操作序列。
