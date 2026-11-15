<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 5c6faca0a26996f32e4ce6c4505cae973437aed3cf871fb005de5cf148ab2fa5 -->

# 用小頂堆積尋找 Top-k

保留至多k個候選，用其中最小值與後續元素比較，淘汰較小候選，得到最大的k個值。

## 問題與輸入

輸入 nums=\[1,7,6,3,2\]，k=3，目標是找出最大的三個元素。指標i是輸入索引；heap是小頂堆積的層序陣列，索引0為堆積頂，存放堆積內最小值。

先將前k個輸入依次入堆積。之後每次把當前值與堆積頂比較：當前值更大，才先彈出堆積頂再加入當前值；否則跳過。替換中的彈出狀態暫時只有k−1項，不代表演算法已完成這一輪。

## 結構與關係

堆積頂是候選中最小的值。新值超過它時，淘汰堆積頂不會丟掉已處理範圍內最大的k個值；替換完成後仍保留k個候選。檢視堆積頂只需O(1)，入堆積或出堆積調整為O(log k)。

<table><caption>輸入陣列與索引</caption><thead><tr><th scope="col">輸入索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>7</td></tr><tr><th scope="row">2</th><td>6</td></tr><tr><th scope="row">3</th><td>3</td></tr><tr><th scope="row">4</th><td>2</td></tr></tbody></table>

<a id="source-164"></a>

## 第 1 步：將1加入空堆積

初始化階段（前 k=3 個元素直接入堆積）：讀取輸入索引 i=0 的元素 1 加入空堆積，成為首個候選。

<details><summary>本步完整狀態</summary><p>輸入 nums=[1,7,6,3,2]，k=3。當前指標 i=0（值 1）；小頂堆積現有 1 項 [1]，堆積頂索引 0 為 1。完整候選與來源索引見當前狀態表；堆積陣列按層序表示，根在索引 0，左右子節點在索引 1、2（若存在）。</p><table><caption>當前小頂堆積候選</caption><thead><tr><th scope="col">堆積陣列索引</th><th scope="col">值</th><th scope="col">來自輸入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>0</td></tr></tbody></table></details>

<a id="source-165"></a>

## 第 2 步：將7入堆積

讀取輸入索引 i=1 的元素 7 入堆積，掛在堆積索引 1；父節點堆積頂為 1（1 &lt; 7），滿足小頂堆積條件，無須上浮。

<details><summary>本步完整狀態</summary><p>輸入 nums=[1,7,6,3,2]，k=3。當前指標 i=1（值 7）；小頂堆積現有 2 項 [1, 7]，堆積頂索引 0 為 1。完整候選與來源索引見當前狀態表；堆積陣列按層序表示，根在索引 0，左右子節點在索引 1、2（若存在）。</p><table><caption>當前小頂堆積候選</caption><thead><tr><th scope="col">堆積陣列索引</th><th scope="col">值</th><th scope="col">來自輸入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>0</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr></tbody></table></details>

<a id="source-166"></a>

## 第 3 步：將6入堆積，初始候選齊備

讀取輸入索引 i=2 的元素 6 入堆積，掛在堆積索引 2；堆積頂仍為最小候選 1。至此輸入前 k=3 項已全部入堆積，接下來走訪後續元素並與堆積頂比較。

<details><summary>本步完整狀態</summary><p>輸入 nums=[1,7,6,3,2]，k=3。當前指標 i=2（值 6）；小頂堆積已滿 3 項 [1, 7, 6]，堆積頂索引 0 為最小候選 1。完整候選與來源索引見當前狀態表；堆積陣列按層序表示，根在索引 0，左右子節點在索引 1、2（若存在）。</p><table><caption>當前小頂堆積候選</caption><thead><tr><th scope="col">堆積陣列索引</th><th scope="col">值</th><th scope="col">來自輸入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>0</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr><tr><th scope="row">2</th><td>6</td><td>2</td></tr></tbody></table></details>

<a id="source-167"></a>

## 第 4 步：比較當前3與堆積頂1

指標移至輸入索引 i=3，當前元素 3 大於堆積頂最小候選 1，說明 1 不屬於前三大元素，需彈出 1 並換入 3。本狀態僅比較，小頂堆積仍為 3 項 \[1, 7, 6\]。

<details><summary>本步完整狀態</summary><p>輸入 nums=[1,7,6,3,2]，k=3。當前指標 i=3（值 3），正與堆積頂 1 比較（3 &gt; 1，待替換）；小頂堆積仍為 3 項 [1, 7, 6]，堆積頂索引 0 為 1。完整候選與來源索引見當前狀態表；堆積陣列按層序表示，根在索引 0，左右子節點在索引 1、2（若存在）。</p><table><caption>當前小頂堆積候選</caption><thead><tr><th scope="col">堆積陣列索引</th><th scope="col">值</th><th scope="col">來自輸入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>0</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr><tr><th scope="row">2</th><td>6</td><td>2</td></tr></tbody></table></details>

<a id="source-168"></a>

## 第 5 步：彈出舊堆積頂1

替換分兩步進行：先彈出舊堆積頂 1，堆積內剩餘兩項重新調整為 \[6, 7\]，6 成為暫時的堆積頂。此時堆積中暫時只有 k−1=2 個候選，並非漏掉結果，而是替換的中間狀態；當前元素 3 緊接著在下一狀態入堆積，完成後即恢復 3 項。

