<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: ac1f6c846af5f9c7edd5a18f8bfd4a4e01e91c83f741d415ed6abe97e0592955 -->

# 編輯距離的動態規劃

按源字首與目標字首逐格遞推，求將字串 bag 轉換為 pack 的最少編輯步數。

## 問題與輸入

源字串 s 為 bag（長度 3），目標字串 t 為 pack（長度 4）；注意本圖輸入與正文其他示例不同。每次可插入、刪除或替換一個字元，單次操作成本均為 1。

狀態 dp\[i, j\] 表示將源串 s 的前 i 個字元（源字首）轉換為目標串 t 的前 j 個字元（目標字首）所需的最少編輯步數。二維表共 4 行 5 列：行 i = 0 至 3 對應源字首空串、b、ba、bag；列 j = 0 至 4 對應目標字首空串、p、pa、pac、pack。

## 結構與關係

先建立 4×5 全零表，其中 dp\[0, 0\] 已為兩空串轉換的有效邊界 0；再初始化首行正長度格 dp\[0, j\] = j（空串連續插入 j 個字元變為目標字首）與首列正長度格 dp\[i, 0\] = i（源字首連續刪除 i 個字元變為空串）。其餘 12 個內部格按行從上到下、每行從左到右依次求解。

求解 dp\[i, j\] 時比較當前源字首尾字元 s\[i - 1\] 與目標字首尾字元 t\[j - 1\]：若兩尾字元相同，無需新增編輯操作，直接等於左上方 dp\[i - 1, j - 1\]（不加 1）；若不同，則比較左方 dp\[i, j - 1\]（插入）、上方 dp\[i - 1, j\]（刪除）、左上方 dp\[i - 1, j - 1\]（替換）三者的最小值再加 1。狀態表逐格標明數值及“邊界有效”“已計算”或“未計算初值”。

<table><caption>完成後的編輯距離表</caption><thead><tr><th scope="col">源字首 / 目標字首</th><th scope="col">空串</th><th scope="col">p</th><th scope="col">pa</th><th scope="col">pac</th><th scope="col">pack</th></tr></thead><tbody><tr><th scope="row">空串</th><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td></tr><tr><th scope="row">b</th><td>1</td><td>1</td><td>2</td><td>3</td><td>4</td></tr><tr><th scope="row">ba</th><td>2</td><td>2</td><td>1</td><td>2</td><td>3</td></tr><tr><th scope="row">bag</th><td>3</td><td>3</td><td>2</td><td>2</td><td>3</td></tr></tbody></table>

<a id="source-444"></a>

## 第 1 步：建立 4×5 初始全零 dp 表

根據源串 s = bag（長度 3）與目標串 t = pack（長度 4），建立 4×5 的二維 dp 表（行 i = 0 至 3 對應源字首空串、b、ba、bag，列 j = 0 至 4 對應目標字首空串、p、pa、pac、pack）。當前 20 格數值均為 0，其中 dp\[0, 0\] 已是空串轉空串的有效邊界；其餘 19 格為未計算初值，首行與首列的正長度邊界尚待設定。

<details><summary>本步完整狀態</summary><p>將源串 bag（長 3）轉換為目標串 pack（長 4），每次插入、刪除或替換成本為 1。當前建立 4×5 全零 dp 表，dp[0, 0] 為有效邊界 0，其餘 19 格為未計算初值 0，等待設定首行與首列的正長度邊界。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">i=1，b</th><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">i=2，ba</th><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">i=3，bag</th><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-445"></a>

## 第 2 步：初始化首行與首列空串轉換邊界

保留空串轉空串的 dp\[0, 0\] = 0。初始化首行 dp\[0, 0\] 至 dp\[0, 4\] 為 \[0, 1, 2, 3, 4\]（源字首為空串，轉為長 j 的目標字首空串、p、pa、pac、pack 需連續插入 j 個字元，其中空串轉 pack 為 dp\[0, 4\] = 4）；初始化首列 dp\[0, 0\] 至 dp\[3, 0\] 為 \[0, 1, 2, 3\]（長 i 的源字首空串、b、ba、bag 轉為空串需連續刪除 i 個字元，其中 bag 轉空串為 dp\[3, 0\] = 3）。內部第 1 至 3 行、第 1 至 4 列的 12 個 0 仍為未計算初值。

