<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 477df3277911440517915446d8e23b00887b7a440f26aa227b6db8767e8a5d05 -->

# 大頂堆積彈出堆積頂

先交換堆積頂 9 與堆積底 5，彈出末尾的 9，再讓新根 5 依次與較大子節點 8、7、6 交換下沉，恢復大頂堆積性質。

## 問題與輸入

初始大頂堆積包含 13 個元素，按層序存為陣列 \[9, 8, 7, 6, 7, 6, 2, 1, 4, 3, 6, 2, 5\]。根節點（索引 0）為全堆積最大值 9，最右葉節點（索引 12）為堆積底元素 5。大頂堆積要求任意父節點的值不小於其子節點的值。

樹和陣列表示同一份儲存，陣列按層序排列，索引從0開始。非根位置i的父索引為⌊(i−1)/2⌋，左右子索引為2i+1、2i+2，越界表示該子節點不存在。相等數值用當前位置索引區分。

## 結構與關係

出堆積時先將堆積頂（索引 0）與末尾元素（索引 12）交換，再從陣列末尾刪除原堆積頂，從而避免直接刪除首項引起後續元素整體前移。隨後從根節點開始自頂向下堆積化：每步在當前節點及其左、右子節點中選出最大值；若子節點更大，則與較大的那個子節點交換——只有將較大的子節點換作父節點，才能保證上移後的新父節點同時不小於另一個子節點。噹噹前節點已不小於子節點或到達葉節點時停止下沉。

<a id="source-152"></a>

## 第 1 步：定位堆積頂9與堆積底5

待彈出的最大值 9 位於堆積頂索引 0，最右葉節點 5 位於陣列末尾索引 12。準備先將首尾兩項交換，再從末尾移除 9。

<details><summary>本步完整狀態</summary><p>當前堆積儲存共 13 項（索引 0 至 12），堆積頂索引 0 為待彈出的 9，末尾索引 12 為待換到根部的 5，尚未交換與刪除。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>待彈出的9</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>5</td><td>本次下沉的5</td></tr></tbody></table></details>

<a id="source-153"></a>

## 第 2 步：交換首尾元素

將索引 0 的 9 與索引 12 的 5 交換位置：5 移至根節點索引 0，9 移至陣列末尾索引 12。注意此狀態仍保留 13 個元素，末尾的 9 尚未彈出刪除，下一狀態才執行刪除。

<details><summary>本步完整狀態</summary><p>當前堆積儲存仍為 13 項（索引 0 至 12）：首尾交換後根索引 0 變為 5，原堆積頂 9 位於末尾索引 12（尚未刪除）。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>9</td><td>待彈出的9</td></tr></tbody></table></details>

<a id="source-154"></a>

## 第 3 步：從末尾刪除9

從陣列末尾（原索引 12）刪除 9 並儲存為出堆積返回值，堆積長度縮減為 12 項（索引 0 至 11）。移除最右葉節點後仍保持完全二元樹的結構性質，但根索引 0 的 5 小於子節點，需要自頂向下下沉修復。

<details><summary>本步完整狀態</summary><p>原堆積頂 9 已從末尾刪除；當前堆積儲存縮為 12 項（索引 0 至 11），根索引 0 為待下沉的 5。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-155"></a>

## 第 4 步：比較根5與子節點

比較根索引 0 的 5 與其左子節點（索引 1 的 8）、右子節點（索引 2 的 7）：三者中最大的是索引 1 的 8，需將 5 與較大子節點 8 交換。本狀態僅比較，尚未交換。

<details><summary>本步完整狀態</summary><p>當前堆積儲存共 12 項（索引 0 至 11）；正比較根索引 0 的 5 與左子索引 1 的 8、右子索引 2 的 7（最大為索引 1 的 8，尚未交換）。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-156"></a>

## 第 5 步：交換索引0與1

執行第一次下沉交換：索引 0 的 5 與索引 1 的較大子節點 8 互換，8 升為新堆積頂（且大於右子索引 2 的 7），5 下沉至索引 1。隨後繼續檢查索引 1 的子節點。

