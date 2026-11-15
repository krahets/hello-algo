<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 38f3e2e21d30972c2321f7671695a2cac6562d7d5e87bf062042309eba93f75b -->

# 二叉搜索树删除叶节点

删除度为 0 的叶节点时，没有需要接回的子树，直接清空父节点指向它的引用。

<table><caption>删除叶节点前的连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">1</th><td>空</td><td>空</td></tr><tr><th scope="row">2</th><td>1</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table>

<a id="source-122"></a>

删除值 1 时，从根沿 8 → 4 → 2 → 1 查找到目标，cur 指向 1，pre 指向父节点 2。因目标 1 没有子节点，度为 0，没有需要接回的子树，直接执行 pre.left = None 清空父节点 2 的左引用即可。

## 结果

删除后剩余值 2 至 15，二叉搜索树大小关系保持不变。图中 2 左侧的空位置表示 None 引用，并非新的节点。

## 二叉搜索树删除叶节点：动画

删除度为 0 的叶节点时，没有需要接回的子树，直接清空父节点指向它的引用。

目标是删除根为 8、含值 1 至 15 的二叉搜索树中的叶节点 1。cur 表示待删除目标，pre 表示其父节点；各状态的完整连接见当前树表。

### 第 1 步：定位待删除的叶节点

目标 1 依次小于 8、4、2，沿左分支向下查找到节点 1，并由 pre 保存其父节点 2。

<details><summary>本步完整状态</summary><p>删除目标为 1：根为 8，查找路径为 8 → 4 → 2 → 1。当前 cur 指向 1，pre 指向 2，节点 1 仍在树中。</p><table><caption>当前树的节点连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">1</th><td>空</td><td>空</td></tr><tr><th scope="row">2</th><td>1</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

### 第 2 步：确认目标没有子节点

检查 cur（节点 1）的左右引用均为空，确认目标没有子节点、度为 0，没有需要接回的子树。

<details><summary>本步完整状态</summary><p>删除目标 1 的条件判定状态：节点 1 的左右子节点都为空，度为 0；pre 指向父节点 2，2 的左右子节点仍为 1、3。判定状态尚未删除节点 1，连接尚未改变。</p><table><caption>当前树的节点连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">1</th><td>空</td><td>空</td></tr><tr><th scope="row">2</th><td>1</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

### 第 3 步：清空父节点的左连接

执行 pre.left = None，把父节点 2 的左引用设为空，将叶节点 1 从树中摘除。

<details><summary>本步完整状态</summary><p>删除叶节点 1 已完成：根为 8，父节点 2 的左子节点变为 None（空）、右子节点仍为叶节点 3；当前树表中不再有节点 1，树保留值 2 至 15。</p><table><caption>当前树的节点连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">2</th><td>空</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

### 结果

删除后剩余值 2 至 15，二叉搜索树大小关系保持不变。图中 2 左侧的空位置表示 None 引用，并非新的节点。
