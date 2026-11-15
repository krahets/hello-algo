<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: c5843c1efa9b100ae3715faa4c125577c409e7f90ce7757b74cd9c893b381b5e -->

# 递归构树：向下创建节点，返回时连接子树

向下递进时依次创建节点 3、9、2、1、7，向上回溯返回时才将子树连接到父节点，最终建成五节点树。

## 问题与输入

输入为前序遍历 preorder = \[3, 9, 2, 1, 7\] 与中序遍历 inorder = \[9, 3, 1, 2, 7\]，节点值互不重复。

每个递归子问题先从前序有效段首元素初始化当前根节点（向下“递”时创建节点），再按中序位置划分并递归构建左、右子树；当子调用返回子树根节点后，父调用才将其赋给当前根的 left 或 right 引用（向上“归”时建立连边）。空区间调用直接返回 None。

## 结构与关系

向下递归时创建节点，子调用返回时才把它连接到父节点。已经创建的子节点若尚未返回，图中就没有相应父子边。

每帧说明本次创建或连接动作，表格列出此时已创建的全部节点和已建立的引用。空区间返回 None 的调用未单独拆帧。

<table><caption>固定遍历输入</caption><thead><tr><th scope="col">索引</th><th scope="col">前序值</th><th scope="col">中序值</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td><td>9</td></tr><tr><th scope="row">1</th><td>9</td><td>3</td></tr><tr><th scope="row">2</th><td>2</td><td>1</td></tr><tr><th scope="row">3</th><td>1</td><td>2</td></tr><tr><th scope="row">4</th><td>7</td><td>7</td></tr></tbody></table>

<a id="source-317"></a>

## 第 1 步：创建根节点 3

进入顶层调用 i = 0、中序区间 \[0, 4\]：由前序首元素 3 创建根节点 3；在中序索引 1 处找到 3，将左子树划分为 \[9\]，将右子树划分为中序 \[1, 2, 7\]、前序 \[2, 1, 7\]。接下来优先递归构建左子树。

<details><summary>本步完整状态</summary><p>当前由前序首项创建根节点 3，尚无父子边。当前表中“未连接”表示相应子树尚待构建或返回连接；“无”表示确实没有该子节点。</p><table><caption>当前已创建节点及引用</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>未连接</td><td>未连接</td></tr></tbody></table></details>

<a id="source-318"></a>

## 第 2 步：创建叶节点 9

进入左子问题 i = 1、中序区间 \[0, 0\]：由根值 9 创建节点 9。由于其左右两侧的中序子区间均为空（返回 None），节点 9 成为叶节点；但本帧子调用尚未返回，因此节点 9 与根节点 3 之间还未建立连边。

<details><summary>本步完整状态</summary><p>当前已创建左叶节点 9，但尚未接到根 3。已创建节点及引用见表；未连接的子树尚待构建或返回连接。</p><table><caption>当前已创建节点及引用</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>未连接</td><td>未连接</td></tr><tr><th scope="row">9</th><td>无</td><td>无</td></tr></tbody></table></details>

<a id="source-319"></a>

## 第 3 步：连接左子树 9

左子问题构建完毕并将节点 9 返回给顶层根 3 的调用，执行 3.left = 9 建立左子边。至此根 3 的左子树连接完成，接下来转向构建根 3 的右子树。

<details><summary>本步完整状态</summary><p>左叶节点 9 已返回并接到根 3，右子树尚待构建。当前表列出两节点的引用。</p><table><caption>当前已创建节点及引用</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>未连接</td></tr><tr><th scope="row">9</th><td>无</td><td>无</td></tr></tbody></table></details>

<a id="source-320"></a>

## 第 4 步：创建右子树根 2

进入 i = 2、中序区间 \[2, 4\] 的右子问题：取有效前序段 \[2, 1, 7\] 的首元素 2 创建节点 2，并根据中序索引 3 将其左子问题划分为 \[1\]、右子问题划分为 \[7\]。由于以 2 为根的子树尚未构建完毕返回，此时 3 与 2 之间还没有连边。

<details><summary>本步完整状态</summary><p>当前已创建右子树根 2，其左右子树尚待构建；2 尚未返回连接到根 3。已有的 3→9 保持连接，完整节点状态见表。</p><table><caption>当前已创建节点及引用</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>未连接</td></tr><tr><th scope="row">9</th><td>无</td><td>无</td></tr><tr><th scope="row">2</th><td>未连接</td><td>未连接</td></tr></tbody></table></details>

<a id="source-321"></a>

## 第 5 步：创建叶节点 1

