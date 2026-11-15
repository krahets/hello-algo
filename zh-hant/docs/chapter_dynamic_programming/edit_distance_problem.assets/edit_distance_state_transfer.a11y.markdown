<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 143234ffa1353e2bf324e7e45da212e3bbee3995f2f688f0c8d69c2070207a3a -->

# 編輯距離的狀態轉移

以將 book 轉換為 code 為例，展示尾字元 k 與 e 不同時，透過新增、刪除、替換分解出的三條剩餘字首子問題。

## 問題與輸入

記狀態 dp\[i, j\] 表示將源字串 s 的前 i 個字元轉換為目標字串 t 的前 j 個字元所需的最少編輯步數，每次新增、刪除或替換操作的代價均為 1。本圖以 s = book、t = code（當前字首長度 i = 4、j = 4）為例，剖析兩字串當前尾部字元 s\[i-1\] = k 與 t\[j-1\] = e 不相同時的狀態轉移來源。

## 結構與關係

左側當前狀態 dp\[i, j\] 對應源串字首 s = "book" 與目標串字首 t = "code"，兩者的尾字元 k 與 e 不同。針對源串末尾，可以分別嘗試新增、刪除或替換三種編輯操作，每種操作各耗費 1 步，並在抵消已匹配或已刪尾字元後留下不同範圍的剩餘字首子問題。

對照表並列給出了三條支路的變化：第一，在 book 尾部插入 e 得到 booke，新插入的尾字元 e 與目標串末尾的 e 匹配抵消，因此原源串 book 的全部 i 個字元仍待處理，目標串則只剩前 j-1 個字元 cod，子問題迴約為 dp\[i, j-1\]（僅 j 減 1）；第二，刪除 book 末尾的 k 得到 boo，源串縮減為前 i-1 個字元 boo，目標串仍為完整的 code，子問題迴約為 dp\[i-1, j\]（僅 i 減 1）；第三，將 book 末尾的 k 替換為 e 得到 booe，兩串末尾的 e 匹配抵消，剩餘字首變為 boo 對 cod，子問題迴約為 dp\[i-1, j-1\]（i 與 j 同時減 1）。

當前狀態 dp\[i, j\] 的最少編輯步數，等於上述三個候選子問題最少步數的最小值再加上本次操作的 1 步代價。注意本圖僅推導單步狀態轉移方程，並未計算從 book 到 code 的最終編輯距離數值。

<table><caption>尾字元不同時的三種操作與剩餘字首</caption><thead><tr><th scope="col">操作</th><th scope="col">操作後的源串</th><th scope="col">剩餘源字首</th><th scope="col">剩餘目標字首</th><th scope="col">子狀態</th></tr></thead><tbody><tr><th scope="row">插入 e</th><td>booke</td><td>book</td><td>cod</td><td>dp[i,j-1]</td></tr><tr><th scope="row">刪除 k</th><td>boo</td><td>boo</td><td>code</td><td>dp[i-1,j]</td></tr><tr><th scope="row">替換 k 為 e</th><td>booe</td><td>boo</td><td>cod</td><td>dp[i-1,j-1]</td></tr></tbody></table>

<a id="source-443"></a>

## 三種編輯操作迴約出不同範圍的剩餘字首

對源串末尾執行新增 e、刪除 k 或將 k 替換為 e 各需 1 步：新增 e 抵消目標尾字元而只令 j 減 1（剩 book 對 cod），刪除 k 去掉源尾字元而只令 i 減 1（剩 boo 對 code），替換 k 為 e 同時抵消兩串尾字元而令 i、j 均減 1（剩 boo 對 cod）。

## 結果

當尾部字元 s\[i-1\] 與 t\[j-1\] 不同時，狀態轉移方程為 dp\[i, j\] = min(dp\[i, j-1\], dp\[i-1, j\], dp\[i-1, j-1\]) + 1；本圖僅展示三條子問題分支的字首迴約關係，未給出 book 到 code 的最終編輯距離。
