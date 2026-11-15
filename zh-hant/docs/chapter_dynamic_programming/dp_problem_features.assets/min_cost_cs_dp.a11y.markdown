<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: cf9fdde2258f1cc8c520e4e5fe4b81c94262fe32fe3cde01ea7f5904dbc9ae41 -->

# 最小代價的狀態轉移

每個狀態取前兩個狀態累計最小代價的較小值，再加上當前臺階自身的代價 cost\[i\]。

## 問題與輸入

每一步可上 1 階或 2 階，cost\[i\] 表示踏上第 i 階必須支付的非負代價，地面起點不計費。記 dp\[i\] 為爬到第 i 階所需支付的累計最小代價。

## 結構與關係

到達第 i 階的最後一步只能從第 i − 1 階或第 i − 2 階走來。無論來自哪個前驅都要支付當前階代價 cost\[i\]，因此先比較前驅代價 dp\[i − 1\]、dp\[i − 2\] 選擇較低累計代價，再加 cost\[i\]。

地面不計費，且每階代價非負，因此可直接跨到第 1 階或第 2 階，初始值為 dp\[1\] = cost\[1\]、dp\[2\] = cost\[2\]。從第 3 階起依次應用轉移方程，直至第 9 階。

<table><caption>初值與兩個前驅的比較</caption><thead><tr><th scope="col">狀態</th><th scope="col">可用前驅或起點</th><th scope="col">本階付費</th><th scope="col">計算式</th></tr></thead><tbody><tr><th scope="row">dp[1]</th><td>地面</td><td>cost[1]</td><td>dp[1] = cost[1]</td></tr><tr><th scope="row">dp[2]</th><td>地面直接跨兩階</td><td>cost[2]</td><td>dp[2] = cost[2]</td></tr><tr><th scope="row">dp[3]</th><td>dp[2] 或 dp[1]</td><td>cost[3]</td><td>min(dp[2], dp[1]) + cost[3]</td></tr><tr><th scope="row">dp[4]</th><td>dp[3] 或 dp[2]</td><td>cost[4]</td><td>min(dp[3], dp[2]) + cost[4]</td></tr><tr><th scope="row">dp[5]</th><td>dp[4] 或 dp[3]</td><td>cost[5]</td><td>min(dp[4], dp[3]) + cost[5]</td></tr><tr><th scope="row">dp[6]</th><td>dp[5] 或 dp[4]</td><td>cost[6]</td><td>min(dp[5], dp[4]) + cost[6]</td></tr><tr><th scope="row">dp[7]</th><td>dp[6] 或 dp[5]</td><td>cost[7]</td><td>min(dp[6], dp[5]) + cost[7]</td></tr><tr><th scope="row">dp[8]</th><td>dp[7] 或 dp[6]</td><td>cost[8]</td><td>min(dp[7], dp[6]) + cost[8]</td></tr><tr><th scope="row">dp[9]</th><td>dp[8] 或 dp[7]</td><td>cost[9]</td><td>min(dp[8], dp[7]) + cost[9]</td></tr></tbody></table>

<a id="source-373"></a>

先選累計代價更低的前驅，再支付當前階代價 cost\[i\]，得到到達本階的最小代價。

## 結果

按序遞推至目標階時，對應的 dp 值即為最小累計代價。本圖僅展示通用符號關係，未給出 cost\[1\] 至 cost\[9\] 的具體數值。
