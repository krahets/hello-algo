<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 80c405fe3ee3ff2a308731b161f469cfb11ba41ef2427b6da47d70d2e18ce68f -->

# 二叉搜索树删除单子节点

删除度为 1 的节点时，将父节点指向目标的引用直接改指目标的唯一子节点。

<table><caption>删除单子节点前的连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">2</th><td>空</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table>

<a id="source-123"></a>

删除值 2 时，沿 8 → 4 → 2 找到 cur = 2，父节点 pre = 4。节点 2 左为空、还有右子节点 3，度为 1。不能像删叶节点一样直接把 4.left 设为空，否则会从根断开本应保留的节点 3；应执行 pre.left = cur.right，将 4.left 指向 3。

## 结果

删除后剩余值 3 至 15 保持搜索树顺序。此操作替换的是父子引用，节点 3 保留自身身份并接到节点 4 的左侧，并非改写节点 2 的值。

## 二叉搜索树删除单子节点：动画

删除度为 1 的节点时，将父节点指向目标的引用直接改指目标的唯一子节点。

目标是删除根为 8、初始包含值 2 至 15 的二叉搜索树中的单子节点 2；各状态的完整连接见当前树表。

### 第 1 步：定位目标 2 与父节点 4

目标 2 小于根 8 且小于 4，连续两次向左查找到 cur = 2，pre 保存父节点 4。

<details><summary>本步完整状态</summary><p>删除目标为 2：根为 8，查找路径为 8 → 4 → 2。cur 指向 2，pre 指向 4；2 的左子节点为空、右子节点为叶节点 3，目标尚未删除。</p><table><caption>当前树的节点连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">2</th><td>空</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

### 第 2 步：确认唯一子节点为 3

检查确认目标 2 的度为 1，只有右子节点 3；删除时需把唯一子节点 3 接回父节点 4，才能避免丢失该子树。

<details><summary>本步完整状态</summary><p>删除目标 2 的条件判定状态：待删除节点 2 的度为 1，唯一子节点为 3；pre 指向父节点 4，4.left 仍指向 2，所有连接尚未改变。</p><table><caption>当前树的节点连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">2</th><td>空</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

### 第 3 步：将节点 3 接回父节点

执行 pre.left = cur.right，让父节点 4 的左引用直接指向节点 3，绕过并移除目标 2。

<details><summary>本步完整状态</summary><p>删除单子节点 2 已完成：根为 8，节点 4 的左子节点为叶节点 3、右子节点为 6，其余连接保持不变；树包含值 3 至 15，完整连接见当前树表。</p><table><caption>当前树的节点连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>3</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

### 结果

删除后剩余值 3 至 15 保持搜索树顺序。此操作替换的是父子引用，节点 3 保留自身身份并接到节点 4 的左侧，并非改写节点 2 的值。
