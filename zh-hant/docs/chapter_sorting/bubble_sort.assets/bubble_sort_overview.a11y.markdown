<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 7937719284f4f929c5dad2b2741648a5f00af7c9e32b5031a469e9f3ca54a9ae -->

# 泡沫排序逐輪過程

對 \[4, 1, 3, 1, 5, 2\] 連續執行五輪冒泡，依次將 5、4、3、2、1 送到未排序區間最右端，使未排序區間從 \[0, 5\] 縮減至 \[0, 0\]。

## 問題與輸入

初始陣列為 nums = \[4, 1, 3, 1, 5, 2\]，索引為 0 至 5。每輪冒泡都在當前“未排序區間”內從左至右比較並交換相鄰元素，將該區間內的最大元素交換到區間最右端。

## 結構與關係

每輪從左向右比較相鄰元素，把剩餘區間的最大值送到最右端。右側已固定的字尾逐輪擴大，後續輪次不再處理它。

第三輪結束時數值已經升序，但本例使用沒有提前停止標誌的基本版本，仍執行第四、第五輪。最後只剩一個最小元素，無須再比較。

<table><caption>泡沫排序逐輪狀態</caption><thead><tr><th scope="col">時點</th><th scope="col">陣列</th><th scope="col">本輪就位的最大值</th><th scope="col">剩餘區間</th></tr></thead><tbody><tr><th scope="row">初始</th><td>[4, 1, 3, 1, 5, 2]</td><td>無</td><td>[0, 5]</td></tr><tr><th scope="row">第 1 輪後</th><td>[1, 3, 1, 4, 2, 5]</td><td>5</td><td>[0, 4]</td></tr><tr><th scope="row">第 2 輪後</th><td>[1, 1, 3, 2, 4, 5]</td><td>4</td><td>[0, 3]</td></tr><tr><th scope="row">第 3 輪後</th><td>[1, 1, 2, 3, 4, 5]</td><td>3</td><td>[0, 2]</td></tr><tr><th scope="row">第 4 輪後</th><td>[1, 1, 2, 3, 4, 5]</td><td>2</td><td>[0, 1]</td></tr><tr><th scope="row">第 5 輪後</th><td>[1, 1, 2, 3, 4, 5]</td><td>1</td><td>[0, 0]</td></tr></tbody></table>

<a id="source-260"></a>

對 6 元素陣列 \[4, 1, 3, 1, 5, 2\] 連續執行五輪基本冒泡：前 3 輪透過相鄰交換依次將 5、4、3 送到右側就位；第 3 輪後陣列雖已升序，但基本版本未設提前停止標誌，仍繼續執行無交換的第 4、第 5 輪。逐輪完整狀態見表格。

## 結果

經過五輪冒泡，前五大的元素 5、4、3、2、1 自右向左依次就位，索引 0 僅剩的最小元素 1 自然處於正確位置，得到最終有序陣列 \[1, 1, 2, 3, 4, 5\]。

## 泡沫排序逐輪過程：動畫

對 \[4, 1, 3, 1, 5, 2\] 連續執行五輪冒泡，依次將 5、4、3、2、1 送到未排序區間最右端，使未排序區間從 \[0, 5\] 縮減至 \[0, 0\]。

初始陣列為 nums = \[4, 1, 3, 1, 5, 2\]，索引為 0 至 5。每輪冒泡都在當前“未排序區間”內從左至右比較並交換相鄰元素，將該區間內的最大元素交換到區間最右端。

每輪從左向右比較相鄰元素，把剩餘區間的最大值送到最右端。右側已固定的字尾逐輪擴大，後續輪次不再處理它。

第三輪結束時數值已經升序，但本例使用沒有提前停止標誌的基本版本，仍執行第四、第五輪。最後只剩一個最小元素，無須再比較。

### 第 1 步：尚未開始冒泡

尚未開始比較，索引 0 至 5 的全部六個元素 \[4, 1, 3, 1, 5, 2\] 均在首輪未排序區間 \[0, 5\] 內。

<details><summary>本步完整狀態</summary><p>六元素泡沫排序尚未開始，待處理區間為 [0,5]，右側尚無已固定元素。當前陣列見表。</p><table><caption>初始陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">當前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>4</td><td>尚未處理</td></tr><tr><th scope="row">1</th><td>1</td><td>尚未處理</td></tr><tr><th scope="row">2</th><td>3</td><td>尚未處理</td></tr><tr><th scope="row">3</th><td>1</td><td>尚未處理</td></tr><tr><th scope="row">4</th><td>5</td><td>尚未處理</td></tr><tr><th scope="row">5</th><td>2</td><td>尚未處理</td></tr></tbody></table></details>

### 第 2 步：最大值 5 就位

第 1 輪在 \[0, 5\] 內從左向右比較並交換，將最大元素 5 送到右端索引 5 就位；下一輪只處理剩餘區間 \[0, 4\]。

