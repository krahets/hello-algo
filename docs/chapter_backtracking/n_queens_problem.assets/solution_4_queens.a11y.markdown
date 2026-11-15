<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: d9641b92b92da33808af9271fecb1ab9b513f499bbbda84abcc0db4b0d620b24 -->

# 四皇后的两个解

在 4×4 棋盘上放置 4 枚皇后，使其满足不同行、不同列且不同对角线的约束。

## 问题与输入

4 皇后问题要求在 4×4 国际象棋棋盘上放置 4 枚皇后，使任意两枚皇后都不处于同一行、同一列或同一条对角线上。原图棋盘未标数字坐标；为便于定位，以下按行从上到下、列从左到右均从 1 开始编号。

<table><caption>从上到下各行皇后所在列（编号从1开始）</caption><thead><tr><th scope="col">行</th><th scope="col">左棋盘列</th><th scope="col">右棋盘列</th></tr></thead><tbody><tr><th scope="row">1</th><td>2</td><td>3</td></tr><tr><th scope="row">2</th><td>4</td><td>1</td></tr><tr><th scope="row">3</th><td>1</td><td>4</td></tr><tr><th scope="row">4</th><td>3</td><td>2</td></tr></tbody></table>

<a id="source-363"></a>

左棋盘第 1 至 4 行皇后的列号依次为 2、4、1、3，右棋盘依次为 3、1、4、2；具体坐标可按附表逐行查询。两个方案均满足每行仅一枚、每列仅一枚，且任意两枚皇后的行号之差绝对值不等于列号之差绝对值，因此也不在同一条主对角线或副对角线上。

## 结果

两种合法解的逐行列号分别为 \[2, 4, 1, 3\] 和 \[3, 1, 4, 2\]，两者互为左右镜像，构成了 4 皇后问题的全部解。