<details><summary>本步完整狀態</summary><p>將源串 bag 轉換為目標串 pack，每次編輯成本為 1。空串邊界初始化完成：首行 dp[0, 0] 至 dp[0, 4]（空串轉空串、p、pa、pac、pack）設為有效邊界 [0, 1, 2, 3, 4]；首列 dp[0, 0] 至 dp[3, 0]（空串、b、ba、bag 轉空串）設為有效邊界 [0, 1, 2, 3]；內部 12 格仍為未計算初值 0。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>1，邊界有效</td><td>2，邊界有效</td><td>3，邊界有效</td><td>4，邊界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">i=2，ba</th><td>2，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-446"></a>

## 第 3 步：計算 dp\[1, 1\]（源字首 b 轉目標字首 p）：最少 1 步

處理 i = 1, j = 1，求源字首 b 轉為目標字首 p 的 dp\[1, 1\]：源尾字元 b 與目標尾字元 p 不同，比較左方 dp\[1, 0\] = 1、上方 dp\[0, 1\] = 1、左上方 dp\[0, 0\] = 0，取最小值 0 加 1（對應將 b 替換為 p），寫入 dp\[1, 1\] = 1。

<details><summary>本步完整狀態</summary><p>將 bag 轉換為 pack，每次編輯成本為 1。當前計算 dp[1, 1]（源字首 b 轉目標字首 p）：尾字元 b 與 p 不同，比較左方 1、上方 1、左上方 0，取 min(1, 1, 0) + 1 = 1，寫入 dp[1, 1] = 1。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>1，邊界有效</td><td>2，邊界有效</td><td>3，邊界有效</td><td>4，邊界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，邊界有效</td><td>1，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">i=2，ba</th><td>2，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-447"></a>

## 第 4 步：計算 dp\[1, 2\]（源字首 b 轉目標字首 pa）：最少 2 步

處理 i = 1, j = 2，求源字首 b 轉為目標字首 pa 的 dp\[1, 2\]：源尾字元 b 與目標尾字元 a 不同，比較左方 dp\[1, 1\] = 1、上方 dp\[0, 2\] = 2、左上方 dp\[0, 1\] = 1，取最小值 1 加 1，寫入 dp\[1, 2\] = 2。

<details><summary>本步完整狀態</summary><p>將 bag 轉換為 pack，每次編輯成本為 1。當前計算 dp[1, 2]（源字首 b 轉目標字首 pa）：尾字元 b 與 a 不同，比較左方 1、上方 2、左上方 1，取 min(1, 2, 1) + 1 = 2，寫入 dp[1, 2] = 2。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>1，邊界有效</td><td>2，邊界有效</td><td>3，邊界有效</td><td>4，邊界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">i=2，ba</th><td>2，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-448"></a>

## 第 5 步：計算 dp\[1, 3\]（源字首 b 轉目標字首 pac）：最少 3 步

處理 i = 1, j = 3，求源字首 b 轉為目標字首 pac 的 dp\[1, 3\]：源尾字元 b 與目標尾字元 c 不同，比較左方 dp\[1, 2\] = 2、上方 dp\[0, 3\] = 3、左上方 dp\[0, 2\] = 2，取最小值 2 加 1，寫入 dp\[1, 3\] = 3。

<details><summary>本步完整狀態</summary><p>將 bag 轉換為 pack，每次編輯成本為 1。當前計算 dp[1, 3]（源字首 b 轉目標字首 pac）：尾字元 b 與 c 不同，比較左方 2、上方 3、左上方 2，取 min(2, 3, 2) + 1 = 3，寫入 dp[1, 3] = 3。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>1，邊界有效</td><td>2，邊界有效</td><td>3，邊界有效</td><td>4，邊界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>0，未計算初值</td></tr><tr><th scope="row">i=2，ba</th><td>2，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-449"></a>

## 第 6 步：計算 dp\[1, 4\]（源字首 b 轉目標串 pack）：最少 4 步

