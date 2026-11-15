<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 2f7e9f999807f2442522c2d19b95fda4a1aac5c3110f24c22ebf5c91b814f3dd -->

# 记忆化搜索复用已算出的状态

沿左侧主链首次计算并缓存各子问题，右侧再次遇到相同状态时直接读取缓存返回并参与父状态求和。

## 问题与输入

仍求解每步上 1 阶或 2 阶的爬楼梯方案数，基本情况为 dp\[1\] = 1、dp\[2\] = 2。记忆化搜索引入数组 mem 记录已算出的非基本状态值，基本情况先直接返回，非基本状态先查记录，仅在未记录时才继续向下展开。

## 结构与关系

第一次遇到未记录的状态，先递归求出两个子问题的值，相加后存入 mem；再次遇到该状态，就直接读出记录并返回。

例如求 dp\[9\] 时先完成左子问题 dp\[8\]，此过程中已经计算并保存 dp\[7\]；随后求右子问题（带剪刀的 dp\[7\]），直接读缓存而不再重复展开，它仍参与 dp\[9\] 的加法。

图中剪掉的是重复展开的子树，不是这个子问题的贡献。基本情况 dp\[1\]、dp\[2\] 先直接返回已知值 1、2，不需要从 mem 读取。

<table><caption>图中明确标出的缓存复用</caption><thead><tr><th scope="col">当前父状态</th><th scope="col">先完成的左子问题</th><th scope="col">随后读取记录的右子问题</th></tr></thead><tbody><tr><th scope="row">dp[9]</th><td>dp[8]</td><td>dp[7]</td></tr><tr><th scope="row">dp[8]</th><td>dp[7]</td><td>dp[6]</td></tr><tr><th scope="row">dp[7]</th><td>dp[6]（链中省略）</td><td>dp[5]</td></tr></tbody></table>

<table><caption>三种状态的处理</caption><thead><tr><th scope="col">遇到的状态</th><th scope="col">处理</th></tr></thead><tbody><tr><th scope="row">dp[1]、dp[2]</th><td>直接返回 1、2</td></tr><tr><th scope="row">非基本状态，尚无记录</th><td>递归计算、相加、写入 mem 后返回</td></tr><tr><th scope="row">非基本状态，已有记录</th><td>直接返回 mem 中的值，贡献仍参与加法</td></tr></tbody></table>

<a id="source-370"></a>

先沿左链计算并保存，再复用记录；右侧带剪刀的重复状态直接读缓存，仍返回有效方案数参与求和。

## 结果

所有重叠子问题只需展开计算一次，缓存命中时仍贡献有效结果，记忆化搜索将时间复杂度从指数阶降低为线性阶 O(n)；基本情况 dp\[1\] 和 dp\[2\] 仍直接返回已知常数。
