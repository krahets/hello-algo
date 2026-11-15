<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 3be9b1ecae99c2b8b82ed0b644cb10cee6cab14e2ed4a97240e0b00463be728b -->

# 前綴和計數排序的穩定寫入

將頻數累加為前綴和以定位寫入下標，倒序走訪原陣列填入 res 並遞減計數，最後覆蓋 nums。

## 問題與輸入

原陣列為 nums = \[1, 0, 1, 2, 0, 4, 0, 2, 2, 4\]（索引 0 至 9），數值範圍為 0 至 4，頻數陣列為 counter = \[3, 2, 3, 0, 2\]。

對 counter 計算前綴和得到初始 prefix = \[3, 5, 8, 8, 10\]。初始 prefix\[num\] 表示小於或等於 num 的元素總數，對於確實出現的數值 num，prefix\[num\] - 1 正好是它在結果陣列 res 中最後一次出現的目標索引。

結果陣列 res 共有十個槽位。圖中尚未寫入元素的槽位留白，用於區分“尚未放置元素”與“已寫入數值 0”（儘管程式碼中用 0 初始化 res，畫面仍以空白格表示未寫入狀態）。

## 結構與關係

演算法從右向左倒序走訪原陣列 nums：每讀取一個元素 num，先將其填入 res 的索引 prefix\[num\] - 1 處，隨後立即令 prefix\[num\] 自減 1，為下一個相同數值指向前一個可用位置。遞減後的 prefix 儲存的是各數值剩餘分割槽的右邊界計數，不再是固定不變的初始前綴和。

倒序走訪與從右向左填充相配合，使得原陣列中靠右的相等元素先填入結果區段的靠右位置、靠左的相等元素後填入靠左位置，從而保證排序的穩定性。本圖組逐幀演示最右側四個元素（原索引 9、8、7、6）的寫入過程，隨後省略中間六次寫入直接展示走訪完成狀態，最後用 res 覆蓋 nums。

<table><caption>固定原始輸入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>1</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>0</td></tr><tr><th scope="row">5</th><td>4</td></tr><tr><th scope="row">6</th><td>0</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>2</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table>

<a id="source-300"></a>

## 第 1 步：統計頻數

走訪原陣列 nums，統計數字 0、1、2、3、4 各自出現的次數，生成長度為 5 的計數陣列 counter = \[3, 2, 3, 0, 2\]。

<details><summary>本步完整狀態</summary><p>計數排序已統計完十個輸入，尚未求前綴和，也未開始寫入結果。當前表列出 nums 和數字頻數 counter。</p><table><caption>當前 nums</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>1</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>0</td></tr><tr><th scope="row">5</th><td>4</td></tr><tr><th scope="row">6</th><td>0</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>2</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table><table><caption>當前頻數 counter</caption><thead><tr><th scope="col">數字 num</th><th scope="col">出現次數</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>2</td></tr><tr><th scope="row">2</th><td>3</td></tr><tr><th scope="row">3</th><td>0</td></tr><tr><th scope="row">4</th><td>2</td></tr></tbody></table></details>

<a id="source-301"></a>

## 第 2 步：累加頻數，準備結果陣列

對 counter 依次累加計算前綴和，得到 prefix = \[3, 5, 8, 8, 10\]，同時準備好十格空白的結果陣列 res。根據 prefix\[num\] - 1 可知：數字 0 的最後一個目標位置是 3 - 1 = 2，數字 2 的最後位置是 8 - 1 = 7，數字 4 的最後位置是 10 - 1 = 9；數字 3 未出現，不會觸發寫入。

<details><summary>本步完整狀態</summary><p>計數排序已將頻數累加為初始 prefix，res 的十個槽位均未寫入。當前表列出 nums、寫入狀態及各數字的前綴和。</p><table><caption>當前 nums 與 res</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th><th scope="col">res 值或寫入狀態</th><th scope="col">res 元素的原始索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">1</th><td>0</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">2</th><td>1</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">3</th><td>2</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">4</th><td>0</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">5</th><td>4</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">6</th><td>0</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">7</th><td>2</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">8</th><td>2</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">9</th><td>4</td><td>未寫入</td><td>無</td></tr></tbody></table><table><caption>初始前綴和 prefix</caption><thead><tr><th scope="col">數字 num</th><th scope="col">prefix[num]</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>5</td></tr><tr><th scope="row">2</th><td>8</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>10</td></tr></tbody></table></details>

<a id="source-302"></a>

## 第 3 步：將末尾的 4 寫入索引 9

指標 num 指向原陣列最右端索引 9，元素值為 4。先根據遞減前的 prefix\[4\] = 10 計算出目標索引 10 - 1 = 9，將 4 填入 res\[9\]；再將 prefix\[4\] 自減 1 變為 9。畫面中展示的是已完成自減後的 prefix。

