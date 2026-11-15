<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: be0de5f3c3ccb455a8bb1f51762a46ec45eea9c9e9b44d7c51628684065b9192 -->

# 四皇后的兩個解

在 4×4 棋盤上放置 4 枚皇后，使其滿足不同行、不同列且不同對角線的約束。

## 問題與輸入

4 皇后問題要求在 4×4 國際象棋棋盤上放置 4 枚皇后，使任意兩枚皇后都不處於同一行、同一列或同一條對角線上。原圖棋盤未標數字座標；為便於定位，以下按行從上到下、列從左到右均從 1 開始編號。

<table><caption>從上到下各行皇后所在列（編號從1開始）</caption><thead><tr><th scope="col">行</th><th scope="col">左棋盤列</th><th scope="col">右棋盤列</th></tr></thead><tbody><tr><th scope="row">1</th><td>2</td><td>3</td></tr><tr><th scope="row">2</th><td>4</td><td>1</td></tr><tr><th scope="row">3</th><td>1</td><td>4</td></tr><tr><th scope="row">4</th><td>3</td><td>2</td></tr></tbody></table>

<a id="source-363"></a>

左棋盤第 1 至 4 行皇后的列號依次為 2、4、1、3，右棋盤依次為 3、1、4、2；具體座標可按附表逐行查詢。兩個方案均滿足每行僅一枚、每列僅一枚，且任意兩枚皇后的行號之差絕對值不等於列號之差絕對值，因此也不在同一條主對角線或副對角線上。

## 結果

兩種合法解的逐行列號分別為 \[2, 4, 1, 3\] 和 \[3, 1, 4, 2\]，兩者互為左右映象，構成了 4 皇后問題的全部解。
