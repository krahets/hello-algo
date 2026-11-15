<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: af2877bba31ee63a2ed0183b2e18f9c20e6870ce8c0a5b8d96cc6c239b6427c3 -->

# 邻接表的增删操作

增删无向边需同步更新两个端点的邻接链表；删除顶点则需移除该顶点的整条链表，并从其余链表中清理所有指向它的节点。

## 问题与输入

初始图包含五个顶点，邻接表左列按 \[1, 3, 2, 5, 4\] 排列头节点，初始共有六条无向边 1—3、1—5、3—2、2—5、2—4、5—4。每行向右延伸的箭头仅代表链表节点引用，不表示有向边。

## 结构与关系

无向边连接两个顶点，增删一条边时须在两个端点的邻接链表中同步增删对方。每帧状态表列出该步操作完成后的完整邻居列表。

新增孤立顶点时建立一条空链表；删除顶点时移除该顶点的整行链表，并从其余顶点的链表中删去指向它的节点。链表内先后次序按画面记录，不影响无向连接关系；行位置前移不改变顶点身份。 本图添加边时把新邻居放在链表头部；正文代码使用动态数组并在末尾追加，两者表示的无向连接相同。

<a id="source-184"></a>

## 第 1 步：初始化五顶点图

每个顶点对应一行邻接链表，列出与它直接相连的全部邻居；初始 6 条无向边分别在各自两个端点的链表中成对出现。

<details><summary>本步完整状态</summary><p>初始状态：当前顶点依次为 [1, 3, 2, 5, 4]，共有 6 条无向边（1—3、1—5、3—2、2—5、2—4、5—4，尚未连接 1—2）。完整邻居表列于当前状态表；链表箭头仅表示节点引用，不表示有向边。</p><table><caption>初始化顶点列表与六条边</caption><thead><tr><th scope="col">顶点</th><th scope="col">邻居，按画面顺序</th></tr></thead><tbody><tr><th scope="row">1</th><td>3、5</td></tr><tr><th scope="row">3</th><td>1、2</td></tr><tr><th scope="row">2</th><td>3、5、4</td></tr><tr><th scope="row">5</th><td>1、2、4</td></tr><tr><th scope="row">4</th><td>2、5</td></tr></tbody></table></details>

<a id="source-185"></a>

## 第 2 步：添加边 1—2

添加无向边 1—2：在顶点 1 的邻接链表头部加入 2，同时在顶点 2 的邻接链表头部加入 1。

<details><summary>本步完整状态</summary><p>已添加无向边 1—2：当前顶点依次为 [1, 3, 2, 5, 4]，顶点 1 的邻居变为 2、3、5，顶点 2 的邻居变为 1、3、5、4，共有 7 条无向边。完整邻居表见当前状态表。</p><table><caption>添加无向边 1—2</caption><thead><tr><th scope="col">顶点</th><th scope="col">邻居，按画面顺序</th></tr></thead><tbody><tr><th scope="row">1</th><td>2、3、5</td></tr><tr><th scope="row">3</th><td>1、2</td></tr><tr><th scope="row">2</th><td>1、3、5、4</td></tr><tr><th scope="row">5</th><td>1、2、4</td></tr><tr><th scope="row">4</th><td>2、5</td></tr></tbody></table></details>

<a id="source-186"></a>

## 第 3 步：删除边 1—3

删除无向边 1—3：从顶点 1 的邻接链表中删除 3，同时从顶点 3 的邻接链表中删除 1。

<details><summary>本步完整状态</summary><p>已删除无向边 1—3：当前顶点依次为 [1, 3, 2, 5, 4]，顶点 1 的邻居缩为 2、5，顶点 3 的邻居仅剩 2，共有 6 条无向边。完整邻居表见当前状态表。</p><table><caption>删除无向边 1—3</caption><thead><tr><th scope="col">顶点</th><th scope="col">邻居，按画面顺序</th></tr></thead><tbody><tr><th scope="row">1</th><td>2、5</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">2</th><td>1、3、5、4</td></tr><tr><th scope="row">5</th><td>1、2、4</td></tr><tr><th scope="row">4</th><td>2、5</td></tr></tbody></table></details>

<a id="source-187"></a>

## 第 4 步：添加孤立顶点 6

在邻接表末尾新增顶点 6 的一行，其邻接链表为空；其余五个顶点的链表保持不变。

<details><summary>本步完整状态</summary><p>已添加孤立顶点 6：当前顶点依次为 [1, 3, 2, 5, 4, 6]，共有 6 条无向边；新增的顶点 6 邻居表为空，其余顶点邻居不变。</p><table><caption>添加孤立顶点 6</caption><thead><tr><th scope="col">顶点</th><th scope="col">邻居，按画面顺序</th></tr></thead><tbody><tr><th scope="row">1</th><td>2、5</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">2</th><td>1、3、5、4</td></tr><tr><th scope="row">5</th><td>1、2、4</td></tr><tr><th scope="row">4</th><td>2、5</td></tr><tr><th scope="row">6</th><td>空</td></tr></tbody></table></details>

<a id="source-188"></a>

## 第 5 步：删除顶点 3

移除顶点 3 的整行链表，并从顶点 2 的邻接链表中删除节点 3。其余顶点 1、2、5、4、6 保持各自原有身份，不会因行位置上移而改名。

<details><summary>本步完整状态</summary><p>已删除顶点 3 及关联邻接项：当前顶点依次为 [1, 2, 5, 4, 6]（顶点不改名），顶点 2 的邻居更新为 1、5、4，顶点 6 仍为无邻居的孤立顶点，全图共有 5 条无向边。完整邻居表见当前状态表。</p><table><caption>删除顶点 3 及全部关联邻接项</caption><thead><tr><th scope="col">顶点</th><th scope="col">邻居，按画面顺序</th></tr></thead><tbody><tr><th scope="row">1</th><td>2、5</td></tr><tr><th scope="row">2</th><td>1、5、4</td></tr><tr><th scope="row">5</th><td>1、2、4</td></tr><tr><th scope="row">4</th><td>2、5</td></tr><tr><th scope="row">6</th><td>空</td></tr></tbody></table></details>

## 结果

五步操作完成后，邻接表左列保留顶点 \[1, 2, 5, 4, 6\]，图中共有五条无向边 1—5、2—5、2—4、5—4、1—2；顶点 6 的邻接列表为空，顶点 3 的整行及其在其余链表中的邻接项已全部清除。
