<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: ff157e36710ffc14b84ab19048419f46c2fbb49fbe38a6302d20580b88ac58d5 -->

# 用不遞減的選擇索引避免重複組合

限制下一輪只從當前索引 i 及之後選取（start = i），剪去回頭選更早索引的反序重複分支。

## 問題與輸入

候選陣列為 choices = \[3, 4, 5\]（索引 0、1、2），各元素允許重複選取，且子集不區分元素順序。本圖僅展開前兩輪選擇來對比選數順序與重複子集的關係，未展開第三輪及目標和判斷。

## 結構與關係

組合不區分元素先後：先選較大索引再回頭選較小索引，必定與先選較小索引再選較大索引的路徑重複。因此選了 4 後不再回頭選 3，選了 5 後不再回頭選 3 或 4。

由於本題允許同一元素重複選取（如 \[3, 3, …\]、\[4, 4, …\]、\[5, 5, …\]），當本輪選中索引 i 時，下一輪起始位置必須設為 start = i 而非 i + 1，以保留再次選擇當前元素的分支。圖中末尾的省略號僅表示尚有後續選擇，不表示已達到目標和。

<table><caption>九個兩元素字首及三對重複</caption><thead><tr><th scope="col">兩元素字首</th><th scope="col">處理</th><th scope="col">反序配對字首</th><th scope="col">原因</th></tr></thead><tbody><tr><th scope="row">[3,3,…]</th><td>保留</td><td>無另一順序的配對</td><td>索引不遞減</td></tr><tr><th scope="row">[3,4,…]</th><td>保留</td><td>[4,3,…]</td><td>索引不遞減</td></tr><tr><th scope="row">[3,5,…]</th><td>保留</td><td>[5,3,…]</td><td>索引不遞減</td></tr><tr><th scope="row">[4,3,…]</th><td>跳過更早索引</td><td>[3,4,…]</td><td>與保留字首產生重複組合</td></tr><tr><th scope="row">[4,4,…]</th><td>保留</td><td>無另一順序的配對</td><td>索引不遞減</td></tr><tr><th scope="row">[4,5,…]</th><td>保留</td><td>[5,4,…]</td><td>索引不遞減</td></tr><tr><th scope="row">[5,3,…]</th><td>跳過更早索引</td><td>[3,5,…]</td><td>與保留字首產生重複組合</td></tr><tr><th scope="row">[5,4,…]</th><td>跳過更早索引</td><td>[4,5,…]</td><td>與保留字首產生重複組合</td></tr><tr><th scope="row">[5,5,…]</th><td>保留</td><td>無另一順序的配對</td><td>索引不遞減</td></tr></tbody></table>

<a id="source-359"></a>

透過要求選擇索引不遞減，每對反序組合只保留先選較小索引的一支，同時保留重複取同一元素的分支。

## 結果

在遞迴中用起始索引 start 約束下一輪只從當前索引 i 及之後選取（即傳入 start=i），既能保留同一元素的重複選取，又能徹底避免順序不同的重複子集。
