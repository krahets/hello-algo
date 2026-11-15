<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: e9331e2dfebbe2c9011c0e50f4517eaf39ca73a4e1355708983e98c75349c179 -->

# 用中序位置切分左右子树，再切分前序

前序首项 3 定根，中序分出左子树 \[9\] 与右子树 \[1,2,7\]，再按节点数切分前序。

## 问题与输入

输入为前序遍历 preorder = \[3, 9, 2, 1, 7\] 与中序遍历 inorder = \[9, 3, 1, 2, 7\]，所有节点值互不重复。

## 结构与关系

前序先访问根，因此前序首元素 3 就是根。

在中序中找到 3；它左边只有 \[9\]，右边是 \[1,2,7\]，所以左右子树分别有 1 个和 3 个节点。

据此切分前序：根 3 之后的一个元素 \[9\] 属于左子树，其余 \[2,1,7\] 属于右子树。右子树的两种遍历包含相同节点，访问顺序不同。

<table><caption>左右子问题的遍历序列</caption><thead><tr><th scope="col">部分</th><th scope="col">节点数</th><th scope="col">前序</th><th scope="col">中序</th></tr></thead><tbody><tr><th scope="row">根</th><td>1</td><td>[3]</td><td>[3]</td></tr><tr><th scope="row">左子树</th><td>1</td><td>[9]</td><td>[9]</td></tr><tr><th scope="row">右子树</th><td>3</td><td>[2,1,7]</td><td>[1,2,7]</td></tr></tbody></table>

<table><caption>完整树的连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>2</td></tr><tr><th scope="row">9</th><td>无</td><td>无</td></tr><tr><th scope="row">2</th><td>1</td><td>7</td></tr><tr><th scope="row">1</th><td>无</td><td>无</td></tr><tr><th scope="row">7</th><td>无</td><td>无</td></tr></tbody></table>

<a id="source-314"></a>

先由前序首元素 3 确定根节点，再根据 3 在中序中的位置统计出左子树含 1 个节点、右子树含 3 个节点，最后按该节点数切分前序序列。

## 结果

通过“前序首元素定根 → 中序定左右子树节点数 → 按节点数切分前序”三步，原问题被拆解为左子树（前序 \[9\]、中序 \[9\]）和右子树（前序 \[2, 1, 7\]、中序 \[1, 2, 7\]）两个独立的递归子问题。
