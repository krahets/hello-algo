<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 14d1d1558ff1ab266547e91f1a93af851c384a502c147afee850244c7fcd9adb -->

# 全排列中剪掉已選元素

沿 1 → 3 → 2 的選擇路徑，用 selected 剪去當前排列字首中已使用過的元素索引。

## 問題與輸入

輸入為 choices = \[1, 2, 3\]（索引 0、1、2），無相等元素，每個元素在同一排列中只能使用一次。state 儲存當前排列字首，布林陣列 selected 按輸入索引記錄該元素在當前路徑中是否已被選用。

## 結構與關係

selected 僅限制當前遞迴路徑內不重複選用同一索引：向下遞迴時跳過已標記索引，回溯返回時則會撤銷該標記，因此選過 1 不會永久停用 1，它在其他排列分支中仍可再次使用。

本圖只完整展開 1 → 3 → 2 一條路徑，剪掉的 \[1, 1\]、\[1, 3, 1\]、\[1, 3, 3\] 均重複使用了當前路徑中的已用索引；其餘 \[2\]、\[3\]、\[1, 2\] 三條合法分支僅以省略號收起。

<table><caption>突出路徑上的選擇限制</caption><thead><tr><th scope="col">當前字首</th><th scope="col">已用索引（對應值）</th><th scope="col">仍可選擇</th><th scope="col">圖中繼續的選擇</th></tr></thead><tbody><tr><th scope="row">[]</th><td>無</td><td>1、2、3</td><td>1</td></tr><tr><th scope="row">[1]</th><td>0（值 1）</td><td>2、3</td><td>3</td></tr><tr><th scope="row">[1,3]</th><td>0（值 1）、2（值 3）</td><td>2</td><td>2</td></tr></tbody></table>

<table><caption>被收起的合法分支</caption><thead><tr><th scope="col">字首</th><th scope="col">圖中狀態</th></tr></thead><tbody><tr><th scope="row">[2]</th><td>後續未展開</td></tr><tr><th scope="row">[3]</th><td>後續未展開</td></tr><tr><th scope="row">[1,2]</th><td>後續未展開</td></tr></tbody></table>

<a id="source-354"></a>

沿突出路徑依次排除已使用的索引 0（值 1）與索引 2（值 3），第 3 輪只剩索引 1 的元素 2 可填入。

## 結果

圖中突出路徑最終生成排列 \[1, 3, 2\]。剪枝僅禁止同一元素在同一條路徑中重複出現，回溯撤銷標記後不影響其他分支繼續選用該元素。
