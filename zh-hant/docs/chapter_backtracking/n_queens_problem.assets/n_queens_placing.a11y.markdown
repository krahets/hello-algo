<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 5118dbace6f936721c0966ea963d668a702adef30ba737eaef1a54aa5ada7212 -->

# 逐行嘗試與剪去衝突棋盤

以第一行放第 2 列的分支為例，展示四層 16 個候選棋盤的逐行試探與剪枝，確定合法解 \[2, 4, 1, 3\]。

## 問題與輸入

因每行恰好只能放置一枚皇后，回溯演算法從第 1 行到第 4 行逐行放置以直接避免同行衝突；每層依次嘗試該行第 1 至第 4 列，剪去與已放皇后同列或同對角線的分支。本圖行列均從 1 開始編號。

## 結構與關係

四層共展示 16 個候選棋盤：每次處理下一行，從第 1 列到第 4 列嘗試候選位置，若與已放皇后同列或同對角線，就停止該候選分支。

圖中只繼續展開第一行第 2 列分支，之後三行依次保留第 4、1、3 列。第一行第 1、3、4 列的後續標為省略，表示圖中沒有展開，並非剪枝結論；其中第一行第 3 列對應另一個合法解 \[3, 1, 4, 2\]。

<table><caption>每個候選格的處置：座標從 1 開始</caption><thead><tr><th scope="col">當前候選格</th><th scope="col">已放皇后</th><th scope="col">圖中指出的衝突物件</th><th scope="col">衝突型別</th><th scope="col">處置</th></tr></thead><tbody><tr><th scope="row">(1,1)</th><td>無</td><td>無</td><td>無衝突</td><td>合法，後續省略</td></tr><tr><th scope="row">(1,2)</th><td>無</td><td>無</td><td>無衝突</td><td>保留並繼續</td></tr><tr><th scope="row">(1,3)</th><td>無</td><td>無</td><td>無衝突</td><td>合法，後續省略</td></tr><tr><th scope="row">(1,4)</th><td>無</td><td>無</td><td>無衝突</td><td>合法，後續省略</td></tr><tr><th scope="row">(2,1)</th><td>(1,2)</td><td>(1,2)</td><td>次對角線</td><td>剪去</td></tr><tr><th scope="row">(2,2)</th><td>(1,2)</td><td>(1,2)</td><td>同列</td><td>剪去</td></tr><tr><th scope="row">(2,3)</th><td>(1,2)</td><td>(1,2)</td><td>主對角線</td><td>剪去</td></tr><tr><th scope="row">(2,4)</th><td>(1,2)</td><td>無</td><td>無衝突</td><td>保留並繼續</td></tr><tr><th scope="row">(3,1)</th><td>(1,2)、(2,4)</td><td>無</td><td>無衝突</td><td>保留並繼續</td></tr><tr><th scope="row">(3,2)</th><td>(1,2)、(2,4)</td><td>(1,2)</td><td>同列</td><td>剪去</td></tr><tr><th scope="row">(3,3)</th><td>(1,2)、(2,4)</td><td>(2,4)</td><td>次對角線</td><td>剪去</td></tr><tr><th scope="row">(3,4)</th><td>(1,2)、(2,4)</td><td>(2,4)</td><td>同列</td><td>剪去</td></tr><tr><th scope="row">(4,1)</th><td>(1,2)、(2,4)、(3,1)</td><td>(3,1)</td><td>同列</td><td>剪去</td></tr><tr><th scope="row">(4,2)</th><td>(1,2)、(2,4)、(3,1)</td><td>(3,1)</td><td>主對角線</td><td>剪去</td></tr><tr><th scope="row">(4,3)</th><td>(1,2)、(2,4)、(3,1)</td><td>無</td><td>無衝突</td><td>保留並繼續</td></tr><tr><th scope="row">(4,4)</th><td>(1,2)、(2,4)、(3,1)</td><td>(2,4)</td><td>同列</td><td>剪去</td></tr></tbody></table>

<a id="source-365"></a>

第一行選第 2 列後，逐行檢查四個列候選，剪去發生同列或對角線衝突的棋盤。

## 結果

圖中展開的第一行第 2 列分支唯一通向合法解 \[2, 4, 1, 3\]；其餘三個首行分支僅因畫幅省略（第一行第 3 列分支對應另一個合法解 \[3, 1, 4, 2\]），不能誤認為整個問題只有一個解。
