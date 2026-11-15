<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 4858bdbc559eef0ced0f3cd8b0f62e902665b9c0dca59d692f27d0f1d2d3e5c2 -->

# 記憶化搜尋複用已算出的狀態

沿左側主鏈首次計算並快取各子問題，右側再次遇到相同狀態時直接讀取快取返回並參與父狀態求和。

## 問題與輸入

仍求解每步上 1 階或 2 階的爬樓梯方案數，基本情況為 dp\[1\] = 1、dp\[2\] = 2。記憶化搜尋引入陣列 mem 記錄已算出的非基本狀態值，基本情況先直接返回，非基本狀態先查記錄，僅在未記錄時才繼續向下展開。

## 結構與關係

第一次遇到未記錄的狀態，先遞迴求出兩個子問題的值，相加後存入 mem；再次遇到該狀態，就直接讀出記錄並返回。

例如求 dp\[9\] 時先完成左子問題 dp\[8\]，此過程中已經計算並儲存 dp\[7\]；隨後求右子問題（帶剪刀的 dp\[7\]），直接讀快取而不再重複展開，它仍參與 dp\[9\] 的加法。

圖中剪掉的是重複展開的子樹，不是這個子問題的貢獻。基本情況 dp\[1\]、dp\[2\] 先直接返回已知值 1、2，不需要從 mem 讀取。

<table><caption>圖中明確標出的快取複用</caption><thead><tr><th scope="col">當前父狀態</th><th scope="col">先完成的左子問題</th><th scope="col">隨後讀取記錄的右子問題</th></tr></thead><tbody><tr><th scope="row">dp[9]</th><td>dp[8]</td><td>dp[7]</td></tr><tr><th scope="row">dp[8]</th><td>dp[7]</td><td>dp[6]</td></tr><tr><th scope="row">dp[7]</th><td>dp[6]（鏈中省略）</td><td>dp[5]</td></tr></tbody></table>

<table><caption>三種狀態的處理</caption><thead><tr><th scope="col">遇到的狀態</th><th scope="col">處理</th></tr></thead><tbody><tr><th scope="row">dp[1]、dp[2]</th><td>直接返回 1、2</td></tr><tr><th scope="row">非基本狀態，尚無記錄</th><td>遞迴計算、相加、寫入 mem 後返回</td></tr><tr><th scope="row">非基本狀態，已有記錄</th><td>直接返回 mem 中的值，貢獻仍參與加法</td></tr></tbody></table>

<a id="source-370"></a>

先沿左鏈計算並儲存，再複用記錄；右側帶剪刀的重複狀態直接讀快取，仍返回有效方案數參與求和。

## 結果

所有重疊子問題只需展開計算一次，快取命中時仍貢獻有效結果，記憶化搜尋將時間複雜度從指數階降低為線性階 O(n)；基本情況 dp\[1\] 和 dp\[2\] 仍直接返回已知常數。
