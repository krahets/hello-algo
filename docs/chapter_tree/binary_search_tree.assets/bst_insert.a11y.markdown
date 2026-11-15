<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: f0f0f68b1adc37f6f1bba051b615dc716eafdb9f698fce1626d6179a9a450444 -->

# 二叉搜索树插入节点

沿大小比较向下查找到空引用位置，再由父节点指针 pre 将新叶节点接入树中。

## 问题与输入

本书二叉搜索树不存重复值；每个节点的左子树所有值小于该节点值，右子树所有值大于该节点值。

<table><caption>插入前的节点连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">1</th><td>空</td><td>空</td></tr><tr><th scope="row">2</th><td>1</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table>

<a id="source-117"></a>

插入 16 时，它依次大于 8、12、14、15，沿这四节点向右查找，直到 cur 到达空位置 None，pre 保存最后一个非空节点 15。创建新节点 16 后执行 pre.right = 新节点，将它接为 15 的右子节点。

## 结果

插入后树含值 1 至 16，仍满足搜索树大小关系。pre 保存最后一个非空节点 15，才能在 cur 为 None 后把它的右指针接到新节点 16。

## 二叉搜索树插入节点：动画

沿大小比较向下查找到空引用位置，再由父节点指针 pre 将新叶节点接入树中。

本书二叉搜索树不存重复值；每个节点的左子树所有值小于该节点值，右子树所有值大于该节点值。

目标是向根为 8、包含值 1 至 15 的二叉搜索树插入 16；每个状态的完整节点连接可查阅当前树表。

### 第 1 步：找到空的右子位置

待插入值 16 依次大于路径上的 8、12、14、15，每次比较均向右前进。当 cur 变成 None 时，pre 仍保存最后一个非空节点 15，用来接入新节点。

<details><summary>本步完整状态</summary><p>向根为 8、含值 1 至 15 的树插入 16：查找路径为 8 → 12 → 14 → 15 → None。当前 pre 指向 15，cur 为 None，新节点 16 尚未加入；各节点连接见当前树表。</p><table><caption>当前树的节点连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">1</th><td>空</td><td>空</td></tr><tr><th scope="row">2</th><td>1</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

### 第 2 步：接入新叶节点 16

创建值为 16 的新节点，令 pre.right 指向它；因 16 大于沿途所有祖先节点值，接在 15 右侧后全树继续满足二叉搜索树大小关系。

<details><summary>本步完整状态</summary><p>向根为 8 的树插入 16 已完成：pre 指向 15，14 的左右子节点为 13、15，15 的左子节点为空、右子节点为新叶节点 16；其余原连接保持不变，完整连接见当前树表。</p><table><caption>当前树的节点连接</caption><thead><tr><th scope="col">节点</th><th scope="col">左子节点</th><th scope="col">右子节点</th></tr></thead><tbody><tr><th scope="row">1</th><td>空</td><td>空</td></tr><tr><th scope="row">2</th><td>1</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>16</td></tr><tr><th scope="row">16</th><td>空</td><td>空</td></tr></tbody></table></details>

### 结果

插入后树含值 1 至 16，仍满足搜索树大小关系。pre 保存最后一个非空节点 15，才能在 cur 为 None 后把它的右指针接到新节点 16。
