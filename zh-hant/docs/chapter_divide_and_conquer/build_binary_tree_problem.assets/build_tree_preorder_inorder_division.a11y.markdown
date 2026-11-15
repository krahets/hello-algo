<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 2ec8cd072558cc3ccb16697d10f6f4e920ec8188a592615ca5d0fcfe51c19fcd -->

# 用中序位置切分左右子樹，再切分前序

前序首項 3 定根，中序分出左子樹 \[9\] 與右子樹 \[1,2,7\]，再按節點數切分前序。

## 問題與輸入

輸入為前序走訪 preorder = \[3, 9, 2, 1, 7\] 與中序走訪 inorder = \[9, 3, 1, 2, 7\]，所有節點值互不重複。

## 結構與關係

前序先訪問根，因此前序首元素 3 就是根。

在中序中找到 3；它左邊只有 \[9\]，右邊是 \[1,2,7\]，所以左右子樹分別有 1 個和 3 個節點。

據此切分前序：根 3 之後的一個元素 \[9\] 屬於左子樹，其餘 \[2,1,7\] 屬於右子樹。右子樹的兩種走訪包含相同節點，訪問順序不同。

<table><caption>左右子問題的走訪序列</caption><thead><tr><th scope="col">部分</th><th scope="col">節點數</th><th scope="col">前序</th><th scope="col">中序</th></tr></thead><tbody><tr><th scope="row">根</th><td>1</td><td>[3]</td><td>[3]</td></tr><tr><th scope="row">左子樹</th><td>1</td><td>[9]</td><td>[9]</td></tr><tr><th scope="row">右子樹</th><td>3</td><td>[2,1,7]</td><td>[1,2,7]</td></tr></tbody></table>

<table><caption>完整樹的連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>2</td></tr><tr><th scope="row">9</th><td>無</td><td>無</td></tr><tr><th scope="row">2</th><td>1</td><td>7</td></tr><tr><th scope="row">1</th><td>無</td><td>無</td></tr><tr><th scope="row">7</th><td>無</td><td>無</td></tr></tbody></table>

<a id="source-314"></a>

先由前序首元素 3 確定根節點，再根據 3 在中序中的位置統計出左子樹含 1 個節點、右子樹含 3 個節點，最後按該節點數切分前序序列。

## 結果

透過“前序首元素定根 → 中序定左右子樹節點數 → 按節點數切分前序”三步，原問題被拆解為左子樹（前序 \[9\]、中序 \[9\]）和右子樹（前序 \[2, 1, 7\]、中序 \[1, 2, 7\]）兩個獨立的遞迴子問題。
