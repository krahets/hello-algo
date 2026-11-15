<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 797e204e4d2e161bc61cbbc38a239b4fd365369e2afb5fad3df979168b601a2e -->

# 最小代价的状态转移

每个状态取前两个状态累计最小代价的较小值，再加上当前台阶自身的代价 cost\[i\]。

## 问题与输入

每一步可上 1 阶或 2 阶，cost\[i\] 表示踏上第 i 阶必须支付的非负代价，地面起点不计费。记 dp\[i\] 为爬到第 i 阶所需支付的累计最小代价。

## 结构与关系

到达第 i 阶的最后一步只能从第 i − 1 阶或第 i − 2 阶走来。无论来自哪个前驱都要支付当前阶代价 cost\[i\]，因此先比较前驱代价 dp\[i − 1\]、dp\[i − 2\] 选择较低累计代价，再加 cost\[i\]。

地面不计费，且每阶代价非负，因此可直接跨到第 1 阶或第 2 阶，初始值为 dp\[1\] = cost\[1\]、dp\[2\] = cost\[2\]。从第 3 阶起依次应用转移方程，直至第 9 阶。

<table><caption>初值与两个前驱的比较</caption><thead><tr><th scope="col">状态</th><th scope="col">可用前驱或起点</th><th scope="col">本阶付费</th><th scope="col">计算式</th></tr></thead><tbody><tr><th scope="row">dp[1]</th><td>地面</td><td>cost[1]</td><td>dp[1] = cost[1]</td></tr><tr><th scope="row">dp[2]</th><td>地面直接跨两阶</td><td>cost[2]</td><td>dp[2] = cost[2]</td></tr><tr><th scope="row">dp[3]</th><td>dp[2] 或 dp[1]</td><td>cost[3]</td><td>min(dp[2], dp[1]) + cost[3]</td></tr><tr><th scope="row">dp[4]</th><td>dp[3] 或 dp[2]</td><td>cost[4]</td><td>min(dp[3], dp[2]) + cost[4]</td></tr><tr><th scope="row">dp[5]</th><td>dp[4] 或 dp[3]</td><td>cost[5]</td><td>min(dp[4], dp[3]) + cost[5]</td></tr><tr><th scope="row">dp[6]</th><td>dp[5] 或 dp[4]</td><td>cost[6]</td><td>min(dp[5], dp[4]) + cost[6]</td></tr><tr><th scope="row">dp[7]</th><td>dp[6] 或 dp[5]</td><td>cost[7]</td><td>min(dp[6], dp[5]) + cost[7]</td></tr><tr><th scope="row">dp[8]</th><td>dp[7] 或 dp[6]</td><td>cost[8]</td><td>min(dp[7], dp[6]) + cost[8]</td></tr><tr><th scope="row">dp[9]</th><td>dp[8] 或 dp[7]</td><td>cost[9]</td><td>min(dp[8], dp[7]) + cost[9]</td></tr></tbody></table>

<a id="source-373"></a>

先选累计代价更低的前驱，再支付当前阶代价 cost\[i\]，得到到达本阶的最小代价。

## 结果

按序递推至目标阶时，对应的 dp 值即为最小累计代价。本图仅展示通用符号关系，未给出 cost\[1\] 至 cost\[9\] 的具体数值。