进入节点 2 的左子问题 i = 3、中序区间 \[2, 2\]：创建节点 1。该区间仅含单个元素，其左右子区间均为空；本帧子调用尚未返回，因此节点 1 还未连接到节点 2。

<details><summary>本步完整状态</summary><p>当前已创建叶节点 1，但尚未接到节点 2；以 2 为根的子树也尚未接回根 3。当前表列出已创建的四个节点。</p><table><caption>当前已创建节点及引用</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>未连接</td></tr><tr><th scope="row">9</th><td>无</td><td>无</td></tr><tr><th scope="row">2</th><td>未连接</td><td>未连接</td></tr><tr><th scope="row">1</th><td>无</td><td>无</td></tr></tbody></table></details>

<a id="source-322"></a>

## 第 6 步：连接节点 2 的左子树

节点 1 的子调用返回给节点 2，执行 2.left = 1 建立左子边。此时节点 2 的左子树已连接完毕，但其右子问题 \[7\] 尚待构建，因此节点 2 仍未返回并连接到根 3。

<details><summary>本步完整状态</summary><p>叶节点 1 已返回并接为节点 2 的左子节点，右子问题尚待构建；2 尚未接回根 3。全部引用见当前表。</p><table><caption>当前已创建节点及引用</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>未连接</td></tr><tr><th scope="row">9</th><td>无</td><td>无</td></tr><tr><th scope="row">2</th><td>1</td><td>未连接</td></tr><tr><th scope="row">1</th><td>无</td><td>无</td></tr></tbody></table></details>

<a id="source-323"></a>

## 第 7 步：创建叶节点 7

进入节点 2 的右子问题 i = 4、中序区间 \[4, 4\]：创建最后一个节点 7。其左右子区间均为空，即将作为叶节点返回给节点 2；本帧尚未建立 2 到 7 的右子边。

<details><summary>本步完整状态</summary><p>最后一个叶节点 7 已创建，尚未接到节点 2；当前已创建全部五个节点，2→7 和 3→2 仍未连接。已建立的引用见表。</p><table><caption>当前已创建节点及引用</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>未连接</td></tr><tr><th scope="row">9</th><td>无</td><td>无</td></tr><tr><th scope="row">2</th><td>1</td><td>未连接</td></tr><tr><th scope="row">1</th><td>无</td><td>无</td></tr><tr><th scope="row">7</th><td>无</td><td>无</td></tr></tbody></table></details>

<a id="source-324"></a>

## 第 8 步：连接节点 2 的右子树

叶节点 7 返回给节点 2，执行 2.right = 7 建立右子边，完整合成以 2 为根、1 和 7 为左右子节点的子树。此时该子树准备向上返回给顶层根 3，画面中 3 与 2 之间的连边尚未建立。

<details><summary>本步完整状态</summary><p>叶节点 7 已接到节点 2，以 2 为根的右子树已完成，尚未返回连接到根 3。当前表列出全部五个节点及已建立的三条边。</p><table><caption>当前已创建节点及引用</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>未连接</td></tr><tr><th scope="row">9</th><td>无</td><td>无</td></tr><tr><th scope="row">2</th><td>1</td><td>7</td></tr><tr><th scope="row">1</th><td>无</td><td>无</td></tr><tr><th scope="row">7</th><td>无</td><td>无</td></tr></tbody></table></details>

<a id="source-325"></a>

## 第 9 步：连接完整右子树

右子树调用将子树根节点 2 返回给顶层根 3，执行 3.right = 2 建立最后一条连边。至此根 3 的左右子树全部就绪，顶层函数返回根节点 3，整棵五节点二叉树构建完成。

<details><summary>本步完整状态</summary><p>完整右子树已接回根 3，五节点树的四条父子边全部建立。顶层返回根 3，完整连接见当前表。</p><table><caption>当前已创建节点及引用</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>2</td></tr><tr><th scope="row">9</th><td>无</td><td>无</td></tr><tr><th scope="row">2</th><td>1</td><td>7</td></tr><tr><th scope="row">1</th><td>无</td><td>无</td></tr><tr><th scope="row">7</th><td>无</td><td>无</td></tr></tbody></table></details>

## 结果

最终建成的二叉树以 3 为根节点，左子节点为 9，右子节点为 2；节点 2 的左右子节点分别为 1 和 7；节点 9、1、7 均为叶节点。顶层调用返回根节点 3，所得二叉树的前序遍历为 \[3, 9, 2, 1, 7\]，中序遍历为 \[9, 3, 1, 2, 7\]。
