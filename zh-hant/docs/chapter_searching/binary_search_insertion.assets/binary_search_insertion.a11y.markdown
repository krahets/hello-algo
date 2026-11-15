<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 7ec415f848106a8f585f7c60a2014015b6ad9ff0a5e14aff4e802da653f51ebf -->

# 二分搜尋最左插入點

在含重複值的有序陣列中，遇到 6 仍向左縮小區間，最終返回最左插入索引 2。

## 問題與輸入

給定升序陣列 \[1, 3, 6, 6, 6, 6, 6, 10, 12, 15\]，索引為 0 至 9，查詢目標值 target = 6 的插入點。值 6 連續佔據索引 2 至 6；題目要求返回新 6 應插入的索引，使它排在所有已有 6 的最左側（本演算法僅計算並返回插入點索引，不在原陣列中實際執行插入搬移）。

指標 i、j 表示雙閉搜尋區間 \[i, j\] 的左、右邊界，中點索引按 m = (i + j) / 2 向下取整計算。當 nums\[m\] &lt; target 時執行 i = m + 1 向右逼近；當 nums\[m\] &gt; target 或 nums\[m\] == target 時均執行 j = m − 1 向左收縮，使指標 j 持續逼近小於 target 的最右元素、指標 i 持續逼近首個大於等於 target 的位置。

## 結構與關係

每輪先計算中點，再移動一個邊界。邊界剛更新時，圖中的 m 仍是上一次的中點，可能留在新區間之外；只有再次計算中點時才更新 m。

找到等於目標值的元素仍須繼續向左查詢，才能確定所有重複值之前的位置。整個過程只計算插入索引，原陣列不變。

<table><caption>固定輸入：目標值為 6</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>3</td></tr><tr><th scope="row">2</th><td>6</td></tr><tr><th scope="row">3</th><td>6</td></tr><tr><th scope="row">4</th><td>6</td></tr><tr><th scope="row">5</th><td>6</td></tr><tr><th scope="row">6</th><td>6</td></tr><tr><th scope="row">7</th><td>10</td></tr><tr><th scope="row">8</th><td>12</td></tr><tr><th scope="row">9</th><td>15</td></tr></tbody></table>

<a id="source-226"></a>

## 第 1 步：初始化搜尋區間

令左邊界 i = 0、右邊界 j = 9，雙閉搜尋區間 \[0, 9\] 覆蓋全部 10 個元素。

<details><summary>本步完整狀態</summary><p>初始狀態：當前 i = 0，j = 9，雙閉搜尋區間為 [0, 9]，尚未計算中點 m。目標值 target = 6，十元素升序陣列見固定輸入表。</p><table><caption>當前指標</caption><thead><tr><th scope="col">指標</th><th scope="col">索引</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">i</th><td>0</td><td>左邊界；迴圈結束時返回它</td></tr><tr><th scope="row">j</th><td>9</td><td>右邊界</td></tr></tbody></table></details>

<a id="source-227"></a>

## 第 2 步：計算中點 4

對閉區間 \[0, 9\] 計算首輪中點 m = (0 + 9) // 2 = 4，中點元素 nums\[4\] = 6，等於目標值 6。

<details><summary>本步完整狀態</summary><p>第 1 輪取中點：當前 i = 0，j = 9，閉區間為 [0, 9]，本輪中點 m = 4（對應 nums[4] = 6，等於目標值 6）。</p><table><caption>當前指標</caption><thead><tr><th scope="col">指標</th><th scope="col">索引</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">i</th><td>0</td><td>左邊界；迴圈結束時返回它</td></tr><tr><th scope="row">j</th><td>9</td><td>右邊界</td></tr><tr><th scope="row">m</th><td>4</td><td>本輪中點</td></tr></tbody></table></details>

<a id="source-228"></a>

## 第 3 步：遇到 6，右邊界左移

因 nums\[4\] = 6 等於目標值 6，為繼續排查左側是否還有 6 以定位最左插入點，仍執行 j = m − 1 將右邊界左移至 3；圖中舊中點 m = 4 暫未重算，留在新區間 \[0, 3\] 右側之外。

<details><summary>本步完整狀態</summary><p>第 1 輪收縮區間後：當前 i = 0，j = 3，閉區間縮為 [0, 3]；圖中顯示的 m = 4 是尚未重算的上一輪舊中點，位於新區間外。</p><table><caption>當前指標</caption><thead><tr><th scope="col">指標</th><th scope="col">索引</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">i</th><td>0</td><td>左邊界；迴圈結束時返回它</td></tr><tr><th scope="row">j</th><td>3</td><td>右邊界</td></tr><tr><th scope="row">m</th><td>4</td><td>舊中點，尚未重算</td></tr></tbody></table></details>

