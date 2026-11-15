<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 96d90d8acad4720d61c29bf089bad4cf0aa5c90bec8fa8a6a8785e37e5e1900b -->

# 大頂堆積插入元素

將新元素 7 追加到陣列末尾（索引 12），沿父節點路徑依次與索引 5 的 5、索引 2 的 6 交換，比較根節點 9 後停止上浮。

## 問題與輸入

初始大頂堆積包含 12 個元素，按層序存為陣列 \[9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2\]，索引從 0 到 11；右上角標題標明本次操作為“節點 7 入堆積”。注意初始堆積的索引 4 處已有一個值為 7 的節點，本次入堆積並上浮的是新追加的另一個 7。

樹和陣列表示同一份儲存，陣列按層序排列，索引從0開始。非根位置i的父索引為⌊(i−1)/2⌋，左右子索引為2i+1、2i+2，越界表示該子節點不存在。相等數值用當前位置索引區分。

## 結構與關係

入堆積先將新元素追加到層序陣列末尾以保持完全二元樹形狀，再沿父節點路徑自底向上上浮修復：僅噹噹前節點值大於父節點值時才與父節點交換；一旦不大於父節點或已到達根節點，立即停止上浮。本例新插入的 7 經索引 12 → 5 → 2 共交換兩次。

<a id="source-143"></a>

## 第 1 步：準備插入新的7

待入堆積的新元素 7 尚在堆積外。注意原堆積索引 4 處已有一個值為 7 的節點（索引 1 節點 8 的右子節點），它與本次待插入的新 7 是兩個不同元素。

<details><summary>本步完整狀態</summary><p>當前堆積儲存共 12 項（索引 0 至 11），堆積頂索引 0 為 9；原有的 7 位於索引 4，待插入的新 7 尚在堆積外。完整陣列見當前狀態表；樹按層序對應陣列索引，非根索引 i 的父索引為 ⌊(i−1)/2⌋，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>6</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>5</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-144"></a>

## 第 2 步：將7追加到末尾

將新 7 追加到陣列末尾索引 12，在樹中掛為索引 5（值為 5）的右子節點。完全二元樹結構已就緒，但 7 &gt; 5，需向上修復。

<details><summary>本步完整狀態</summary><p>當前堆積儲存增至 13 項（索引 0 至 12），堆積頂索引 0 為 9；本次新插入的 7 位於末尾索引 12（父節點為索引 5 的 5），原有的 7 仍在索引 4。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>6</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>5</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>7</td><td>本次新插入的7</td></tr></tbody></table></details>

<a id="source-145"></a>

## 第 3 步：比較索引12與5

將索引 12 的新 7 與其父節點（索引 5 的 5）比較：7 &gt; 5，違反大頂堆積父節點不小於子節點的條件，需要向上交換。本狀態僅展示比較，尚未交換。

<details><summary>本步完整狀態</summary><p>當前堆積儲存共 13 項（索引 0 至 12），堆積頂索引 0 為 9；正比較索引 12 的新 7 與父節點索引 5 的 5（尚未交換），原有的 7 仍在索引 4。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>6</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>5</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>7</td><td>本次新插入的7</td></tr></tbody></table></details>

<a id="source-146"></a>

## 第 4 步：交換索引12與5

執行第一次上浮交換：索引 12 的新 7 與索引 5 的 5 互換位置，新 7 上浮至索引 5，原值 5 下移至索引 12（原有的 7 仍在索引 4）。隨後繼續向新 7 的上一層父節點檢查。

<details><summary>本步完整狀態</summary><p>當前堆積儲存共 13 項（索引 0 至 12），堆積頂索引 0 為 9；第一次交換後，新 7 位於索引 5，被換下的 5 位於索引 12，原有的 7 仍在索引 4。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>6</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>7</td><td>本次新插入的7</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>5</td><td>—</td></tr></tbody></table></details>

<a id="source-147"></a>

## 第 5 步：比較索引5與2

新 7 現位於索引 5，其父節點為索引 2 的 6。比較得 7 &gt; 6，仍不滿足大頂堆積條件，需繼續上浮；本狀態僅比較，尚未交換。

<details><summary>本步完整狀態</summary><p>當前堆積儲存共 13 項（索引 0 至 12），堆積頂索引 0 為 9；正比較索引 5 的新 7 與父節點索引 2 的 6（尚未交換），原有的 7 仍在索引 4。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>6</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>7</td><td>本次新插入的7</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>5</td><td>—</td></tr></tbody></table></details>

<a id="source-148"></a>

## 第 6 步：交換索引5與2

執行第二次上浮交換：索引 5 的新 7 與索引 2 的 6 互換位置，新 7 上浮至索引 2，原值 6 下移至索引 5。接下來繼續與根節點比較。

<details><summary>本步完整狀態</summary><p>當前堆積儲存共 13 項（索引 0 至 12），堆積頂索引 0 為 9；第二次交換後，新 7 位於索引 2，被換下的 6 位於索引 5，原有的 7 仍在索引 4。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>本次新插入的7</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>5</td><td>—</td></tr></tbody></table></details>

<a id="source-149"></a>

## 第 7 步：比較索引2與根

新 7 現位於索引 2，其父節點為根節點（索引 0 的 9）。比較得父節點 9 &gt; 7，已滿足大頂堆積父節點不小於子節點的條件，無須再交換；原有索引 4 的 7 全程未移動。

<details><summary>本步完整狀態</summary><p>當前堆積儲存共 13 項（索引 0 至 12），堆積頂索引 0 為 9；正比較索引 2 的新 7 與根節點索引 0 的 9（9 &gt; 7，滿足堆積序），原有的 7 仍在索引 4。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>本次新插入的7</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>5</td><td>—</td></tr></tbody></table></details>

<a id="source-150"></a>

## 第 8 步：停止上浮

由於根節點 9 大於索引 2 的新 7，無須交換，新 7 的上浮過程在此終止；位於左子樹索引 4 的原有 7 全程保持不動。

<details><summary>本步完整狀態</summary><p>當前堆積儲存共 13 項（索引 0 至 12），堆積頂索引 0 為 9；新 7 定位於索引 2 並停止上浮，原有的 7 仍在索引 4。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>本次新插入的7</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>5</td><td>—</td></tr></tbody></table></details>

<a id="source-151"></a>

## 第 9 步：插入完成

移除比較高亮，全堆積 13 個元素已恢復大頂堆積性質：新 7 經 12 → 5 → 2 兩次交換後留在索引 2，原有 7 仍在索引 4，入堆積操作結束。

<details><summary>本步完整狀態</summary><p>入堆積完成，當前堆積儲存共 13 項（索引 0 至 12），堆積頂索引 0 為 9；新 7 最終位於索引 2，原有的 7 位於索引 4，末尾索引 12 為 5。完整陣列見當前狀態表；樹按層序對應陣列索引，左右子索引為 2i+1、2i+2（越界即無子節點）。</p><table><caption>當前堆積的完整層序儲存</caption><thead><tr><th scope="col">陣列索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>本次新插入的7</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>5</td><td>—</td></tr></tbody></table></details>

## 結果

入堆積完成後，大頂堆積共有 13 個元素，層序陣列更新為 \[9, 8, 7, 6, 7, 6, 2, 1, 4, 3, 6, 2, 5\]。新插入的 7 從索引 12 經索引 5 上浮至索引 2（共交換兩次），原有的索引 4 節點 7 未發生移動，堆積頂仍為 9。
