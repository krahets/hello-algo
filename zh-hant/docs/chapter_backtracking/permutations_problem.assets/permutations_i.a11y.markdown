<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 9aaf426f3ef96ee2e492e56372732db7a519b0009ff732a0d3108d9db289a004 -->

# 無相等元素全排列的遞迴選擇樹

從空前綴出發，每輪從 \[1, 2, 3\] 中選一個未用元素追加到 state，三輪生成 6 個全排列。

## 問題與輸入

輸入候選陣列 choices = \[1, 2, 3\]，三個元素互不相同，且同一排列中每個元素只能使用一次。根節點畫為三個空白槽位，表示尚未填入任何元素的空字首 \[\]，空白槽位本身不是元素值。

## 結構與關係

從空字首開始，每輪追加一個尚未使用的元素；圖將所有遞迴分支同時展開，實際回溯程式碼在葉節點複製儲存 state 後，會彈出末尾元素並撤銷 selected 標記以嘗試兄弟分支。

<table><caption>按字首查詢後續選擇</caption><thead><tr><th scope="col">當前字首</th><th scope="col">可選元素</th><th scope="col">下一層字首或葉結果</th></tr></thead><tbody><tr><th scope="row">[]</th><td>1、2、3</td><td>[1]；[2]；[3]</td></tr><tr><th scope="row">[1]</th><td>2、3</td><td>[1, 2]；[1, 3]</td></tr><tr><th scope="row">[2]</th><td>1、3</td><td>[2, 1]；[2, 3]</td></tr><tr><th scope="row">[3]</th><td>1、2</td><td>[3, 1]；[3, 2]</td></tr><tr><th scope="row">[1, 2]</th><td>3</td><td>[1, 2, 3]</td></tr><tr><th scope="row">[1, 3]</th><td>2</td><td>[1, 3, 2]</td></tr><tr><th scope="row">[2, 1]</th><td>3</td><td>[2, 1, 3]</td></tr><tr><th scope="row">[2, 3]</th><td>1</td><td>[2, 3, 1]</td></tr><tr><th scope="row">[3, 1]</th><td>2</td><td>[3, 1, 2]</td></tr><tr><th scope="row">[3, 2]</th><td>1</td><td>[3, 2, 1]</td></tr></tbody></table>

<table><caption>全部六個排列</caption><thead><tr><th scope="col">結果序號</th><th scope="col">完整排列</th></tr></thead><tbody><tr><th scope="row">1</th><td>[1, 2, 3]</td></tr><tr><th scope="row">2</th><td>[1, 3, 2]</td></tr><tr><th scope="row">3</th><td>[2, 1, 3]</td></tr><tr><th scope="row">4</th><td>[2, 3, 1]</td></tr><tr><th scope="row">5</th><td>[3, 1, 2]</td></tr><tr><th scope="row">6</th><td>[3, 2, 1]</td></tr></tbody></table>

<a id="source-353"></a>

每條從根到葉的路徑依次選完三個不同元素，中途節點表示已填好的排列字首。

## 結果

第一、二、三輪每個節點的可選元素個數依次為 3、2、1，共生成 3 × 2 × 1 = 6 個葉節點，對應 \[1, 2, 3\] 的全部 6 個全排列。
