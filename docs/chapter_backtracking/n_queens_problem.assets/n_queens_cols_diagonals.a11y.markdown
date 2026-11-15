<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 5cbe4cd91f734960e1de8698b2f2bde7a6cd4374b0de9c4a7259a8d77c229fa6 -->

# 用三个布尔数组记录皇后约束

用列数组 cols 与对角线数组 diags1、diags2，按零基行列坐标映射记录并检查皇后的占用状态。

## 问题与输入

与前两图的 1 基坐标不同，本图对应代码实现：4×4 棋盘（n = 4）中行索引 row 从上到下、列索引 col 从左到右均从 0 开始（零基索引）。图中皇后位于零基坐标 (1, 1)（第 2 行第 2 列）；布尔数组中 T 表示已占用，F 表示空闲。

## 结构与关系

把候选格 (row, col) 映射到三个数组下标：列索引 col、主对角线索引 row − col + n − 1（因 row − col 可能为负，加 n − 1 后映射到非负数组索引）、次对角线索引 row + col。三个位置都为 F 才能在该格放入皇后。

放入皇后时把这三项置为 T；完成后续搜索并回溯时再恢复为 F。本例 n = 4、皇后在零基坐标 (1, 1)，对应 cols\[1\]、diags1\[3\]、diags2\[2\] 三项为 T。

<table><caption>约束数组的索引规则</caption><thead><tr><th scope="col">数组</th><th scope="col">长度</th><th scope="col">候选格对应索引</th><th scope="col">本例为 T 的索引</th></tr></thead><tbody><tr><th scope="row">cols</th><td>n = 4</td><td>col</td><td>1</td></tr><tr><th scope="row">diags1</th><td>2n−1 = 7</td><td>row−col+n−1</td><td>3</td></tr><tr><th scope="row">diags2</th><td>2n−1 = 7</td><td>row+col</td><td>2</td></tr></tbody></table>

<table><caption>当前三个数组的完整值</caption><thead><tr><th scope="col">数组索引</th><th scope="col">cols</th><th scope="col">diags1</th><th scope="col">diags2</th></tr></thead><tbody><tr><th scope="row">0</th><td>F</td><td>F</td><td>F</td></tr><tr><th scope="row">1</th><td>T</td><td>F</td><td>F</td></tr><tr><th scope="row">2</th><td>F</td><td>F</td><td>T</td></tr><tr><th scope="row">3</th><td>F</td><td>T</td><td>F</td></tr><tr><th scope="row">4</th><td>无此索引</td><td>F</td><td>F</td></tr><tr><th scope="row">5</th><td>无此索引</td><td>F</td><td>F</td></tr><tr><th scope="row">6</th><td>无此索引</td><td>F</td><td>F</td></tr></tbody></table>

<a id="source-366"></a>

同一主对角线的 row − col 相同（加 n − 1 转为非负索引），同一次对角线的 row + col 相同，因此可用布尔数组检查占用。

## 结果

借助 cols、diags1、diags2 三个布尔数组即可在常数时间内判断列与两条对角线是否冲突；一般的 n×n 棋盘共有 n 列，主对角线和次对角线各有 2n − 1 条。
