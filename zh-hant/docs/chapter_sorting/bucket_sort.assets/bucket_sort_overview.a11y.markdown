<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 6185ae62358f47b69426ecf1142714f2d0c974eb453716dfa476c753b6e56f8f -->

# 分成五個桶，桶內排序後依次合併

十個小數按數值範圍分入五個桶，桶內分別升序排序，再按桶序連線成有序陣列。

## 問題與輸入

輸入陣列為 nums = \[0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37\]，全部元素均為 \[0, 1) 區間內的浮點數，演算法設定五個寬度為 0.2 的桶。

## 結構與關係

先將每個數放入它所屬的左閉右開區間，再分別對桶內元素排序。中間畫面已經完成這兩項操作，並不展示剛入桶時的先後順序。

最後按區間從小到大的桶序拼接；由於桶的數值範圍互不重疊，各桶內部也已升序，拼接後即為完整有序陣列。

<table><caption>輸入陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>0.49</td></tr><tr><th scope="row">1</th><td>0.96</td></tr><tr><th scope="row">2</th><td>0.82</td></tr><tr><th scope="row">3</th><td>0.09</td></tr><tr><th scope="row">4</th><td>0.57</td></tr><tr><th scope="row">5</th><td>0.43</td></tr><tr><th scope="row">6</th><td>0.91</td></tr><tr><th scope="row">7</th><td>0.75</td></tr><tr><th scope="row">8</th><td>0.15</td></tr><tr><th scope="row">9</th><td>0.37</td></tr></tbody></table>

<table><caption>五個桶的範圍與排序結果</caption><thead><tr><th scope="col">桶範圍</th><th scope="col">桶內升序結果</th></tr></thead><tbody><tr><th scope="row">[0,0.2)</th><td>0.09、0.15</td></tr><tr><th scope="row">[0.2,0.4)</th><td>0.37</td></tr><tr><th scope="row">[0.4,0.6)</th><td>0.43、0.49、0.57</td></tr><tr><th scope="row">[0.6,0.8)</th><td>0.75</td></tr><tr><th scope="row">[0.8,1.0)</th><td>0.82、0.91、0.96</td></tr></tbody></table>

<a id="source-296"></a>

將 10 個 \[0, 1) 內的小數按區間寬度 0.2 分入 5 個左閉右開桶，各桶內部獨立完成升序排序後，再按桶區間從小到大依次拼接。

## 結果

合併後的結果陣列為 \[0.09, 0.15, 0.37, 0.43, 0.49, 0.57, 0.75, 0.82, 0.91, 0.96\]。分桶階段保證了桶間整體的大小次序，桶內排序保證了每個子區間內部的有序性，二者共同完成桶排序。

## 分成五個桶，桶內排序後依次合併：動畫

十個小數按數值範圍分入五個桶，桶內分別升序排序，再按桶序連線成有序陣列。

輸入陣列為 nums = \[0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37\]，全部元素均為 \[0, 1) 區間內的浮點數，演算法設定五個寬度為 0.2 的桶。

先將每個數放入它所屬的左閉右開區間，再分別對桶內元素排序。中間畫面已經完成這兩項操作，並不展示剛入桶時的先後順序。

最後按區間從小到大的桶序拼接；由於桶的數值範圍互不重疊，各桶內部也已升序，拼接後即為完整有序陣列。

### 第 1 步：準備分桶

給出初始待排序的 10 個 \[0, 1) 浮點數，準備按寬度 0.2 的五個左閉右開區間分桶。

<details><summary>本步完整狀態</summary><p>十個 [0,1) 內的小數尚未分桶，準備使用五個寬度為 0.2 的左閉右開區間。當前輸入的索引和值見表。</p><table><caption>輸入陣列</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>0.49</td></tr><tr><th scope="row">1</th><td>0.96</td></tr><tr><th scope="row">2</th><td>0.82</td></tr><tr><th scope="row">3</th><td>0.09</td></tr><tr><th scope="row">4</th><td>0.57</td></tr><tr><th scope="row">5</th><td>0.43</td></tr><tr><th scope="row">6</th><td>0.91</td></tr><tr><th scope="row">7</th><td>0.75</td></tr><tr><th scope="row">8</th><td>0.15</td></tr><tr><th scope="row">9</th><td>0.37</td></tr></tbody></table></details>

### 第 2 步：分桶並完成桶內排序

將 10 個數分入各自所屬的區間桶，且五個桶均已同步完成桶內升序排序。以 \[0.4, 0.6) 桶為例，桶內顯示為升序的 0.43、0.49、0.57，而非按原陣列出現順序排列的 0.49、0.57、0.43。

<details><summary>本步完整狀態</summary><p>十個小數已分入五個桶，各桶內部均已升序。當前表逐桶列出區間及排序結果；尚未拼接結果陣列。</p><table><caption>五個桶的範圍與排序結果</caption><thead><tr><th scope="col">桶範圍</th><th scope="col">桶內升序結果</th></tr></thead><tbody><tr><th scope="row">[0,0.2)</th><td>0.09、0.15</td></tr><tr><th scope="row">[0.2,0.4)</th><td>0.37</td></tr><tr><th scope="row">[0.4,0.6)</th><td>0.43、0.49、0.57</td></tr><tr><th scope="row">[0.6,0.8)</th><td>0.75</td></tr><tr><th scope="row">[0.8,1.0)</th><td>0.82、0.91、0.96</td></tr></tbody></table></details>

### 第 3 步：按桶序拼接完成

因 5 個桶的區間從低到高互不重疊且桶內均已升序，從 \[0, 0.2) 到 \[0.8, 1.0) 逐桶順序取出元素拼接，即得到最終升序陣列。

<details><summary>本步完整狀態</summary><p>五個桶已按區間從小到大的順序拼接，十個小數全部升序。當前表列出結果陣列的每個索引和值。</p><table><caption>排序結果</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>0.09</td></tr><tr><th scope="row">1</th><td>0.15</td></tr><tr><th scope="row">2</th><td>0.37</td></tr><tr><th scope="row">3</th><td>0.43</td></tr><tr><th scope="row">4</th><td>0.49</td></tr><tr><th scope="row">5</th><td>0.57</td></tr><tr><th scope="row">6</th><td>0.75</td></tr><tr><th scope="row">7</th><td>0.82</td></tr><tr><th scope="row">8</th><td>0.91</td></tr><tr><th scope="row">9</th><td>0.96</td></tr></tbody></table></details>

### 結果

合併後的結果陣列為 \[0.09, 0.15, 0.37, 0.43, 0.49, 0.57, 0.75, 0.82, 0.91, 0.96\]。分桶階段保證了桶間整體的大小次序，桶內排序保證了每個子區間內部的有序性，二者共同完成桶排序。
