<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 64b8cc54c01e82a6ecfd286272df1f119102cd51e0ef75de433b02be70395295 -->

# 用三個布林陣列記錄皇后約束

用列陣列 cols 與對角線陣列 diags1、diags2，按零基行列座標對映記錄並檢查皇后的佔用狀態。

## 問題與輸入

與前兩圖的 1 基座標不同，本圖對應程式碼實現：4×4 棋盤（n = 4）中行索引 row 從上到下、列索引 col 從左到右均從 0 開始（零基索引）。圖中皇后位於零基座標 (1, 1)（第 2 行第 2 列）；布林陣列中 T 表示已佔用，F 表示空閒。

## 結構與關係

把候選格 (row, col) 對映到三個陣列下標：列索引 col、主對角線索引 row − col + n − 1（因 row − col 可能為負，加 n − 1 後對映到非負陣列索引）、次對角線索引 row + col。三個位置都為 F 才能在該格放入皇后。

放入皇后時把這三項置為 T；完成後續搜尋並回溯時再恢復為 F。本例 n = 4、皇后在零基座標 (1, 1)，對應 cols\[1\]、diags1\[3\]、diags2\[2\] 三項為 T。

<table><caption>約束陣列的索引規則</caption><thead><tr><th scope="col">陣列</th><th scope="col">長度</th><th scope="col">候選格對應索引</th><th scope="col">本例為 T 的索引</th></tr></thead><tbody><tr><th scope="row">cols</th><td>n = 4</td><td>col</td><td>1</td></tr><tr><th scope="row">diags1</th><td>2n−1 = 7</td><td>row−col+n−1</td><td>3</td></tr><tr><th scope="row">diags2</th><td>2n−1 = 7</td><td>row+col</td><td>2</td></tr></tbody></table>

<table><caption>當前三個陣列的完整值</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">cols</th><th scope="col">diags1</th><th scope="col">diags2</th></tr></thead><tbody><tr><th scope="row">0</th><td>F</td><td>F</td><td>F</td></tr><tr><th scope="row">1</th><td>T</td><td>F</td><td>F</td></tr><tr><th scope="row">2</th><td>F</td><td>F</td><td>T</td></tr><tr><th scope="row">3</th><td>F</td><td>T</td><td>F</td></tr><tr><th scope="row">4</th><td>無此索引</td><td>F</td><td>F</td></tr><tr><th scope="row">5</th><td>無此索引</td><td>F</td><td>F</td></tr><tr><th scope="row">6</th><td>無此索引</td><td>F</td><td>F</td></tr></tbody></table>

<a id="source-366"></a>

同一主對角線的 row − col 相同（加 n − 1 轉為非負索引），同一次對角線的 row + col 相同，因此可用布林陣列檢查佔用。

## 結果

藉助 cols、diags1、diags2 三個布林陣列即可在常數時間內判斷列與兩條對角線是否衝突；一般的 n×n 棋盤共有 n 列，主對角線和次對角線各有 2n − 1 條。