<details><summary>本步完整狀態</summary><p>倒序處理已開始：原索引 9 的 4 已寫入 res[9]，prefix[4] 已遞減為 9，其餘九格未寫入。</p><table><caption>當前 nums 與 res</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th><th scope="col">res 值或寫入狀態</th><th scope="col">res 元素的原始索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">1</th><td>0</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">2</th><td>1</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">3</th><td>2</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">4</th><td>0</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">5</th><td>4</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">6</th><td>0</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">7</th><td>2</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">8</th><td>2</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">9</th><td>4</td><td>4</td><td>9</td></tr></tbody></table><table><caption>當前 prefix（寫入後已遞減）</caption><thead><tr><th scope="col">數字 num</th><th scope="col">prefix[num]</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>5</td></tr><tr><th scope="row">2</th><td>8</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>9</td></tr></tbody></table></details>

<a id="source-303"></a>

## 第 4 步：將原索引 8 的 2 寫入索引 7

指標 num 左移至原陣列索引 8，元素值為 2。先根據遞減前的 prefix\[2\] = 8 計算出目標索引 8 - 1 = 7，將 2 填入 res\[7\]；再將 prefix\[2\] 自減 1 變為 7。畫面中展示的是已完成自減後的 prefix。

<details><summary>本步完整狀態</summary><p>已處理原索引 9、8；原索引 8 的 2 已寫入 res[7]，prefix[2] 已遞減為 7。完整當前陣列見表。</p><table><caption>當前 nums 與 res</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th><th scope="col">res 值或寫入狀態</th><th scope="col">res 元素的原始索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">1</th><td>0</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">2</th><td>1</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">3</th><td>2</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">4</th><td>0</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">5</th><td>4</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">6</th><td>0</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">7</th><td>2</td><td>2</td><td>8</td></tr><tr><th scope="row">8</th><td>2</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">9</th><td>4</td><td>4</td><td>9</td></tr></tbody></table><table><caption>當前 prefix（寫入後已遞減）</caption><thead><tr><th scope="col">數字 num</th><th scope="col">prefix[num]</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>5</td></tr><tr><th scope="row">2</th><td>7</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>9</td></tr></tbody></table></details>

<a id="source-304"></a>

## 第 5 步：將原索引 7 的 2 寫入索引 6

指標 num 左移至原陣列索引 7，遇到第二個值為 2 的元素。根據上一輪遞減後的 prefix\[2\] = 7 計算出目標索引 7 - 1 = 6，將該 2 填入 res\[6\]（排在剛才那個 2 的左側，保持原有相對次序）；隨後將 prefix\[2\] 自減 1 變為 6。

<details><summary>本步完整狀態</summary><p>已處理原索引 9 至 7；原索引 7 的 2 已寫入 res[6]，位於原索引 8 的 2 左側，prefix[2] 已遞減為 6。</p><table><caption>當前 nums 與 res</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th><th scope="col">res 值或寫入狀態</th><th scope="col">res 元素的原始索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">1</th><td>0</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">2</th><td>1</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">3</th><td>2</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">4</th><td>0</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">5</th><td>4</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">6</th><td>0</td><td>2</td><td>7</td></tr><tr><th scope="row">7</th><td>2</td><td>2</td><td>8</td></tr><tr><th scope="row">8</th><td>2</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">9</th><td>4</td><td>4</td><td>9</td></tr></tbody></table><table><caption>當前 prefix（寫入後已遞減）</caption><thead><tr><th scope="col">數字 num</th><th scope="col">prefix[num]</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>5</td></tr><tr><th scope="row">2</th><td>6</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>9</td></tr></tbody></table></details>

<a id="source-305"></a>

## 第 6 步：將原索引 6 的 0 寫入索引 2

指標 num 左移至原陣列索引 6，元素值為 0。先根據遞減前的 prefix\[0\] = 3 計算出目標索引 3 - 1 = 2，將 0 填入 res\[2\]；再將 prefix\[0\] 自減 1 變為 2。畫面中展示的是已完成自減後的 prefix。

<details><summary>本步完整狀態</summary><p>已處理原索引 9 至 6；原索引 6 的 0 已寫入 res[2]，prefix[0] 已遞減為 2。該格是實際寫入的 0，其餘未寫入格在表中另作標記。</p><table><caption>當前 nums 與 res</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th><th scope="col">res 值或寫入狀態</th><th scope="col">res 元素的原始索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">1</th><td>0</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">2</th><td>1</td><td>0</td><td>6</td></tr><tr><th scope="row">3</th><td>2</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">4</th><td>0</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">5</th><td>4</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">6</th><td>0</td><td>2</td><td>7</td></tr><tr><th scope="row">7</th><td>2</td><td>2</td><td>8</td></tr><tr><th scope="row">8</th><td>2</td><td>未寫入</td><td>無</td></tr><tr><th scope="row">9</th><td>4</td><td>4</td><td>9</td></tr></tbody></table><table><caption>當前 prefix（寫入後已遞減）</caption><thead><tr><th scope="col">數字 num</th><th scope="col">prefix[num]</th></tr></thead><tbody><tr><th scope="row">0</th><td>2</td></tr><tr><th scope="row">1</th><td>5</td></tr><tr><th scope="row">2</th><td>6</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>9</td></tr></tbody></table></details>

