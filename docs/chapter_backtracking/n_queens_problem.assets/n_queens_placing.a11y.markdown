<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: b3402e59218b22b2c555d4f793f3abbc6206fd81f689dcd036d8e111276a6f4a -->

# 逐行尝试与剪去冲突棋盘

以第一行放第 2 列的分支为例，展示四层 16 个候选棋盘的逐行试探与剪枝，确定合法解 \[2, 4, 1, 3\]。

## 问题与输入

因每行恰好只能放置一枚皇后，回溯算法从第 1 行到第 4 行逐行放置以直接避免同行冲突；每层依次尝试该行第 1 至第 4 列，剪去与已放皇后同列或同对角线的分支。本图行列均从 1 开始编号。

## 结构与关系

四层共展示 16 个候选棋盘：每次处理下一行，从第 1 列到第 4 列尝试候选位置，若与已放皇后同列或同对角线，就停止该候选分支。

图中只继续展开第一行第 2 列分支，之后三行依次保留第 4、1、3 列。第一行第 1、3、4 列的后续标为省略，表示图中没有展开，并非剪枝结论；其中第一行第 3 列对应另一个合法解 \[3, 1, 4, 2\]。

<table><caption>每个候选格的处置：坐标从 1 开始</caption><thead><tr><th scope="col">当前候选格</th><th scope="col">已放皇后</th><th scope="col">图中指出的冲突对象</th><th scope="col">冲突类型</th><th scope="col">处置</th></tr></thead><tbody><tr><th scope="row">(1,1)</th><td>无</td><td>无</td><td>无冲突</td><td>合法，后续省略</td></tr><tr><th scope="row">(1,2)</th><td>无</td><td>无</td><td>无冲突</td><td>保留并继续</td></tr><tr><th scope="row">(1,3)</th><td>无</td><td>无</td><td>无冲突</td><td>合法，后续省略</td></tr><tr><th scope="row">(1,4)</th><td>无</td><td>无</td><td>无冲突</td><td>合法，后续省略</td></tr><tr><th scope="row">(2,1)</th><td>(1,2)</td><td>(1,2)</td><td>次对角线</td><td>剪去</td></tr><tr><th scope="row">(2,2)</th><td>(1,2)</td><td>(1,2)</td><td>同列</td><td>剪去</td></tr><tr><th scope="row">(2,3)</th><td>(1,2)</td><td>(1,2)</td><td>主对角线</td><td>剪去</td></tr><tr><th scope="row">(2,4)</th><td>(1,2)</td><td>无</td><td>无冲突</td><td>保留并继续</td></tr><tr><th scope="row">(3,1)</th><td>(1,2)、(2,4)</td><td>无</td><td>无冲突</td><td>保留并继续</td></tr><tr><th scope="row">(3,2)</th><td>(1,2)、(2,4)</td><td>(1,2)</td><td>同列</td><td>剪去</td></tr><tr><th scope="row">(3,3)</th><td>(1,2)、(2,4)</td><td>(2,4)</td><td>次对角线</td><td>剪去</td></tr><tr><th scope="row">(3,4)</th><td>(1,2)、(2,4)</td><td>(2,4)</td><td>同列</td><td>剪去</td></tr><tr><th scope="row">(4,1)</th><td>(1,2)、(2,4)、(3,1)</td><td>(3,1)</td><td>同列</td><td>剪去</td></tr><tr><th scope="row">(4,2)</th><td>(1,2)、(2,4)、(3,1)</td><td>(3,1)</td><td>主对角线</td><td>剪去</td></tr><tr><th scope="row">(4,3)</th><td>(1,2)、(2,4)、(3,1)</td><td>无</td><td>无冲突</td><td>保留并继续</td></tr><tr><th scope="row">(4,4)</th><td>(1,2)、(2,4)、(3,1)</td><td>(2,4)</td><td>同列</td><td>剪去</td></tr></tbody></table>

<a id="source-365"></a>

第一行选第 2 列后，逐行检查四个列候选，剪去发生同列或对角线冲突的棋盘。

## 结果

图中展开的第一行第 2 列分支唯一通向合法解 \[2, 4, 1, 3\]；其余三个首行分支仅因画幅省略（第一行第 3 列分支对应另一个合法解 \[3, 1, 4, 2\]），不能误认为整个问题只有一个解。
