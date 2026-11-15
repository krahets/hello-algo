<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 46dfd662cf9e2fa5117625f1d126d474af3149b52193f04ac3e0e3f1c80bc847 -->

# 皇后不能同行、同列或同對角線

左圖展示單枚皇后在行、列與兩條對角線上停用的 11 個格，右圖展示滿足全部約束的 4 皇后合法解。

## 問題與輸入

國際象棋中的皇后可沿水平行、豎直列以及主、次兩條斜對角線攻擊任意距離上的棋子。本圖 4×4 棋盤按行從上到下、列從左到右均從 1 開始編號（1 基座標）。

## 結構與關係

左棋盤在第 2 行第 2 列（(2, 2)）放一枚皇后，與它同行、同列或位於兩條對角線上的其他格子都不能再放皇后，四個方向共排除 11 格。

右棋盤給出一組同時滿足全部約束的擺放，每行依次選第 2、4、1、3 列。每行只放一枚皇后不能保證互不攻擊，那隻自動避免同行衝突，還要滿足不同列和兩類對角線約束。

<table><caption>皇后 (2,2) 的停用格：座標從 1 開始</caption><thead><tr><th scope="col">方向</th><th scope="col">受攻擊格</th><th scope="col">格數</th></tr></thead><tbody><tr><th scope="row">同行</th><td>(2,1)、(2,3)、(2,4)</td><td>3</td></tr><tr><th scope="row">同列</th><td>(1,2)、(3,2)、(4,2)</td><td>3</td></tr><tr><th scope="row">主對角線（左上至右下）</th><td>(1,1)、(3,3)、(4,4)</td><td>3</td></tr><tr><th scope="row">次對角線（右上至左下）</th><td>(1,3)、(3,1)</td><td>2</td></tr></tbody></table>

<table><caption>右棋盤的合法擺放</caption><thead><tr><th scope="col">行</th><th scope="col">皇后所在列</th></tr></thead><tbody><tr><th scope="row">1</th><td>2</td></tr><tr><th scope="row">2</th><td>4</td></tr><tr><th scope="row">3</th><td>1</td></tr><tr><th scope="row">4</th><td>3</td></tr></tbody></table>

<a id="source-364"></a>

合法擺放要求任意兩枚皇后均不同行、不同列且不在同一條主對角線或次對角線上。

## 結果

合法擺放必須同時滿足不同行、不同列、不同主對角線和不同次對角線四項限制；按行逐枚放置雖能自然規避同行衝突，但仍需檢查列與兩條對角線。
