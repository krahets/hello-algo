<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 139f92dd5d6c192465673378ce76bf77a75a094dd69988cadea14fbb0cc677a8 -->

# 統計每個整數的次數，再按次數寫回

統計輸入中 0 至 4 的出現次數為 3、2、3、0、2，再按數值遞增順序寫回十個元素。

## 問題與輸入

待排序陣列為 nums = \[1, 0, 1, 2, 0, 4, 0, 2, 2, 4\]，元素均為非負整數且最大值為 4，因此建立包含索引 0 至 4 共五個位置的計數陣列 counter。counter\[num\] 記錄數字 num 的出現次數，其索引直接對應數值本身，而非原陣列下標。

## 結構與關係

用數字本身作為 counter 的索引，記錄它在輸入中出現的次數。計數表中索引 3 對應的次數為 0，表示輸入沒有數字 3。

按索引從 0 到 4 讀取計數，依次寫出三個 0、兩個 1、三個 2 和兩個 4。這裡直接根據頻數重建整數序列，不跟蹤相等數值各自的輸入身份。

<table><caption>原始輸入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>1</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>0</td></tr><tr><th scope="row">5</th><td>4</td></tr><tr><th scope="row">6</th><td>0</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>2</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table>

<table><caption>數字頻數</caption><thead><tr><th scope="col">數字</th><th scope="col">出現次數</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>2</td></tr><tr><th scope="row">2</th><td>3</td></tr><tr><th scope="row">3</th><td>0</td></tr><tr><th scope="row">4</th><td>2</td></tr></tbody></table>

<table><caption>寫回結果</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>0</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>0</td></tr><tr><th scope="row">3</th><td>1</td></tr><tr><th scope="row">4</th><td>1</td></tr><tr><th scope="row">5</th><td>2</td></tr><tr><th scope="row">6</th><td>2</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>4</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table>

<a id="source-299"></a>

counter 的索引代表要寫出的整數本身，對應的計數值決定該整數連續寫回多少次。

## 結果

原陣列被重寫為升序序列 \[0, 0, 0, 1, 1, 2, 2, 2, 4, 4\]。這種簡單實現直接根據頻數重建整數序列，若輸入元素是攜帶附加屬性的複合物件，則需進一步藉助前綴和來保持原物件身份與穩定性。

## 統計每個整數的次數，再按次數寫回：動畫

統計輸入中 0 至 4 的出現次數為 3、2、3、0、2，再按數值遞增順序寫回十個元素。

待排序陣列為 nums = \[1, 0, 1, 2, 0, 4, 0, 2, 2, 4\]，元素均為非負整數且最大值為 4，因此建立包含索引 0 至 4 共五個位置的計數陣列 counter。counter\[num\] 記錄數字 num 的出現次數，其索引直接對應數值本身，而非原陣列下標。

用數字本身作為 counter 的索引，記錄它在輸入中出現的次數。計數表中索引 3 對應的次數為 0，表示輸入沒有數字 3。

按索引從 0 到 4 讀取計數，依次寫出三個 0、兩個 1、三個 2 和兩個 4。這裡直接根據頻數重建整數序列，不跟蹤相等數值各自的輸入身份。

### 第 1 步：讀取十個非負整數

讀取長度為 10 的輸入陣列 nums，其中最大值為 4，因此準備包含索引 0 至 4 的計數陣列 counter。

<details><summary>本步完整狀態</summary><p>十個非負整數準備做計數排序，最大值為 4；當前只有輸入，尚未統計頻數。逐項資料見原始輸入表。</p><table><caption>原始輸入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>1</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>0</td></tr><tr><th scope="row">5</th><td>4</td></tr><tr><th scope="row">6</th><td>0</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>2</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table></details>

### 第 2 步：統計數字頻數

走訪輸入陣列，將每個數字的出現次數記入對應索引，得到 0 至 4 的頻數依次為 3、2、3、0、2。

<details><summary>本步完整狀態</summary><p>十個輸入的頻數統計已完成，數字 3 的次數為 0，尚未寫回結果。原始輸入與各數字次數見當前表。</p><table><caption>原始輸入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>1</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>0</td></tr><tr><th scope="row">5</th><td>4</td></tr><tr><th scope="row">6</th><td>0</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>2</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table><table><caption>數字頻數</caption><thead><tr><th scope="col">數字</th><th scope="col">出現次數</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>2</td></tr><tr><th scope="row">2</th><td>3</td></tr><tr><th scope="row">3</th><td>0</td></tr><tr><th scope="row">4</th><td>2</td></tr></tbody></table></details>

### 第 3 步：按次數寫回結果

按索引 0 到 4 依次讀取 counter，連續寫出三個 0、兩個 1、三個 2 和兩個 4，次數為 0 的數字 3 直接跳過。

<details><summary>本步完整狀態</summary><p>已按數字從小到大依頻數寫回十個元素，排序完成。原始輸入表保留的是舊快照，當前排序結果見寫回結果表。</p><table><caption>原始輸入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>1</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>0</td></tr><tr><th scope="row">5</th><td>4</td></tr><tr><th scope="row">6</th><td>0</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>2</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table><table><caption>數字頻數</caption><thead><tr><th scope="col">數字</th><th scope="col">出現次數</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>2</td></tr><tr><th scope="row">2</th><td>3</td></tr><tr><th scope="row">3</th><td>0</td></tr><tr><th scope="row">4</th><td>2</td></tr></tbody></table><table><caption>寫回結果</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>0</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>0</td></tr><tr><th scope="row">3</th><td>1</td></tr><tr><th scope="row">4</th><td>1</td></tr><tr><th scope="row">5</th><td>2</td></tr><tr><th scope="row">6</th><td>2</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>4</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table></details>

### 結果

原陣列被重寫為升序序列 \[0, 0, 0, 1, 1, 2, 2, 2, 4, 4\]。這種簡單實現直接根據頻數重建整數序列，若輸入元素是攜帶附加屬性的複合物件，則需進一步藉助前綴和來保持原物件身份與穩定性。