<details><summary>本步完整狀態</summary><p>輸入 nums=[1,7,6,3,2]，k=3。當前指標 i=3（值 3 尚待入堆積）；舊堆積頂 1 已彈出，小頂堆積處於暫時 k−1=2 項的替換中間態 [6, 7]，堆積頂索引 0 暫為 6。完整候選與來源索引見當前狀態表；堆積陣列按層序表示，根在索引 0，左右子節點在索引 1、2（若存在）。</p><table><caption>當前小頂堆積候選</caption><thead><tr><th scope="col">堆積陣列索引</th><th scope="col">值</th><th scope="col">來自輸入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>6</td><td>2</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr></tbody></table></details>

<a id="source-169"></a>

## 第 6 步：將3入堆積

將輸入索引 i=3 的元素 3 加入小頂堆積並上浮至根部，堆積陣列變為 \[3, 7, 6\]，3 成為新堆積頂。此時已恢復 k=3 個候選，儲存著前 4 個輸入中的最大三個值。

<details><summary>本步完整狀態</summary><p>輸入 nums=[1,7,6,3,2]，k=3。當前指標 i=3（值 3 已入堆積）；小頂堆積恢復 3 項 [3, 7, 6]，新堆積頂索引 0 為 3。完整候選與來源索引見當前狀態表；堆積陣列按層序表示，根在索引 0，左右子節點在索引 1、2（若存在）。</p><table><caption>當前小頂堆積候選</caption><thead><tr><th scope="col">堆積陣列索引</th><th scope="col">值</th><th scope="col">來自輸入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td><td>3</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr><tr><th scope="row">2</th><td>6</td><td>2</td></tr></tbody></table></details>

<a id="source-170"></a>

## 第 7 步：比較當前2與堆積頂3

指標移至末尾輸入索引 i=4，當前元素 2 小於堆積頂最小候選 3，無法淘汰堆積內任何候選。本狀態僅展示比較。

<details><summary>本步完整狀態</summary><p>輸入 nums=[1,7,6,3,2]，k=3。當前指標 i=4（值 2），正與堆積頂 3 比較（2 &lt; 3，不滿足替換條件）；小頂堆積仍為 3 項 [3, 7, 6]，堆積頂索引 0 為 3。完整候選與來源索引見當前狀態表；堆積陣列按層序表示，根在索引 0，左右子節點在索引 1、2（若存在）。</p><table><caption>當前小頂堆積候選</caption><thead><tr><th scope="col">堆積陣列索引</th><th scope="col">值</th><th scope="col">來自輸入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td><td>3</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr><tr><th scope="row">2</th><td>6</td><td>2</td></tr></tbody></table></details>

<a id="source-171"></a>

## 第 8 步：跳過2

由於 2 小於堆積頂 3，直接跳過該元素，不執行出堆積或入堆積操作，堆積內三個候選 \[3, 7, 6\] 保持不變。至此全部輸入元素走訪完畢。

<details><summary>本步完整狀態</summary><p>輸入 nums=[1,7,6,3,2]，k=3。當前指標 i=4（值 2 被跳過）；小頂堆積保持 3 項 [3, 7, 6]，堆積頂索引 0 為 3。完整候選與來源索引見當前狀態表；堆積陣列按層序表示，根在索引 0，左右子節點在索引 1、2（若存在）。</p><table><caption>當前小頂堆積候選</caption><thead><tr><th scope="col">堆積陣列索引</th><th scope="col">值</th><th scope="col">來自輸入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td><td>3</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr><tr><th scope="row">2</th><td>6</td><td>2</td></tr></tbody></table></details>

<a id="source-172"></a>

## 第 9 步：返回三個候選

走訪結束，直接返回小頂堆積層序陣列 \[3, 7, 6\]（堆積索引 0 為輸入索引 3 的 3，堆積索引 1 為輸入索引 1 的 7，堆積索引 2 為輸入索引 2 的 6）。該結果只要求滿足小頂堆積父節點不大於子節點的堆積序性質，左、右子節點 7 和 6 無須按升序排列。

<details><summary>本步完整狀態</summary><p>輸入 nums=[1,7,6,3,2]，k=3。走訪已結束，無當前指標；返回最終小頂堆積 [3, 7, 6]（共 3 項，堆積頂索引 0 為 3，索引 1 為 7，索引 2 為 6，呈小頂堆積序而非升序）。完整候選與來源索引見當前狀態表；堆積陣列按層序表示，根在索引 0，左右子節點在索引 1、2（若存在）。</p><table><caption>當前小頂堆積候選</caption><thead><tr><th scope="col">堆積陣列索引</th><th scope="col">值</th><th scope="col">來自輸入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td><td>3</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr><tr><th scope="row">2</th><td>6</td><td>2</td></tr></tbody></table></details>

## 結果

走訪完成後直接返回小頂堆積陣列 heap = \[3, 7, 6\]，即原陣列中最大的三個元素（堆積陣列僅滿足小頂堆積父子關係，左、右子節點 7 和 6 無須按升序排列）。堆積容量不超過 k，空間複雜度為 O(k)，總時間複雜度為 O(n log k)。
