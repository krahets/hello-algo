<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: b19f500ab3cec902d8c8e1ab837be7543e43ad60cd8f82943cdc9a8decf8c070 -->

# 皇后不能同行、同列或同对角线

左图展示单枚皇后在行、列与两条对角线上禁用的 11 个格，右图展示满足全部约束的 4 皇后合法解。

## 问题与输入

国际象棋中的皇后可沿水平行、竖直列以及主、次两条斜对角线攻击任意距离上的棋子。本图 4×4 棋盘按行从上到下、列从左到右均从 1 开始编号（1 基坐标）。

## 结构与关系

左棋盘在第 2 行第 2 列（(2, 2)）放一枚皇后，与它同行、同列或位于两条对角线上的其他格子都不能再放皇后，四个方向共排除 11 格。

右棋盘给出一组同时满足全部约束的摆放，每行依次选第 2、4、1、3 列。每行只放一枚皇后不能保证互不攻击，那只自动避免同行冲突，还要满足不同列和两类对角线约束。

<table><caption>皇后 (2,2) 的禁用格：坐标从 1 开始</caption><thead><tr><th scope="col">方向</th><th scope="col">受攻击格</th><th scope="col">格数</th></tr></thead><tbody><tr><th scope="row">同行</th><td>(2,1)、(2,3)、(2,4)</td><td>3</td></tr><tr><th scope="row">同列</th><td>(1,2)、(3,2)、(4,2)</td><td>3</td></tr><tr><th scope="row">主对角线（左上至右下）</th><td>(1,1)、(3,3)、(4,4)</td><td>3</td></tr><tr><th scope="row">次对角线（右上至左下）</th><td>(1,3)、(3,1)</td><td>2</td></tr></tbody></table>

<table><caption>右棋盘的合法摆放</caption><thead><tr><th scope="col">行</th><th scope="col">皇后所在列</th></tr></thead><tbody><tr><th scope="row">1</th><td>2</td></tr><tr><th scope="row">2</th><td>4</td></tr><tr><th scope="row">3</th><td>1</td></tr><tr><th scope="row">4</th><td>3</td></tr></tbody></table>

<a id="source-364"></a>

合法摆放要求任意两枚皇后均不同行、不同列且不在同一条主对角线或次对角线上。

## 结果

合法摆放必须同时满足不同行、不同列、不同主对角线和不同次对角线四项限制；按行逐枚放置虽能自然规避同行冲突，但仍需检查列与两条对角线。