<a id="source-229"></a>

## 第 4 步：計算中點 1

對新區間 \[0, 3\] 重新計算中點 m = (0 + 3) // 2 = 1，中點元素 nums\[1\] = 3，小於目標值 6。

<details><summary>本步完整狀態</summary><p>第 2 輪取中點：當前 i = 0，j = 3，閉區間為 [0, 3]，重算後本輪中點更新為 m = 1（對應 nums[1] = 3，小於目標值 6）。</p><table><caption>當前指標</caption><thead><tr><th scope="col">指標</th><th scope="col">索引</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">i</th><td>0</td><td>左邊界；迴圈結束時返回它</td></tr><tr><th scope="row">j</th><td>3</td><td>右邊界</td></tr><tr><th scope="row">m</th><td>1</td><td>本輪中點</td></tr></tbody></table></details>

<a id="source-230"></a>

## 第 5 步：遇到 3，左邊界右移

因 nums\[1\] = 3 小於目標值 6，最左插入點必在右側，執行 i = m + 1 將左邊界右移至 2；圖中舊中點 m = 1 暫未重算，留在新區間 \[2, 3\] 左側之外。

<details><summary>本步完整狀態</summary><p>第 2 輪收縮區間後：當前 i = 2，j = 3，閉區間縮為 [2, 3]；圖中顯示的 m = 1 是尚未重算的上一輪舊中點，位於新區間外。</p><table><caption>當前指標</caption><thead><tr><th scope="col">指標</th><th scope="col">索引</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">i</th><td>2</td><td>左邊界；迴圈結束時返回它</td></tr><tr><th scope="row">j</th><td>3</td><td>右邊界</td></tr><tr><th scope="row">m</th><td>1</td><td>舊中點，尚未重算</td></tr></tbody></table></details>

<a id="source-231"></a>

## 第 6 步：計算中點 2

對區間 \[2, 3\] 重新計算中點 m = (2 + 3) // 2 = 2，中點元素 nums\[2\] = 6，再次等於目標值 6。

<details><summary>本步完整狀態</summary><p>第 3 輪取中點：當前 i = 2，j = 3，閉區間為 [2, 3]，重算後本輪中點更新為 m = 2（對應 nums[2] = 6，等於目標值 6）。</p><table><caption>當前指標</caption><thead><tr><th scope="col">指標</th><th scope="col">索引</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">i</th><td>2</td><td>左邊界；迴圈結束時返回它</td></tr><tr><th scope="row">j</th><td>3</td><td>右邊界</td></tr><tr><th scope="row">m</th><td>2</td><td>本輪中點</td></tr></tbody></table></details>

<a id="source-232"></a>

## 第 7 步：再次遇到 6，區間變空

因 nums\[2\] = 6 等於目標值 6，繼續執行 j = m − 1 得 j = 1；此時 i = 2 大於 j = 1，雙閉搜尋區間變為空區間，滿足迴圈終止條件。

<details><summary>本步完整狀態</summary><p>第 3 輪收縮區間後：當前 i = 2，j = 1（i &gt; j，雙閉區間為空），圖中 m = 2 為尚未清除的舊中點，搜尋迴圈即將結束。</p><table><caption>當前指標</caption><thead><tr><th scope="col">指標</th><th scope="col">索引</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">i</th><td>2</td><td>左邊界；迴圈結束時返回它</td></tr><tr><th scope="row">j</th><td>1</td><td>右邊界</td></tr><tr><th scope="row">m</th><td>2</td><td>舊中點，尚未重算</td></tr></tbody></table></details>

<a id="source-233"></a>

## 第 8 步：返回最左插入索引 2

迴圈因區間為空而結束，返回左邊界索引 i = 2，即新 6 應排在所有已有五個 6 最左側的位置；本演算法只計算並返回插入索引，未對原陣列執行實際插入或元素搬移。

<details><summary>本步完整狀態</summary><p>搜尋結束：圖中僅保留返回指標 i = 2（j、m 不再顯示），表示目標值 6 的最左插入點索引為 2；原十元素陣列保持不變，未執行實際插入。</p><table><caption>當前指標</caption><thead><tr><th scope="col">指標</th><th scope="col">索引</th><th scope="col">含義</th></tr></thead><tbody><tr><th scope="row">i</th><td>2</td><td>左邊界；迴圈結束時返回它</td></tr></tbody></table></details>

## 結果

八幅分步畫面對應三輪折半比較：依次檢查中點 m = 4（值為 6）、m = 1（值為 3）、m = 2（值為 6）。最終當 i = 2、j = 1 時雙閉區間為空，跳出迴圈並返回 i = 2，即所有重複 6 最左側的插入位置。
