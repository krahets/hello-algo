<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: e63aaac3153863b0636dee7ac1d645cd8a9a4cf1e24b65b19dcbee89caadffbb -->

# 迴圈陣列實現雙向佇列

移動佇列首索引並維護有效長度，實現不搬移中間元素的雙端操作。

## 問題與輸入

初始有效佇列按佇列首到佇列尾為 \[3, 2, 5\]。front 為佇列首元素索引，size 為有效長度；佇列尾下次寫入索引按 rear = (front + size) % capacity 計算。圖中簡寫為 rear = front + size，未展示跨邊界環繞、具體容量及數值下標。

## 結構與關係

入列前須有空位，出列前須非空。佇列尾入列先按當前 front 與 size 算出 rear 並寫入，再令 size 加 1；佇列首入列先令 front = (front - 1 + capacity) % capacity 左移一格並寫入，再令 size 加 1。佇列尾出列讀取尾元素後僅需令 size 減 1；佇列首出列讀取首元素後令 front 前進一格、size 減 1。

有效元素分佈在 (front + i) % capacity（i 從 0 到 size - 1）。中間元素 3、2、5 始終留在原槽位無須搬移；出列後槽位畫為虛線僅表示退出有效範圍，不代表程式碼將該槽清零。

<a id="source-76"></a>

## 第 1 步：初始雙向佇列

初始狀態下 front 指向佇列首元素 3，有效長度 size = 3；rear 按當前 front + size 計算，指向佇列尾 5 右側的首個空槽。

<details><summary>本步完整狀態</summary><p>當前有效佇列按佇列首到佇列尾為 [3, 2, 5]，front 指向 3，size = 3，rear 指向 5 右側首個空槽；本圖無跨邊界環繞，未標具體容量與下標。</p></details>

<a id="source-77"></a>

## 第 2 步：佇列尾加入4

先按入列前的 front 和 size = 3 算出寫入位置 rear，在該槽寫入 4，隨後將 size 更新為 4。注意圖中 rear 箭頭仍停留在本次寫入 4 的槽位（即本次寫入位址）；若按更新後的 size = 4 重新計算 front + size，新的尾後空槽位置應在 4 右側一格。

<details><summary>本步完整狀態</summary><p>執行 push_last(4) 後，當前有效佇列為 [3, 2, 5, 4]，front 指向 3，size = 4。圖中 rear 箭頭指示本次寫入 4 的位址；若按新 size = 4 重新計算，尾後寫入位置在 4 之後。本圖無跨邊界環繞，未標具體容量與下標。</p></details>

<a id="source-78"></a>

## 第 3 步：佇列首加入1

將 front 向左移動一格到 3 左側的空槽並寫入 1，再將 size 從 4 增至 5；原有元素 3、2、5、4 均留在原槽位不動。

<details><summary>本步完整狀態</summary><p>執行 push_first(1) 後，當前有效佇列為 [1, 3, 2, 5, 4]，front 指向新佇列首 1，size = 5。本圖無跨邊界環繞，未標具體容量與下標。</p></details>

<a id="source-79"></a>

## 第 4 步：佇列尾取出4

讀取並返回佇列尾元素 4，將 size 從 5 減為 4；front 仍指向 1，原存放 4 的槽位直接退出有效範圍（畫為虛線），其餘元素無須搬移。

<details><summary>本步完整狀態</summary><p>執行 pop_last() 後，當前有效佇列為 [1, 3, 2, 5]，front 指向 1，size = 4，本次返回 4；原 4 所在槽位退出有效範圍。本圖無跨邊界環繞，未標具體容量與下標。</p></details>

<a id="source-80"></a>

## 第 5 步：佇列首取出1

讀取並返回佇列首元素 1，將 front 向右推進一格重新指向 3，同時將 size 從 4 減為 3；原存放 1 的槽位退出有效範圍。

<details><summary>本步完整狀態</summary><p>執行 pop_first() 後，當前有效佇列恢復為 [3, 2, 5]，front 重新指向 3，size = 3，本次返回 1；原 1 所在槽位退出有效範圍。本圖無跨邊界環繞，未標具體容量與下標。</p></details>

## 結果

連續四次操作後，front 重新指向 3，size 恢復為 3，有效佇列恢復為 \[3, 2, 5\]；兩端入列和出列均為 O(1)。
