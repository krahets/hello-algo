<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: fc593dc0364891121c398e43fcfa119204c25d90a3a11141263109e1272f93aa -->

# 二叉搜索树删除双子节点

删除度为 2 的节点时，先在右子树中定位并摘除中序后继节点，再将后继值写入目标节点 cur。

## 问题与输入

待删除目标值为 4；初始树包含值 3 至 15，根为 8，目标节点 cur 是 8 的左子节点，其左右子节点为 3、6，6 的左右子节点为 5、7；根 8 的右子树根为 12，左右为 10（左 9、右 11）和 14（左 13、右 15）。

cur 始终指向最初存放值 4 的那个节点对象；nex（对应源码中的 tmp）指向它的中序后继，即右子树的最小节点 5。本组严格按图示与源码时序：第 3 步先摘除原后继节点，第 4 步再改写 cur 的值。

<a id="source-124"></a>

## 第 1 步：定位具有两个子节点的目标

目标值 4 小于根 8，向左查找到 cur。因 cur 同时拥有左子节点 3 与右子节点 6，度为 2，不能直接断开父边或单侧接替，本例选择用中序后继的值替换它。

<details><summary>本步完整状态</summary><p>删除双子节点 4 的第 1 步（定位目标）：根为 8，cur 为 8 的左子节点，当前值为 4；cur 的左子节点为 3、右子节点为 6，6 的左右子节点为 5、7，树结构尚未改变。</p><table><caption>当前树的节点连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">cur（值 4）</th><td>3</td><td>6</td></tr><tr><th scope="row">后继节点（值 5）</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>后继节点（值 5）</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>cur（值 4）</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

<a id="source-125"></a>

## 第 2 步：找到中序后继 5

从 cur 进入右子树根 6，再一路向左到达叶节点 5，记为 nex。5 是右子树最小值，也是中序后继，替换后仍大于左子树全部值（3）且小于剩余右子树全部值（6、7），从而保持二叉搜索树性质。

<details><summary>本步完整状态</summary><p>删除双子节点 4 的第 2 步（定位后继）：根为 8，cur 值为 4，左右子节点为 3、6；nex 指向 6 的左叶节点 5（查找路径为 4 → 6 → 5），树连接与节点值尚未改动。</p><table><caption>当前树的节点连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">cur（值 4）</th><td>3</td><td>6</td></tr><tr><th scope="row">后继节点（值 5）</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>后继节点（值 5）</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>cur（值 4）</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

<a id="source-126"></a>

## 第 3 步：摘除原后继节点

按图示与源码顺序，先递归删除后继节点 nex（5）：因它是叶节点，直接把 6.left 设为空即可摘除。此时仍保留对后继值 5 的访问供下一步赋值，而 cur 的值尚未改写。

<details><summary>本步完整状态</summary><p>删除双子节点 4 的第 3 步（原后继已摘除而 cur 尚未改值）：根为 8，cur 仍位于 8 左侧，cur 仍为 4，左右子节点仍为 3、6；原后继 5 已从 6 左侧摘除，6.left 为空，6.right 为 7。下一状态才把 5 写入 cur。</p><table><caption>当前树的节点连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">cur（值 4）</th><td>3</td><td>6</td></tr><tr><th scope="row">6</th><td>空</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>cur（值 4）</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

<a id="source-127"></a>

## 第 4 步：把后继值写入 cur

在原后继节点摘除后，下一状态把后继值 5 写入 cur，覆盖原值 4。此处改写的仅是 cur 节点中的值，cur 与父节点 8 及左右子节点 3、6 的引用关系保持不变。

<details><summary>本步完整状态</summary><p>删除双子节点 4 的第 4 步（改写 cur 的值）：根为 8，其左子节点 cur 的值已改为 5，左右子节点仍为 3、6；6.left 为空、6.right 为 7。原后继节点已摘除，树中只剩一份值 5。</p><table><caption>当前树的节点连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">cur（值 5）</th><td>3</td><td>6</td></tr><tr><th scope="row">6</th><td>空</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>cur（值 5）</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

## 结果

最终 cur 节点的值由 4 改为 5，其父节点 8 和左右子节点 3、6 的引用关系保持不变；原先位于 6 左侧的后继节点已摘除，6.left 为空。树中只保留一份值 5，不再包含值 4。
