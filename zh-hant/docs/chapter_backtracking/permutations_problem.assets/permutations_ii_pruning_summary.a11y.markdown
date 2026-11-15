<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 3c59d494f3ced4428b4a1598e400804e994bd488c6d74ee2c43180c5982bf4c4 -->

# 兩種排列剪枝分別限制索引與數值

並列對照路徑索引不重複（selected）與同輪數值不重複（duplicated）兩類剪枝條件。

## 問題與輸入

輸入為 choices = \[1, 1̂, 2\]（索引 0、1、2，1̂ 僅區分第二個 1 的身份，數值仍為 1）。selected 沿當前路徑記錄已用索引並在回溯時恢復；duplicated 在每次遞迴呼叫內部獨立建立，記錄本輪已嘗試的數值。

## 結構與關係

路徑索引剪枝（圖中黑剪刀）禁止在同一條排列路徑中重複選用已用索引；同輪相等值剪枝（圖中紅剪刀）禁止在同一層迴圈中再次嘗試本輪已選過的數值。

由於 duplicated 的作用域僅限當前這一輪遞迴呼叫，第 1 輪在根處跳過 1̂ 不會阻止下一輪遞迴呼叫繼續選擇尚未使用的索引 1（1̂），所以最終結果仍可包含兩個 1。

<table><caption>各字首的一輪選擇</caption><thead><tr><th scope="col">當前字首</th><th scope="col">保留的候選</th><th scope="col">因已用索引跳過</th><th scope="col">因同輪重複值跳過</th></tr></thead><tbody><tr><th scope="row">[]</th><td>1、2</td><td>無</td><td>1̂：本輪已嘗試值 1</td></tr><tr><th scope="row">[1]</th><td>1̂、2</td><td>1：索引 0 已在路徑中</td><td>無</td></tr><tr><th scope="row">[1,1̂]</th><td>2</td><td>1、1̂：對應索引都已使用</td><td>無</td></tr><tr><th scope="row">[1,2]</th><td>1̂</td><td>1、2：對應索引都已使用</td><td>無</td></tr><tr><th scope="row">[2]</th><td>1</td><td>2：索引 2 已在路徑中</td><td>1̂：本輪已嘗試值 1</td></tr><tr><th scope="row">[2,1]</th><td>1̂</td><td>2、1：對應索引都已使用</td><td>無</td></tr></tbody></table>

<table><caption>三個唯一排列</caption><thead><tr><th scope="col">結果序號</th><th scope="col">區分兩個 1 的身份寫法</th><th scope="col">實際數值結果</th></tr></thead><tbody><tr><th scope="row">1</th><td>[1,1̂,2]</td><td>[1,1,2]</td></tr><tr><th scope="row">2</th><td>[1,2,1̂]</td><td>[1,2,1]</td></tr><tr><th scope="row">3</th><td>[2,1,1̂]</td><td>[2,1,1]</td></tr></tbody></table>

<a id="source-357"></a>

根 \[\] 與字首 \[2\] 處跳過 1̂ 屬於同輪重複值剪枝（紅剪刀），其餘跳過當前路徑已含元素的分支均屬於路徑索引剪枝（黑剪刀）。

## 結果

兩種剪枝各司其職、不可互相替代：selected 保證每個輸入索引在一條路徑中只用一次，duplicated 保證同一輪不因相等數值產生重複分支，最終輸出 \[1, 1̂, 2\]、\[1, 2, 1̂\]、\[2, 1, 1̂\]。
