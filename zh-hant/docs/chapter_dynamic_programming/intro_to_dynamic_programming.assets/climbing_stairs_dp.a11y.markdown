<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: d66fd72487bb845564378d2e156906d82bf2a1a3809571a56a1e536cfad2bdda -->

# 從初始狀態迭代計算爬樓梯方案數

從初始狀態 dp\[1\] = 1、dp\[2\] = 2 出發，每次將相鄰前兩項相加，自左向右迭代推算至 dp\[9\]。

## 問題與輸入

爬樓梯每步可上 1 階或 2 階，dp\[i\] 表示爬到第 i 階的方案數。本圖展示自底向上的動態規劃填表過程，無需藉助遞迴呼叫堆疊。

## 結構與關係

先設定 dp\[1\] = 1、dp\[2\] = 2，再按 dp\[3\] 到 dp\[9\] 順序依次計算 dp\[i\] = dp\[i − 1\] + dp\[i − 2\]：因為每項只依賴前兩項，而計算到該項時它們都已先算出。

圖中方塊只寫狀態名 dp\[1\] 至 dp\[9\]；數值 3、5、8、13、21、34 以及 dp\[9\] 的 55 不是源圖方塊標值，而是按初值和轉移公式推算出的結果，表中將這些推算結果與依賴關係對應列出。

<table><caption>依賴關係與代入公式推算的值</caption><thead><tr><th scope="col">狀態</th><th scope="col">來源</th><th scope="col">值及依據</th></tr></thead><tbody><tr><th scope="row">dp[1]</th><td>初始狀態</td><td>1（圖中給定初值）</td></tr><tr><th scope="row">dp[2]</th><td>初始狀態</td><td>2（圖中給定初值）</td></tr><tr><th scope="row">dp[3]</th><td>dp[2] + dp[1]</td><td>3（由公式推算）</td></tr><tr><th scope="row">dp[4]</th><td>dp[3] + dp[2]</td><td>5（由公式推算）</td></tr><tr><th scope="row">dp[5]</th><td>dp[4] + dp[3]</td><td>8（由公式推算）</td></tr><tr><th scope="row">dp[6]</th><td>dp[5] + dp[4]</td><td>13（由公式推算）</td></tr><tr><th scope="row">dp[7]</th><td>dp[6] + dp[5]</td><td>21（由公式推算）</td></tr><tr><th scope="row">dp[8]</th><td>dp[7] + dp[6]</td><td>34（由公式推算）</td></tr><tr><th scope="row">dp[9]</th><td>dp[8] + dp[7]</td><td>55（由公式推算）</td></tr></tbody></table>

<a id="source-371"></a>

從已知小問題向目標狀態按序遞推，無須遞迴呼叫堆疊。

## 結果

自底向上迭代時每個狀態只計算一次，到達目標狀態即終止；按圖中初始值與轉移公式推算，目標 dp\[9\] 對應的方案數為 55。
