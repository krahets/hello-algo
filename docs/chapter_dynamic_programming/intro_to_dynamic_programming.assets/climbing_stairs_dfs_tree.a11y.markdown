<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 05c90913562c41ef92c125aff1dacd885019c14deffbee7906b2871deff847eb -->

# 暴力爬楼梯搜索的重叠子问题

从 dp\[9\] 自顶向下暴力递归拆分时，相同的子问题不共享结果，会在不同分支中被反复展开求解。

## 问题与输入

爬楼梯问题中每步上 1 阶或 2 阶，dp\[i\] 表示爬到第 i 阶的方案数。暴力搜索直接按递推式 dp\[i\] = dp\[i − 1\] + dp\[i − 2\] 向下递归分解，直到触及基本情况 dp\[1\] = 1 或 dp\[2\] = 2。

## 结构与关系

求 dp\[9\] 时先求 dp\[8\] 与 dp\[7\]；求 dp\[8\] 又会求 dp\[7\] 与 dp\[6\]。暴力树中的两个 dp\[7\] 不共享一次计算，每次遇到都会各自再次展开求解。

图中只画到前四层共 15 个状态节点，底部 16 个省略号表示继续递归至基本情况 dp\[1\] 或 dp\[2\]。表中次数（如 dp\[5\] 出现 4 次）只统计已画出的四层，不代表整个递归过程的总次数。

<table><caption>已展示的四层递归状态</caption><thead><tr><th scope="col">层（根为第 1 层）</th><th scope="col">状态（从左到右）</th></tr></thead><tbody><tr><th scope="row">1</th><td>dp[9]</td></tr><tr><th scope="row">2</th><td>dp[8]、dp[7]</td></tr><tr><th scope="row">3</th><td>dp[7]、dp[6]、dp[6]、dp[5]</td></tr><tr><th scope="row">4</th><td>dp[6]、dp[5]、dp[5]、dp[4]、dp[5]、dp[4]、dp[4]、dp[3]</td></tr></tbody></table>

<table><caption>分解关系与前四层出现次数</caption><thead><tr><th scope="col">状态</th><th scope="col">左子问题</th><th scope="col">右子问题</th><th scope="col">前四层出现次数</th></tr></thead><tbody><tr><th scope="row">dp[9]</th><td>dp[8]</td><td>dp[7]</td><td>1</td></tr><tr><th scope="row">dp[8]</th><td>dp[7]</td><td>dp[6]</td><td>1</td></tr><tr><th scope="row">dp[7]</th><td>dp[6]</td><td>dp[5]</td><td>2</td></tr><tr><th scope="row">dp[6]</th><td>dp[5]</td><td>dp[4]</td><td>3</td></tr><tr><th scope="row">dp[5]</th><td>dp[4]</td><td>dp[3]</td><td>4</td></tr><tr><th scope="row">dp[4]</th><td>dp[3]</td><td>dp[2]</td><td>3</td></tr><tr><th scope="row">dp[3]</th><td>dp[2]</td><td>dp[1]</td><td>1</td></tr></tbody></table>

<a id="source-369"></a>

重复状态并非共享一个已算出的结果；暴力递归每次遇到它都会各自再次展开求解。

## 结果

同一个状态节点在树中出现多次，代表暴力递归对该子问题发起了多次独立的重复计算；底部文字指出重叠子问题导致时间复杂度达到指数阶 O(2^n)。