<details><summary>本步完整狀態</summary><p>當前堆積儲存共 12 項（索引 0 至 11），堆積頂索引 0 已更新為 8；第一次下沉後 5 位於索引 1（其左、右子為索引 3 的 6 和索引 4 的 7）。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>8</td><td>—</td></tr><tr><th scope="row">1</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-157"></a>

## 第 6 步：比較索引1的子節點

索引 1 的 5 有左子節點（索引 3 的 6）和右子節點（索引 4 的 7）。比較 5、6、7，最大的是索引 4 的 7，應與索引 4 交換（根右側索引 2 的另一個 7 不在當前子樹路徑上）。本狀態尚未交換。

<details><summary>本步完整狀態</summary><p>當前堆積儲存共 12 項（索引 0 至 11），堆積頂索引 0 為 8；5 位於索引 1，正與其左子索引 3 的 6、右子索引 4 的 7 比較（最大為索引 4 的 7，尚未交換）。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>8</td><td>—</td></tr><tr><th scope="row">1</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-158"></a>

## 第 7 步：交換索引1與4

執行第二次下沉交換：索引 1 的 5 與索引 4 的 7 互換，7 上移至索引 1，5 下沉至索引 4。此時索引 4 的左、右子節點分別為索引 9 的 3 和索引 10 的 6。

<details><summary>本步完整狀態</summary><p>當前堆積儲存共 12 項（索引 0 至 11），堆積頂索引 0 為 8；第二次下沉後，索引 1 為 7，5 位於索引 4（其左、右子為索引 9 的 3 和索引 10 的 6）。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>8</td><td>—</td></tr><tr><th scope="row">1</th><td>7</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-159"></a>

## 第 8 步：比較索引4的子節點

比較索引 4 的 5 與其左子節點（索引 9 的 3）、右子節點（索引 10 的 6）：三者中最大的是索引 10 的 6，仍需繼續下沉。本狀態僅比較，尚未交換。

<details><summary>本步完整狀態</summary><p>當前堆積儲存共 12 項（索引 0 至 11），堆積頂索引 0 為 8；5 位於索引 4，正與其左子索引 9 的 3、右子索引 10 的 6 比較（最大為索引 10 的 6，尚未交換）。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>8</td><td>—</td></tr><tr><th scope="row">1</th><td>7</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-160"></a>

## 第 9 步：交換索引4與10

執行第三次下沉交換：索引 4 的 5 與索引 10 的 6 互換，6 上移至索引 4，5 下沉至葉節點索引 10。索引 10 的左、右子索引（21、22）均越界，已無子節點，下沉過程停止。

<details><summary>本步完整狀態</summary><p>當前堆積儲存共 12 項（索引 0 至 11），堆積頂索引 0 為 8；第三次下沉後，索引 4 為 6，5 到達葉節點索引 10（無子節點）。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>8</td><td>—</td></tr><tr><th scope="row">1</th><td>7</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>6</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-161"></a>

## 第 10 步：出堆積完成

移除高亮，剩餘 12 個元素已全部恢復大頂堆積性質：堆積頂索引 0 為 8，元素 5 經 0 → 1 → 4 → 10 三次下沉停在索引 10，整個出堆積操作返回先前刪除的最大值 9。

<details><summary>本步完整狀態</summary><p>出堆積完成，返回值為 9；當前堆積儲存共 12 項（索引 0 至 11），新堆積頂索引 0 為 8，下沉元素 5 最終位於索引 10。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>8</td><td>—</td></tr><tr><th scope="row">1</th><td>7</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>6</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

## 結果

出堆積操作返回原堆積頂最大值 9。剩餘 12 個元素的層序陣列恢復為 \[8, 7, 7, 6, 6, 6, 2, 1, 4, 3, 5, 2\]，新堆積頂為 8。元素 5 從根索引 0 依次經索引 1、4 下沉至葉節點索引 10，共執行三次向下交換後重新滿足大頂堆積條件。
