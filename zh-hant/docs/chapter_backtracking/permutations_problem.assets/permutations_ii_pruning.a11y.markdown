<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 501a50e7001cfb9816099155c011a58dcd5c5f81facd5c39dcf84ff01a60837a -->

# 同輪剪掉相等元素分支

在同一輪選擇中對相等數值 1 只嘗試一次，提前剪去重複的搜尋子樹。

## 問題與輸入

輸入為 choices = \[1, 1̂, 2\]，索引依次為 0、1、2；1̂ 僅區分第二個 1 的身份，實際數值仍為 1。

## 結構與關係

含相等元素的全排列需同時遵守兩條約束：同一路徑不能重複選用同一輸入索引（selected）；同一輪不能重複嘗試相等數值（duplicated）。

每個遞迴呼叫獨立建立 duplicated，只管當前這一輪迴圈，回溯只撤銷 selected 與 state。因此同一輪跳過第二個 1（1̂）後，進入下一輪遞迴呼叫時仍可選用尚未使用的另一個 1 的索引，使結果依然包含兩個 1。

<table><caption>各字首的一輪選擇</caption><thead><tr><th scope="col">當前字首</th><th scope="col">保留的候選</th><th scope="col">因已用索引跳過</th><th scope="col">因同輪重複值跳過</th></tr></thead><tbody><tr><th scope="row">[]</th><td>1、2</td><td>無</td><td>1̂：本輪已嘗試值 1</td></tr><tr><th scope="row">[1]</th><td>1̂、2</td><td>1：索引 0 已在路徑中</td><td>無</td></tr><tr><th scope="row">[1,1̂]</th><td>2</td><td>1、1̂：對應索引都已使用</td><td>無</td></tr><tr><th scope="row">[1,2]</th><td>1̂</td><td>1、2：對應索引都已使用</td><td>無</td></tr><tr><th scope="row">[2]</th><td>1</td><td>2：索引 2 已在路徑中</td><td>1̂：本輪已嘗試值 1</td></tr><tr><th scope="row">[2,1]</th><td>1̂</td><td>2、1：對應索引都已使用</td><td>無</td></tr></tbody></table>

<table><caption>三個唯一排列</caption><thead><tr><th scope="col">結果序號</th><th scope="col">區分兩個 1 的身份寫法</th><th scope="col">實際數值結果</th></tr></thead><tbody><tr><th scope="row">1</th><td>[1,1̂,2]</td><td>[1,1,2]</td></tr><tr><th scope="row">2</th><td>[1,2,1̂]</td><td>[1,2,1]</td></tr><tr><th scope="row">3</th><td>[2,1,1̂]</td><td>[2,1,1]</td></tr></tbody></table>

<a id="source-356"></a>

圖中標出根 \[\] 下跳過 \[1̂\] 與字首 \[2\] 下跳過 \[2, 1̂\] 兩處同輪重複值剪枝，而不同輪次仍可先後選用兩個不同索引的 1。

## 結果

透過在同輪跳過相等候選，搜尋樹提前剪去重複子樹，直接留下 \[1, 1, 2\]、\[1, 2, 1\]、\[2, 1, 1\] 三個唯一排列。
