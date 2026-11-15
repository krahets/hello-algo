<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: b7cb25a9418832c137543fc782535c90cbc6338e99189046cd205372174db433 -->

# 二叉树的三种深度优先遍历

沿同一深度优先递归轨迹，按记录当前节点值的时机区分前序、中序与后序遍历。

## 结构与关系

环绕树外围的虚线表示递归调用与返回的深度优先轨迹，并非树的边；节点旁的橙、蓝、紫圆点分别对应左递归前、左右递归之间、右递归后三个记录时机。

<table><caption>三种遍历的记录时机与输出</caption><thead><tr><th scope="col">遍历</th><th scope="col">记录当前节点的时机</th><th scope="col">访问优先级</th><th scope="col">输出序列</th></tr></thead><tbody><tr><th scope="row">前序</th><td>左递归之前</td><td>根 → 左子树 → 右子树</td><td>1, 2, 4, 5, 3, 6, 7</td></tr><tr><th scope="row">中序</th><td>左递归之后、右递归之前</td><td>左子树 → 根 → 右子树</td><td>4, 2, 5, 1, 6, 3, 7</td></tr><tr><th scope="row">后序</th><td>右递归之后</td><td>左子树 → 右子树 → 根</td><td>4, 5, 2, 6, 7, 3, 1</td></tr></tbody></table>

<a id="source-98"></a>

递归都先处理左子树再处理右子树，遇到空节点即返回。记录当前节点发生在左递归之前为前序，在左、右两个递归之间为中序，在右递归之后为后序。

## 结果

三种遍历序列见表；本图是普通二叉树（根 1 的左子节点为 2），三种遍历不要求满足二叉搜索树的大小关系。
