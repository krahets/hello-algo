<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: d0d1279b6269012c339024c10a132145797f2257b4c9bb98fc9a6eb67c55225f -->

# 从初始状态迭代计算爬楼梯方案数

从初始状态 dp\[1\] = 1、dp\[2\] = 2 出发，每次将相邻前两项相加，自左向右迭代推算至 dp\[9\]。

## 问题与输入

爬楼梯每步可上 1 阶或 2 阶，dp\[i\] 表示爬到第 i 阶的方案数。本图展示自底向上的动态规划填表过程，无需借助递归调用栈。

## 结构与关系

先设置 dp\[1\] = 1、dp\[2\] = 2，再按 dp\[3\] 到 dp\[9\] 顺序依次计算 dp\[i\] = dp\[i − 1\] + dp\[i − 2\]：因为每项只依赖前两项，而计算到该项时它们都已先算出。

图中方块只写状态名 dp\[1\] 至 dp\[9\]；数值 3、5、8、13、21、34 以及 dp\[9\] 的 55 不是源图方块标值，而是按初值和转移公式推算出的结果，表中将这些推算结果与依赖关系对应列出。

<table><caption>依赖关系与代入公式推算的值</caption><thead><tr><th scope="col">状态</th><th scope="col">来源</th><th scope="col">值及依据</th></tr></thead><tbody><tr><th scope="row">dp[1]</th><td>初始状态</td><td>1（图中给定初值）</td></tr><tr><th scope="row">dp[2]</th><td>初始状态</td><td>2（图中给定初值）</td></tr><tr><th scope="row">dp[3]</th><td>dp[2] + dp[1]</td><td>3（由公式推算）</td></tr><tr><th scope="row">dp[4]</th><td>dp[3] + dp[2]</td><td>5（由公式推算）</td></tr><tr><th scope="row">dp[5]</th><td>dp[4] + dp[3]</td><td>8（由公式推算）</td></tr><tr><th scope="row">dp[6]</th><td>dp[5] + dp[4]</td><td>13（由公式推算）</td></tr><tr><th scope="row">dp[7]</th><td>dp[6] + dp[5]</td><td>21（由公式推算）</td></tr><tr><th scope="row">dp[8]</th><td>dp[7] + dp[6]</td><td>34（由公式推算）</td></tr><tr><th scope="row">dp[9]</th><td>dp[8] + dp[7]</td><td>55（由公式推算）</td></tr></tbody></table>

<a id="source-371"></a>

从已知小问题向目标状态按序递推，无须递归调用栈。

## 结果

自底向上迭代时每个状态只计算一次，到达目标状态即终止；按图中初始值与转移公式推算，目标 dp\[9\] 对应的方案数为 55。