<a id="source-306"></a>

## 第 7 步：完成其餘六次寫入

繼續倒序處理原陣列索引 5 至 0 的其餘六個元素（依次為 4、0、2、1、0、1），分別填入 res 的索引 8、1、5、4、0、3。圖中省略了這六步中間畫面，直接跳到走訪結束狀態：此時 res 已全部填滿為有序序列，而上方原陣列 nums 尚未被覆蓋。

<details><summary>本步完整狀態</summary><p>十個元素已全部寫入 res，結果升序；nums 仍保持原始順序，尚未覆蓋。當前表列出各結果的原始身份和遞減後的 prefix。</p><table><caption>當前 nums 與 res</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th><th scope="col">res 值或寫入狀態</th><th scope="col">res 元素的原始索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>0</td><td>1</td></tr><tr><th scope="row">1</th><td>0</td><td>0</td><td>4</td></tr><tr><th scope="row">2</th><td>1</td><td>0</td><td>6</td></tr><tr><th scope="row">3</th><td>2</td><td>1</td><td>0</td></tr><tr><th scope="row">4</th><td>0</td><td>1</td><td>2</td></tr><tr><th scope="row">5</th><td>4</td><td>2</td><td>3</td></tr><tr><th scope="row">6</th><td>0</td><td>2</td><td>7</td></tr><tr><th scope="row">7</th><td>2</td><td>2</td><td>8</td></tr><tr><th scope="row">8</th><td>2</td><td>4</td><td>5</td></tr><tr><th scope="row">9</th><td>4</td><td>4</td><td>9</td></tr></tbody></table><table><caption>當前 prefix（寫入後已遞減）</caption><thead><tr><th scope="col">數字 num</th><th scope="col">prefix[num]</th></tr></thead><tbody><tr><th scope="row">0</th><td>0</td></tr><tr><th scope="row">1</th><td>3</td></tr><tr><th scope="row">2</th><td>5</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>8</td></tr></tbody></table></details>

<a id="source-307"></a>

## 第 8 步：把結果複製回 nums

最後將有序結果陣列 res 中的十個元素按索引複製回原陣列 nums，上方 nums 隨即更新為 \[0, 0, 0, 1, 1, 2, 2, 2, 4, 4\]，計數排序全部完成。

<details><summary>本步完整狀態</summary><p>res 已複製回 nums，兩陣列均已升序，計數排序完成。prefix 保留各分割槽的左邊界計數，不是全零；完整值見當前表。</p><table><caption>當前 nums 與 res</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th><th scope="col">res 值或寫入狀態</th><th scope="col">res 元素的原始索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>0</td><td>0</td><td>1</td></tr><tr><th scope="row">1</th><td>0</td><td>0</td><td>4</td></tr><tr><th scope="row">2</th><td>0</td><td>0</td><td>6</td></tr><tr><th scope="row">3</th><td>1</td><td>1</td><td>0</td></tr><tr><th scope="row">4</th><td>1</td><td>1</td><td>2</td></tr><tr><th scope="row">5</th><td>2</td><td>2</td><td>3</td></tr><tr><th scope="row">6</th><td>2</td><td>2</td><td>7</td></tr><tr><th scope="row">7</th><td>2</td><td>2</td><td>8</td></tr><tr><th scope="row">8</th><td>4</td><td>4</td><td>5</td></tr><tr><th scope="row">9</th><td>4</td><td>4</td><td>9</td></tr></tbody></table><table><caption>當前 prefix（寫入後已遞減）</caption><thead><tr><th scope="col">數字 num</th><th scope="col">prefix[num]</th></tr></thead><tbody><tr><th scope="row">0</th><td>0</td></tr><tr><th scope="row">1</th><td>3</td></tr><tr><th scope="row">2</th><td>5</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>8</td></tr></tbody></table></details>

## 結果

走訪結束後得到完整有序的結果陣列 res = \[0, 0, 0, 1, 1, 2, 2, 2, 4, 4\]，再將其複製回原陣列 nums。此時遞減後的 prefix 變為 \[0, 3, 5, 8, 8\]，代表各數值槽位全部消耗完畢後的左邊界（並非全零，也不是排序輸出）。
