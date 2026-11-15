<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: efd2d6a766728a105afdfd079e8c32430e80018a9890a4b2a0523cf46d4bea7b -->

# 遞迴二分搜尋

在十個遞增元素中遞迴查詢 6，搜尋區間依次由 \[0, 9\] 縮至 \[0, 3\]、\[2, 3\]，最終返回索引 2。

## 問題與輸入

輸入有序陣列為 \[1, 3, 6, 8, 12, 15, 23, 26, 31, 35\]，索引從 0 到 9，查詢目標元素為 6。子問題記號 f(i, j) 表示在雙閉區間 \[i, j\] 內搜尋目標，中點索引按 m = (i + j) / 2 向下取整計算。

## 結構與關係

首次比較中點值 12，大於目標 6，進入左半區間；接著比較中點值 3，小於目標，進入右半區間；第三次在索引 2 命中 6。

每次只進入一個候選子區間，已排除的位置仍留在原陣列中。子問題直接返回找到的索引，無須合併。

<table><caption>固定有序輸入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>3</td></tr><tr><th scope="row">2</th><td>6</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>12</td></tr><tr><th scope="row">5</th><td>15</td></tr><tr><th scope="row">6</th><td>23</td></tr><tr><th scope="row">7</th><td>26</td></tr><tr><th scope="row">8</th><td>31</td></tr><tr><th scope="row">9</th><td>35</td></tr></tbody></table>

<table><caption>三次遞迴呼叫</caption><thead><tr><th scope="col">呼叫（閉區間）</th><th scope="col">中點索引 m</th><th scope="col">中點值</th><th scope="col">比較</th><th scope="col">後續</th></tr></thead><tbody><tr><th scope="row">f(0,9)</th><td>4</td><td>12</td><td>12 &gt; 6</td><td>遞迴呼叫 f(0,3)</td></tr><tr><th scope="row">f(0,3)</th><td>1</td><td>3</td><td>3 &lt; 6</td><td>遞迴呼叫 f(2,3)</td></tr><tr><th scope="row">f(2,3)</th><td>2</td><td>6</td><td>6 = 6</td><td>返回索引 2</td></tr></tbody></table>

<a id="source-312"></a>

三次遞迴呼叫依次檢查中點值 12、3、6。前兩次比較排除不含目標的區間，第三次在索引 2 命中目標 6，直接返回索引。

## 結果

底部文字標出“最終求得元素 6 的索引為 2”。三次遞迴呼叫依次比較中點元素 12、3、6，前兩次未命中時分別將候選區間由 10 項縮至 4 項、再縮至 2 項，第三次命中後直接返回，原陣列內容始終保持不變。

## 遞迴二分搜尋：動畫

在十個遞增元素中遞迴查詢 6，搜尋區間依次由 \[0, 9\] 縮至 \[0, 3\]、\[2, 3\]，最終返回索引 2。

輸入有序陣列為 \[1, 3, 6, 8, 12, 15, 23, 26, 31, 35\]，索引從 0 到 9，查詢目標元素為 6。子問題記號 f(i, j) 表示在雙閉區間 \[i, j\] 內搜尋目標，中點索引按 m = (i + j) / 2 向下取整計算。

首次比較中點值 12，大於目標 6，進入左半區間；接著比較中點值 3，小於目標，進入右半區間；第三次在索引 2 命中 6。

每次只進入一個候選子區間，已排除的位置仍留在原陣列中。子問題直接返回找到的索引，無須合併。

<table><caption>固定有序輸入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>3</td></tr><tr><th scope="row">2</th><td>6</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>12</td></tr><tr><th scope="row">5</th><td>15</td></tr><tr><th scope="row">6</th><td>23</td></tr><tr><th scope="row">7</th><td>26</td></tr><tr><th scope="row">8</th><td>31</td></tr><tr><th scope="row">9</th><td>35</td></tr></tbody></table>

### 第 1 步：檢查中點值 12

在初始閉區間 \[0, 9\] 內計算中點 m = (0 + 9) // 2 = 4，中點值 nums\[4\] = 12。因為 12 &gt; 6，目標只能在左半部分，排除索引 4 至 9，遞迴呼叫 f(0, 3)。

<details><summary>本步完整狀態</summary><p>當前呼叫為 f(0, 9)，查詢目標為 6；中點索引 m = 4，中點值為 12（12 &gt; 6），下一步進入左子區間 f(0, 3)。輸入陣列見固定有序輸入表。</p><table><caption>當前呼叫</caption><thead><tr><th scope="col">呼叫（閉區間）</th><th scope="col">中點索引 m</th><th scope="col">中點值</th><th scope="col">比較</th><th scope="col">後續</th></tr></thead><tbody><tr><th scope="row">f(0,9)</th><td>4</td><td>12</td><td>12 &gt; 6</td><td>遞迴呼叫 f(0,3)</td></tr></tbody></table></details>

### 第 2 步：檢查中點值 3

在閉區間 \[0, 3\] 內計算中點 m = (0 + 3) // 2 = 1，中點值 nums\[1\] = 3。因為 3 &lt; 6，目標只能在右半部分，排除索引 0 和 1，遞迴呼叫 f(2, 3)。

<details><summary>本步完整狀態</summary><p>當前呼叫為 f(0, 3)，查詢目標為 6；中點索引 m = 1，中點值為 3（3 &lt; 6），下一步進入右子區間 f(2, 3)。輸入陣列見固定有序輸入表。</p><table><caption>當前呼叫</caption><thead><tr><th scope="col">呼叫（閉區間）</th><th scope="col">中點索引 m</th><th scope="col">中點值</th><th scope="col">比較</th><th scope="col">後續</th></tr></thead><tbody><tr><th scope="row">f(0,3)</th><td>1</td><td>3</td><td>3 &lt; 6</td><td>遞迴呼叫 f(2,3)</td></tr></tbody></table></details>

### 第 3 步：命中目標值 6

在閉區間 \[2, 3\] 內計算中點 m = (2 + 3) // 2 = 2，中點值 nums\[2\] = 6，恰與目標值相等，命中目標並直接向上返回索引 2，無須合併操作。

<details><summary>本步完整狀態</summary><p>當前呼叫為 f(2, 3)，查詢目標為 6；中點索引 m = 2，中點值為 6（6 = 6），命中目標並直接返回索引 2。輸入陣列見固定有序輸入表。</p><table><caption>當前呼叫</caption><thead><tr><th scope="col">呼叫（閉區間）</th><th scope="col">中點索引 m</th><th scope="col">中點值</th><th scope="col">比較</th><th scope="col">後續</th></tr></thead><tbody><tr><th scope="row">f(2,3)</th><td>2</td><td>6</td><td>6 = 6</td><td>返回索引 2</td></tr></tbody></table></details>

### 結果

底部文字標出“最終求得元素 6 的索引為 2”。三次遞迴呼叫依次比較中點元素 12、3、6，前兩次未命中時分別將候選區間由 10 項縮至 4 項、再縮至 2 項，第三次命中後直接返回，原陣列內容始終保持不變。