<details><summary>本步完整狀態</summary><p>六元素泡沫排序已完成一輪：最大值 5 固定在索引 5，剩餘區間為 [0,4]。當前陣列見表。</p><table><caption>本輪後的陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">當前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>本輪後仍在剩餘區間</td></tr><tr><th scope="row">1</th><td>3</td><td>本輪後仍在剩餘區間</td></tr><tr><th scope="row">2</th><td>1</td><td>本輪後仍在剩餘區間</td></tr><tr><th scope="row">3</th><td>4</td><td>本輪後仍在剩餘區間</td></tr><tr><th scope="row">4</th><td>2</td><td>本輪後仍在剩餘區間</td></tr><tr><th scope="row">5</th><td>5</td><td>已固定</td></tr></tbody></table></details>

### 第 3 步：最大值 4 就位

第 2 輪在 \[0, 4\] 內比較並交換，將該區間最大值 4 送到索引 4 就位；右側已固定字尾擴為 \[4, 5\]。

<details><summary>本步完整狀態</summary><p>六元素泡沫排序已完成兩輪：索引 4、5 已固定，剩餘區間為 [0,3]。當前陣列見表。</p><table><caption>本輪後的陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">當前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>本輪後仍在剩餘區間</td></tr><tr><th scope="row">1</th><td>1</td><td>本輪後仍在剩餘區間</td></tr><tr><th scope="row">2</th><td>3</td><td>本輪後仍在剩餘區間</td></tr><tr><th scope="row">3</th><td>2</td><td>本輪後仍在剩餘區間</td></tr><tr><th scope="row">4</th><td>4</td><td>已固定</td></tr><tr><th scope="row">5</th><td>5</td><td>已固定</td></tr></tbody></table></details>

### 第 4 步：最大值 3 就位

第 3 輪在 \[0, 3\] 內將 3 交換到索引 3 就位，此時整列 \[1, 1, 2, 3, 4, 5\] 已呈升序；因基本版本未設提前停止標誌，後續仍繼續檢查剩餘區間 \[0, 2\]。

<details><summary>本步完整狀態</summary><p>六元素泡沫排序已完成三輪：索引 3 至 5 已固定，剩餘區間為 [0,2]。陣列已升序，但基本版本仍繼續後續輪次。</p><table><caption>本輪後的陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">當前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>本輪後仍在剩餘區間</td></tr><tr><th scope="row">1</th><td>1</td><td>本輪後仍在剩餘區間</td></tr><tr><th scope="row">2</th><td>2</td><td>本輪後仍在剩餘區間</td></tr><tr><th scope="row">3</th><td>3</td><td>已固定</td></tr><tr><th scope="row">4</th><td>4</td><td>已固定</td></tr><tr><th scope="row">5</th><td>5</td><td>已固定</td></tr></tbody></table></details>

### 第 5 步：無須交換，確認 2 就位

第 4 輪走訪剩餘區間 \[0, 2\]，相鄰元素均已滿足升序故未發生任何交換，確認索引 2 的 2 就位；剩餘區間縮為 \[0, 1\]。

<details><summary>本步完整狀態</summary><p>六元素泡沫排序已完成四輪，本輪無交換：索引 2 至 5 已固定，剩餘區間為 [0,1]。當前陣列見表。</p><table><caption>本輪後的陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">當前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>本輪後仍在剩餘區間</td></tr><tr><th scope="row">1</th><td>1</td><td>本輪後仍在剩餘區間</td></tr><tr><th scope="row">2</th><td>2</td><td>已固定</td></tr><tr><th scope="row">3</th><td>3</td><td>已固定</td></tr><tr><th scope="row">4</th><td>4</td><td>已固定</td></tr><tr><th scope="row">5</th><td>5</td><td>已固定</td></tr></tbody></table></details>

### 第 6 步：無須交換，完成排序

第 5 輪檢查 \[0, 1\] 中的兩個 1，同樣無須交換，索引 1 的 1 確認就位；剩餘區間 \[0, 0\] 只剩一個最小元素 1，無須再比較，五輪冒泡全部完成。

<details><summary>本步完整狀態</summary><p>六元素泡沫排序已完成五輪，本輪無交換。剩餘區間 [0,0] 只有一個最小元素，無須再比較，排序完成。</p><table><caption>本輪後的陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">當前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>僅剩一個元素，無須再排</td></tr><tr><th scope="row">1</th><td>1</td><td>已固定</td></tr><tr><th scope="row">2</th><td>2</td><td>已固定</td></tr><tr><th scope="row">3</th><td>3</td><td>已固定</td></tr><tr><th scope="row">4</th><td>4</td><td>已固定</td></tr><tr><th scope="row">5</th><td>5</td><td>已固定</td></tr></tbody></table></details>

### 結果

經過五輪冒泡，前五大的元素 5、4、3、2、1 自右向左依次就位，索引 0 僅剩的最小元素 1 自然處於正確位置，得到最終有序陣列 \[1, 1, 2, 3, 4, 5\]。
