<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 8f4dc2fe6ba0363fb550880bda18b605b4bba2ddc712efe032d67c852c8adbc5 -->

# 插入排序逐輪過程

從初始已排序區間 \[0, 0\] 出發，五輪依次將基準元素 1、3、1、5、2 插入左側有序字首，最終得到 \[1, 1, 2, 3, 4, 5\]。

## 問題與輸入

初始陣列為 nums = \[4, 1, 3, 1, 5, 2\]，索引從 0 到 5。僅含首元素 4 的單元素區間天然有序，因此初始“已排序區間”為 \[0, 0\]。

每輪選取有序字首右側緊鄰的元素作為 base，把大於 base 的元素向右移動，再將 base 寫入空出的位置。

## 結構與關係

每輪將下一個元素插入左側有序字首，使字首增加一項。有序字首只保證內部順序，後續較小元素插入時，其中的元素仍可能右移。

第三輪插入第二個 1 時，遇到相等的第一個 1 就停止右移，保留二者原有順序。第四輪的 5 無須移動，但有序字首仍擴大；第五輪再插入 2，完成排序。

<table><caption>插入排序逐輪狀態</caption><thead><tr><th scope="col">時點</th><th scope="col">陣列</th><th scope="col">已排序區間</th><th scope="col">下一輪基準值</th></tr></thead><tbody><tr><th scope="row">初始</th><td>[4, 1, 3, 1, 5, 2]</td><td>[0, 0]</td><td>1</td></tr><tr><th scope="row">第 1 輪後</th><td>[1, 4, 3, 1, 5, 2]</td><td>[0, 1]</td><td>3</td></tr><tr><th scope="row">第 2 輪後</th><td>[1, 3, 4, 1, 5, 2]</td><td>[0, 2]</td><td>1</td></tr><tr><th scope="row">第 3 輪後</th><td>[1, 1, 3, 4, 5, 2]</td><td>[0, 3]</td><td>5</td></tr><tr><th scope="row">第 4 輪後</th><td>[1, 1, 3, 4, 5, 2]</td><td>[0, 4]</td><td>2</td></tr><tr><th scope="row">第 5 輪後</th><td>[1, 1, 2, 3, 4, 5]</td><td>[0, 5]</td><td>無，已完成</td></tr></tbody></table>

<a id="source-262"></a>

從單元素有序字首 \[0, 0\]（值為 4）開始，五輪依次取出右側緊鄰的基準元素 1、3、1、5、2 插入左側有序字首；字首有序僅表示字首內部相對升序，後續更小元素插入時字首內較大元素仍會右移。逐輪陣列見狀態表。

## 結果

經過五輪插入，已排序區間從 \[0, 0\] 逐輪擴展至 \[0, 5\]，最終得到有序且保持相等元素原有順序的陣列 \[1, 1, 2, 3, 4, 5\]。

## 插入排序逐輪過程：動畫

從初始已排序區間 \[0, 0\] 出發，五輪依次將基準元素 1、3、1、5、2 插入左側有序字首，最終得到 \[1, 1, 2, 3, 4, 5\]。

初始陣列為 nums = \[4, 1, 3, 1, 5, 2\]，索引從 0 到 5。僅含首元素 4 的單元素區間天然有序，因此初始“已排序區間”為 \[0, 0\]。

每輪選取有序字首右側緊鄰的元素作為 base，把大於 base 的元素向右移動，再將 base 寫入空出的位置。

每輪將下一個元素插入左側有序字首，使字首增加一項。有序字首只保證內部順序，後續較小元素插入時，其中的元素仍可能右移。

第三輪插入第二個 1 時，遇到相等的第一個 1 就停止右移，保留二者原有順序。第四輪的 5 無須移動，但有序字首仍擴大；第五輪再插入 2，完成排序。

### 第 1 步：從單元素字首開始

初始時索引 0 的首元素 4 單獨構成有序字首 \[0, 0\]；下一輪將選取索引 1 的 1 作為基準元素插入字首。

<details><summary>本步完整狀態</summary><p>六元素插入排序尚未開始：索引 0 的 4 構成有序字首 [0,0]，下一輪基準元素為索引 1 的 1。當前陣列見表。</p><table><caption>初始陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">當前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>4</td><td>有序字首</td></tr><tr><th scope="row">1</th><td>1</td><td>下一輪基準元素</td></tr><tr><th scope="row">2</th><td>3</td><td>尚未處理</td></tr><tr><th scope="row">3</th><td>1</td><td>尚未處理</td></tr><tr><th scope="row">4</th><td>5</td><td>尚未處理</td></tr><tr><th scope="row">5</th><td>2</td><td>尚未處理</td></tr></tbody></table></details>

### 第 2 步：將 1 插入 4 前面

第 1 輪選取索引 1 的 1，將字首中大於它的 4 向右移到索引 1，再把 1 寫入索引 0，有序字首擴為 \[0, 1\]。

