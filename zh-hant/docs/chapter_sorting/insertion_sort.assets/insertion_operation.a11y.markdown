<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 1856f45aac1f433036731e2c62c1a513620444d456f5ced4df279205cacaa90b -->

# 插入一個元素：暫存、右移與寫回

先儲存末尾的 3，再把 5、4 各向右複製一格，最後將 3 寫入索引 3。

## 問題與輸入

輸入陣列為 nums = \[1, 1, 2, 4, 5, 3\]（索引 0 至 5），其中左側前五個元素 \[1, 1, 2, 4, 5\] 已排好序，任務是“將元素 3 插入到 nums 已排序區間的正確位置”（即元素 2 與 4 之間的索引 3）。

## 結構與關係

先將末尾的 3 暫存到 base，防止右移時被覆蓋。依次把大於 3 的元素 5、4 向右複製一格；這些賦值會暫時留下兩個 5 或兩個 4。

比較到索引 2 的值 2 時停止右移，將 base 寫入索引 3。左側陣列是固定輸入快照，右側四行展示實際陣列的連續變化。

<table><caption>單次插入的陣列變化</caption><thead><tr><th scope="col">動作</th><th scope="col">陣列</th><th scope="col">base</th></tr></thead><tbody><tr><th scope="row">暫存末尾的 3</th><td>[1, 1, 2, 4, 5, 3]</td><td>3</td></tr><tr><th scope="row">把 5 複製到索引 5</th><td>[1, 1, 2, 4, 5, 5]</td><td>3</td></tr><tr><th scope="row">把 4 複製到索引 4</th><td>[1, 1, 2, 4, 4, 5]</td><td>3</td></tr><tr><th scope="row">將 3 寫入索引 3</th><td>[1, 1, 2, 3, 4, 5]</td><td>3</td></tr></tbody></table>

<a id="source-261"></a>

將末尾索引 5 的元素 3 插入左側有序字首 \[1, 1, 2, 4, 5\]：先將 3 暫存到 base，再把大於 3 的 5 和 4 依次向右複製一格（中途短暫出現兩個 5、兩個 4），最後將 base 寫回索引 3。四步詳情見表格。

## 結果

透過 1 次暫存（base = 3）、2 次向右複製賦值（nums\[5\] = nums\[4\]、nums\[4\] = nums\[3\]）與 1 次寫回（nums\[3\] = base），將末尾的 3 準確插入到索引 3，使整列六個元素恢復為升序陣列 \[1, 1, 2, 3, 4, 5\]。

## 插入一個元素：暫存、右移與寫回：動畫

先儲存末尾的 3，再把 5、4 各向右複製一格，最後將 3 寫入索引 3。

輸入陣列為 nums = \[1, 1, 2, 4, 5, 3\]（索引 0 至 5），其中左側前五個元素 \[1, 1, 2, 4, 5\] 已排好序，任務是“將元素 3 插入到 nums 已排序區間的正確位置”（即元素 2 與 4 之間的索引 3）。

先將末尾的 3 暫存到 base，防止右移時被覆蓋。依次把大於 3 的元素 5、4 向右複製一格；這些賦值會暫時留下兩個 5 或兩個 4。

比較到索引 2 的值 2 時停止右移，將 base 寫入索引 3。左側陣列是固定輸入快照，右側四行展示實際陣列的連續變化。

### 第 1 步：暫存末尾的 3

先將末尾索引 5 的待插入元素 3 儲存到變數 base = 3，防止後續右移覆蓋時丟失資料；此時陣列內容尚未改變。

<details><summary>本步完整狀態</summary><p>把末尾的 3 插入左側有序字首：base 已儲存為 3，六元素陣列尚未改變。當前陣列見表。</p><table><caption>當前陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>1</td></tr><tr><th scope="row">2</th><td>2</td></tr><tr><th scope="row">3</th><td>4</td></tr><tr><th scope="row">4</th><td>5</td></tr><tr><th scope="row">5</th><td>3</td></tr></tbody></table></details>

### 第 2 步：把 5 複製到索引 5

比較索引 4 的 5，因 5 大於 base（3），執行賦值 nums\[5\] = nums\[4\] 將 5 向右複製到索引 5，陣列中暫時出現兩個 5；原末尾的 3 已儲存在 base 中並未丟失。

<details><summary>本步完整狀態</summary><p>待插入值儲存在 base=3。已把索引 4 的 5 複製到索引 5，兩處暫時都是 5；當前陣列見表。</p><table><caption>當前陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>1</td></tr><tr><th scope="row">2</th><td>2</td></tr><tr><th scope="row">3</th><td>4</td></tr><tr><th scope="row">4</th><td>5</td></tr><tr><th scope="row">5</th><td>5</td></tr></tbody></table></details>

### 第 3 步：把 4 複製到索引 4

繼續向左比較索引 3 的 4，因 4 也大於 base（3），執行賦值 nums\[4\] = nums\[3\] 將 4 向右複製到索引 4，覆蓋原先多餘的 5，陣列中暫時出現兩個 4；base 仍為 3。

<details><summary>本步完整狀態</summary><p>待插入值仍儲存在 base=3。已把索引 3 的 4 複製到索引 4，兩處暫時都是 4；當前陣列見表。</p><table><caption>當前陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>1</td></tr><tr><th scope="row">2</th><td>2</td></tr><tr><th scope="row">3</th><td>4</td></tr><tr><th scope="row">4</th><td>4</td></tr><tr><th scope="row">5</th><td>5</td></tr></tbody></table></details>

### 第 4 步：將 3 寫入索引 3

繼續向左比較索引 2 的 2，因 2 不大於 base（3）而停止右移，執行 nums\[3\] = base 將暫存的 3 寫入索引 3，消去重複的 4，完成本次插入。

<details><summary>本步完整狀態</summary><p>已將 base 中的 3 寫入索引 3，完成本次插入。六元素陣列全部升序；原有兩個 1 保持不變，右移產生的臨時重複值已消除。</p><table><caption>當前陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>1</td></tr><tr><th scope="row">2</th><td>2</td></tr><tr><th scope="row">3</th><td>3</td></tr><tr><th scope="row">4</th><td>4</td></tr><tr><th scope="row">5</th><td>5</td></tr></tbody></table></details>

### 結果

透過 1 次暫存（base = 3）、2 次向右複製賦值（nums\[5\] = nums\[4\]、nums\[4\] = nums\[3\]）與 1 次寫回（nums\[3\] = base），將末尾的 3 準確插入到索引 3，使整列六個元素恢復為升序陣列 \[1, 1, 2, 3, 4, 5\]。