處理 i = 1, j = 4，求源字首 b 轉為完整目標串 pack 的 dp\[1, 4\]：源尾字元 b 與目標尾字元 k 不同，比較左方 dp\[1, 3\] = 3、上方 dp\[0, 4\] = 4、左上方 dp\[0, 3\] = 3，取最小值 3 加 1，寫入 dp\[1, 4\] = 4，完成第 1 行。

<details><summary>本步完整狀態</summary><p>將 bag 轉換為 pack，每次編輯成本為 1。當前計算 dp[1, 4]（源字首 b 轉目標串 pack）：尾字元 b 與 k 不同，比較左方 3、上方 4、左上方 3，取 min(3, 4, 3) + 1 = 4，寫入 dp[1, 4] = 4，完成第 1 行。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>1，邊界有效</td><td>2，邊界有效</td><td>3，邊界有效</td><td>4，邊界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">i=2，ba</th><td>2，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-450"></a>

## 第 7 步：計算 dp\[2, 1\]（源字首 ba 轉目標字首 p）：最少 2 步

進入第 2 行，處理 i = 2, j = 1，求源字首 ba 轉為目標字首 p 的 dp\[2, 1\]：源尾字元 a 與目標尾字元 p 不同，比較左方 dp\[2, 0\] = 2、上方 dp\[1, 1\] = 1、左上方 dp\[1, 0\] = 1，取最小值 1 加 1，寫入 dp\[2, 1\] = 2。

<details><summary>本步完整狀態</summary><p>將 bag 轉換為 pack，每次編輯成本為 1。當前計算 dp[2, 1]（源字首 ba 轉目標字首 p）：尾字元 a 與 p 不同，比較左方 2、上方 1、左上方 1，取 min(2, 1, 1) + 1 = 2，寫入 dp[2, 1] = 2。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>1，邊界有效</td><td>2，邊界有效</td><td>3，邊界有效</td><td>4，邊界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">i=2，ba</th><td>2，邊界有效</td><td>2，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-451"></a>

## 第 8 步：計算 dp\[2, 2\]（源字首 ba 轉目標字首 pa）：尾字元同為 a，直接取 1

處理 i = 2, j = 2，求源字首 ba 轉為目標字首 pa 的 dp\[2, 2\]：當前源字首尾字元 s\[1\] 與目標字首尾字元 t\[1\] 同為 a，兩尾字元完全匹配，無需新增編輯操作，因此不在 b 轉 p 的結果上加 1，直接複製左上方 dp\[1, 1\] = 1，寫入 dp\[2, 2\] = 1。

<details><summary>本步完整狀態</summary><p>將 bag 轉換為 pack，每次編輯成本為 1。當前計算 dp[2, 2]（源字首 ba 轉目標字首 pa）：源尾字元與目標尾字元同為 a，無需新增編輯操作，直接複製左上方 dp[1, 1] = 1（b 轉 p 的步數），得 dp[2, 2] = 1。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>1，邊界有效</td><td>2，邊界有效</td><td>3，邊界有效</td><td>4，邊界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">i=2，ba</th><td>2，邊界有效</td><td>2，已計算</td><td>1，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-452"></a>

## 第 9 步：計算 dp\[2, 3\]（源字首 ba 轉目標字首 pac）：最少 2 步

處理 i = 2, j = 3，求源字首 ba 轉為目標字首 pac 的 dp\[2, 3\]：源尾字元 a 與目標尾字元 c 不同，比較左方 dp\[2, 2\] = 1、上方 dp\[1, 3\] = 3、左上方 dp\[1, 2\] = 2，取左方最小值 1（在 ba 轉 pa 的 1 步基礎上插入 c）加 1，寫入 dp\[2, 3\] = 2。

<details><summary>本步完整狀態</summary><p>將 bag 轉換為 pack，每次編輯成本為 1。當前計算 dp[2, 3]（源字首 ba 轉目標字首 pac）：尾字元 a 與 c 不同，比較左方 1、上方 3、左上方 2，取 min(1, 3, 2) + 1 = 2，寫入 dp[2, 3] = 2。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>1，邊界有效</td><td>2，邊界有效</td><td>3，邊界有效</td><td>4，邊界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">i=2，ba</th><td>2，邊界有效</td><td>2，已計算</td><td>1，已計算</td><td>2，已計算</td><td>0，未計算初值</td></tr><tr><th scope="row">i=3，bag</th><td>3，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-453"></a>