<details><summary>本步完整狀態</summary><p>六元素插入排序已完成一輪，有序字首為 [0,1]，下一輪基準元素為索引 2 的 3。當前陣列見表。</p><table><caption>本輪後的陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">當前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>有序字首</td></tr><tr><th scope="row">1</th><td>4</td><td>有序字首</td></tr><tr><th scope="row">2</th><td>3</td><td>下一輪基準元素</td></tr><tr><th scope="row">3</th><td>1</td><td>尚未處理</td></tr><tr><th scope="row">4</th><td>5</td><td>尚未處理</td></tr><tr><th scope="row">5</th><td>2</td><td>尚未處理</td></tr></tbody></table></details>

### 第 3 步：將 3 插入 1 與 4 之間

第 2 輪選取索引 2 的 3，僅將字首中大於 3 的 4 右移到索引 2，再把 3 插入索引 1（位於 1 與 4 之間），有序字首擴為 \[0, 2\]。

<details><summary>本步完整狀態</summary><p>六元素插入排序已完成兩輪，有序字首為 [0,2]，下一輪基準元素為索引 3 的第二個 1。當前陣列見表。</p><table><caption>本輪後的陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">當前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>有序字首</td></tr><tr><th scope="row">1</th><td>3</td><td>有序字首</td></tr><tr><th scope="row">2</th><td>4</td><td>有序字首</td></tr><tr><th scope="row">3</th><td>1</td><td>下一輪基準元素</td></tr><tr><th scope="row">4</th><td>5</td><td>尚未處理</td></tr><tr><th scope="row">5</th><td>2</td><td>尚未處理</td></tr></tbody></table></details>

### 第 4 步：將第二個 1 插入第一個 1 後面

第 3 輪選取索引 3 的第二個 1，將字首中大於 1 的 4 和 3 依次右移；比較到索引 0 相等的第一個 1 時立即停止右移，把第二個 1 插在其後的索引 1，保持相等元素的穩定先後順序。

<details><summary>本步完整狀態</summary><p>六元素插入排序已完成三輪，有序字首為 [0,3]，兩個 1 保持原相對順序；下一輪基準元素為索引 4 的 5。</p><table><caption>本輪後的陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">當前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>有序字首</td></tr><tr><th scope="row">1</th><td>1</td><td>有序字首</td></tr><tr><th scope="row">2</th><td>3</td><td>有序字首</td></tr><tr><th scope="row">3</th><td>4</td><td>有序字首</td></tr><tr><th scope="row">4</th><td>5</td><td>下一輪基準元素</td></tr><tr><th scope="row">5</th><td>2</td><td>尚未處理</td></tr></tbody></table></details>

### 第 5 步：將 5 併入有序字首

第 4 輪選取索引 4 的 5，因 5 大於有序字首 \[1, 1, 3, 4\] 中的最大元素 4，無須右移任何元素，5 直接原地併入字首，有序字首擴為 \[0, 4\]。

<details><summary>本步完整狀態</summary><p>六元素插入排序已完成四輪，本輪沒有移動元素；有序字首仍擴大為 [0,4]，下一輪基準元素為索引 5 的 2。</p><table><caption>本輪後的陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">當前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>有序字首</td></tr><tr><th scope="row">1</th><td>1</td><td>有序字首</td></tr><tr><th scope="row">2</th><td>3</td><td>有序字首</td></tr><tr><th scope="row">3</th><td>4</td><td>有序字首</td></tr><tr><th scope="row">4</th><td>5</td><td>有序字首</td></tr><tr><th scope="row">5</th><td>2</td><td>下一輪基準元素</td></tr></tbody></table></details>

### 第 6 步：將 2 插入兩個 1 後面

第 5 輪選取末尾索引 5 的 2，將字首中大於 2 的 5、4、3 依次右移一格，再把 2 插入兩個 1 之後的索引 2，有序字首覆蓋 \[0, 5\]，排序完成。

<details><summary>本步完整狀態</summary><p>六元素插入排序已完成五輪：3、4、5 各向右移動一位，2 已插入索引 2，有序字首覆蓋 [0,5]，排序完成。</p><table><caption>本輪後的陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">當前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>有序字首</td></tr><tr><th scope="row">1</th><td>1</td><td>有序字首</td></tr><tr><th scope="row">2</th><td>2</td><td>有序字首</td></tr><tr><th scope="row">3</th><td>3</td><td>有序字首</td></tr><tr><th scope="row">4</th><td>4</td><td>有序字首</td></tr><tr><th scope="row">5</th><td>5</td><td>有序字首</td></tr></tbody></table></details>

### 結果

經過五輪插入，已排序區間從 \[0, 0\] 逐輪擴展至 \[0, 5\]，最終得到有序且保持相等元素原有順序的陣列 \[1, 1, 2, 3, 4, 5\]。
