<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 4e704f872e737beef639e63a806c13c05837ca17d6052d313779eb10e18577f5 -->

# 僅按和越界剪枝仍會生成重複組合

從累計和 0 出發累加 3、4、5，超過 9 的分支被剪除，但仍同時輸出重複組合 \[4, 5\] 與 \[5, 4\]。

## 問題與輸入

給定正整數候選陣列 choices = \[3, 4, 5\] 與目標和 target = 9，允許同一元素重複選取，且結果子集（組合）不區分元素順序。

## 結構與關係

圓節點表示當前字首的累計和（根為 0），每輪從全部候選 3、4、5 中嘗試累加：新和超過 9（圖中 &gt;9 虛線剪枝，不構成新圓節點）則跳過；恰好等於 9 則記錄結果並返回。

僅檢查總和是否超過 9 並未限制選數先後順序，\[4, 5\] 與 \[5, 4\] 都會達到累計和 9 並輸出，從而產生重複組合。

<table><caption>累計和搜尋樹</caption><thead><tr><th scope="col">當前字首</th><th scope="col">累計和</th><th scope="col">下一輪選擇或終止原因</th></tr></thead><tbody><tr><th scope="row">[]</th><td>0</td><td>+3→3；+4→4；+5→5</td></tr><tr><th scope="row">[3]</th><td>3</td><td>+3→6；+4→7；+5→8</td></tr><tr><th scope="row">[4]</th><td>4</td><td>+3→7；+4→8；+5→9，記錄 [4,5]</td></tr><tr><th scope="row">[5]</th><td>5</td><td>+3→8；+4→9，記錄 [5,4]；+5 越界</td></tr><tr><th scope="row">[3, 3]</th><td>6</td><td>+3→9，記錄 [3,3,3]；+4、+5 越界</td></tr><tr><th scope="row">[3, 4]</th><td>7</td><td>+3、+4、+5 全部越界</td></tr><tr><th scope="row">[3, 5]</th><td>8</td><td>+3、+4、+5 全部越界</td></tr><tr><th scope="row">[4, 3]</th><td>7</td><td>+3、+4、+5 全部越界</td></tr><tr><th scope="row">[4, 4]</th><td>8</td><td>+3、+4、+5 全部越界</td></tr><tr><th scope="row">[4, 5]</th><td>9</td><td>記錄結果並返回</td></tr><tr><th scope="row">[5, 3]</th><td>8</td><td>+3、+4、+5 全部越界</td></tr><tr><th scope="row">[5, 4]</th><td>9</td><td>記錄結果並返回</td></tr><tr><th scope="row">[3, 3, 3]</th><td>9</td><td>記錄結果並返回</td></tr></tbody></table>

<a id="source-358"></a>

越界剪枝及時截斷了和大於 9 的分支，但因每輪仍從頭列舉全部候選，未能消除反序重複組合。

## 結果

越界剪枝雖能及時終止累計和超過 9 的分支，但搜尋仍輸出 \[3, 3, 3\]、\[4, 5\]、\[5, 4\] 三個結果，其中 \[4, 5\] 與 \[5, 4\] 是順序不同但元素相同的重複組合。