## 第 10 步：計算 dp\[2, 4\]（源字首 ba 轉目標串 pack）：最少 3 步

處理 i = 2, j = 4，求源字首 ba 轉為完整目標串 pack 的 dp\[2, 4\]：源尾字元 a 與目標尾字元 k 不同，比較左方 dp\[2, 3\] = 2、上方 dp\[1, 4\] = 4、左上方 dp\[1, 3\] = 3，取左方最小值 2 加 1，寫入 dp\[2, 4\] = 3，完成第 2 行。

<details><summary>本步完整狀態</summary><p>將 bag 轉換為 pack，每次編輯成本為 1。當前計算 dp[2, 4]（源字首 ba 轉目標串 pack）：尾字元 a 與 k 不同，比較左方 2、上方 4、左上方 3，取 min(2, 4, 3) + 1 = 3，寫入 dp[2, 4] = 3，完成第 2 行。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>1，邊界有效</td><td>2，邊界有效</td><td>3，邊界有效</td><td>4，邊界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">i=2，ba</th><td>2，邊界有效</td><td>2，已計算</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td></tr><tr><th scope="row">i=3，bag</th><td>3，邊界有效</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-454"></a>

## 第 11 步：計算 dp\[3, 1\]（源串 bag 轉目標字首 p）：最少 3 步

進入第 3 行，處理 i = 3, j = 1，求完整源串 bag 轉為目標字首 p 的 dp\[3, 1\]：源尾字元 g 與目標尾字元 p 不同，比較左方 dp\[3, 0\] = 3、上方 dp\[2, 1\] = 2、左上方 dp\[2, 0\] = 2，取最小值 2 加 1，寫入 dp\[3, 1\] = 3。

<details><summary>本步完整狀態</summary><p>將 bag 轉換為 pack，每次編輯成本為 1。當前計算 dp[3, 1]（源串 bag 轉目標字首 p）：尾字元 g 與 p 不同，比較左方 3、上方 2、左上方 2，取 min(3, 2, 2) + 1 = 3，寫入 dp[3, 1] = 3。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>1，邊界有效</td><td>2，邊界有效</td><td>3，邊界有效</td><td>4，邊界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">i=2，ba</th><td>2，邊界有效</td><td>2，已計算</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td></tr><tr><th scope="row">i=3，bag</th><td>3，邊界有效</td><td>3，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-455"></a>

## 第 12 步：計算 dp\[3, 2\]（源串 bag 轉目標字首 pa）：最少 2 步

處理 i = 3, j = 2，求完整源串 bag 轉為目標字首 pa 的 dp\[3, 2\]：源尾字元 g 與目標尾字元 a 不同，比較左方 dp\[3, 1\] = 3、上方 dp\[2, 2\] = 1、左上方 dp\[2, 1\] = 2，取上方最小值 1（刪除尾字元 g 迴約到 ba 轉 pa）加 1，寫入 dp\[3, 2\] = 2。

<details><summary>本步完整狀態</summary><p>將 bag 轉換為 pack，每次編輯成本為 1。當前計算 dp[3, 2]（源串 bag 轉目標字首 pa）：尾字元 g 與 a 不同，比較左方 3、上方 1、左上方 2，取 min(3, 1, 2) + 1 = 2，寫入 dp[3, 2] = 2。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>1，邊界有效</td><td>2，邊界有效</td><td>3，邊界有效</td><td>4，邊界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">i=2，ba</th><td>2，邊界有效</td><td>2，已計算</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td></tr><tr><th scope="row">i=3，bag</th><td>3，邊界有效</td><td>3，已計算</td><td>2，已計算</td><td>0，未計算初值</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-456"></a>

## 第 13 步：計算 dp\[3, 3\]（源串 bag 轉目標字首 pac）：最少 2 步

