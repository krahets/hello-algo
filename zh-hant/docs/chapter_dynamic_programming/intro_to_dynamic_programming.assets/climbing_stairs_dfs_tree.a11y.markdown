<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: e0b52192af4a36dc15359bb0985aa1e4e4529909428ea043f0650c66c100bd9e -->

# 暴力爬樓梯搜尋的重疊子問題

從 dp\[9\] 自頂向下暴力遞迴拆分時，相同的子問題不共享結果，會在不同分支中被反覆展開求解。

## 問題與輸入

爬樓梯問題中每步上 1 階或 2 階，dp\[i\] 表示爬到第 i 階的方案數。暴力搜尋直接按遞推式 dp\[i\] = dp\[i − 1\] + dp\[i − 2\] 向下遞迴分解，直到觸及基本情況 dp\[1\] = 1 或 dp\[2\] = 2。

## 結構與關係

求 dp\[9\] 時先求 dp\[8\] 與 dp\[7\]；求 dp\[8\] 又會求 dp\[7\] 與 dp\[6\]。暴力樹中的兩個 dp\[7\] 不共享一次計算，每次遇到都會各自再次展開求解。

圖中只畫到前四層共 15 個狀態節點，底部 16 個省略號表示繼續遞迴至基本情況 dp\[1\] 或 dp\[2\]。表中次數（如 dp\[5\] 出現 4 次）只統計已畫出的四層，不代表整個遞迴過程的總次數。

<table><caption>已展示的四層遞迴狀態</caption><thead><tr><th scope="col">層（根為第 1 層）</th><th scope="col">狀態（從左到右）</th></tr></thead><tbody><tr><th scope="row">1</th><td>dp[9]</td></tr><tr><th scope="row">2</th><td>dp[8]、dp[7]</td></tr><tr><th scope="row">3</th><td>dp[7]、dp[6]、dp[6]、dp[5]</td></tr><tr><th scope="row">4</th><td>dp[6]、dp[5]、dp[5]、dp[4]、dp[5]、dp[4]、dp[4]、dp[3]</td></tr></tbody></table>

<table><caption>分解關係與前四層出現次數</caption><thead><tr><th scope="col">狀態</th><th scope="col">左子問題</th><th scope="col">右子問題</th><th scope="col">前四層出現次數</th></tr></thead><tbody><tr><th scope="row">dp[9]</th><td>dp[8]</td><td>dp[7]</td><td>1</td></tr><tr><th scope="row">dp[8]</th><td>dp[7]</td><td>dp[6]</td><td>1</td></tr><tr><th scope="row">dp[7]</th><td>dp[6]</td><td>dp[5]</td><td>2</td></tr><tr><th scope="row">dp[6]</th><td>dp[5]</td><td>dp[4]</td><td>3</td></tr><tr><th scope="row">dp[5]</th><td>dp[4]</td><td>dp[3]</td><td>4</td></tr><tr><th scope="row">dp[4]</th><td>dp[3]</td><td>dp[2]</td><td>3</td></tr><tr><th scope="row">dp[3]</th><td>dp[2]</td><td>dp[1]</td><td>1</td></tr></tbody></table>

<a id="source-369"></a>

重複狀態並非共享一個已算出的結果；暴力遞迴每次遇到它都會各自再次展開求解。

## 結果

同一個狀態節點在樹中出現多次，代表暴力遞迴對該子問題發起了多次獨立的重複計算；底部文字指出重疊子問題導致時間複雜度達到指數階 O(2^n)。