處理 i = 3, j = 3，求完整源串 bag 轉為目標字首 pac 的 dp\[3, 3\]：源尾字元 g 與目標尾字元 c 不同，比較左方 dp\[3, 2\] = 2、上方 dp\[2, 3\] = 2、左上方 dp\[2, 2\] = 1，取左上方最小值 1（將尾字元 g 替換為 c 迴約到 ba 轉 pa）加 1，寫入 dp\[3, 3\] = 2。

<details><summary>本步完整狀態</summary><p>將 bag 轉換為 pack，每次編輯成本為 1。當前計算 dp[3, 3]（源串 bag 轉目標字首 pac）：尾字元 g 與 c 不同，比較左方 2、上方 2、左上方 1，取 min(2, 2, 1) + 1 = 2，寫入 dp[3, 3] = 2。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>1，邊界有效</td><td>2，邊界有效</td><td>3，邊界有效</td><td>4，邊界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">i=2，ba</th><td>2，邊界有效</td><td>2，已計算</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td></tr><tr><th scope="row">i=3，bag</th><td>3，邊界有效</td><td>3，已計算</td><td>2，已計算</td><td>2，已計算</td><td>0，未計算初值</td></tr></tbody></table></details>

<a id="source-457"></a>

## 第 14 步：計算 dp\[3, 4\]（源串 bag 轉目標串 pack）：最少 3 步

處理右下角 i = 3, j = 4，求完整源串 bag 轉為完整目標串 pack 的 dp\[3, 4\]：源尾字元 g 與目標尾字元 k 不同，比較左方 dp\[3, 3\] = 2、上方 dp\[2, 4\] = 3、左上方 dp\[2, 3\] = 2，取最小值 2 加 1，寫入 dp\[3, 4\] = 3，全表計算完成。

<details><summary>本步完整狀態</summary><p>將 bag 轉換為 pack，每次編輯成本為 1。當前計算 dp[3, 4]（源串 bag 轉目標串 pack）：尾字元 g 與 k 不同，比較左方 2、上方 3、左上方 2，取 min(2, 3, 2) + 1 = 3，寫入 dp[3, 4] = 3，全表填畢。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>1，邊界有效</td><td>2，邊界有效</td><td>3，邊界有效</td><td>4，邊界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">i=2，ba</th><td>2，邊界有效</td><td>2，已計算</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td></tr><tr><th scope="row">i=3，bag</th><td>3，邊界有效</td><td>3，已計算</td><td>2，已計算</td><td>2，已計算</td><td>3，已計算</td></tr></tbody></table></details>

<a id="source-458"></a>

## 第 15 步：讀取右下角 dp\[3, 4\]，返回最少編輯步數 3

全部狀態轉移結束後，移除前驅比較高亮，單獨突出右下角 dp\[3, 4\] = 3，作為將完整源串 bag 轉換為完整目標串 pack 所需的最少編輯步數返回。

<details><summary>本步完整狀態</summary><p>將 bag 轉換為 pack，每次編輯成本為 1。全表計算完成，讀取右下角 dp[3, 4] = 3，返回 bag 轉 pack 的最少編輯步數 3。</p><table><caption>當前編輯距離與計算進度</caption><thead><tr><th scope="col">源字首</th><th scope="col">j=0，空串</th><th scope="col">j=1，p</th><th scope="col">j=2，pa</th><th scope="col">j=3，pac</th><th scope="col">j=4，pack</th></tr></thead><tbody><tr><th scope="row">i=0，空串</th><td>0，邊界有效</td><td>1，邊界有效</td><td>2，邊界有效</td><td>3，邊界有效</td><td>4，邊界有效</td></tr><tr><th scope="row">i=1，b</th><td>1，邊界有效</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td><td>4，已計算</td></tr><tr><th scope="row">i=2，ba</th><td>2，邊界有效</td><td>2，已計算</td><td>1，已計算</td><td>2，已計算</td><td>3，已計算</td></tr><tr><th scope="row">i=3，bag</th><td>3，邊界有效</td><td>3，已計算</td><td>2，已計算</td><td>2，已計算</td><td>3，已計算</td></tr></tbody></table></details>

## 結果

右下角 dp\[3, 4\] = 3，即將完整源串 bag 轉換為完整目標串 pack 最少需要 3 步編輯。動態規劃表給出最少步數，不唯一指定具體的編輯操作序列。
