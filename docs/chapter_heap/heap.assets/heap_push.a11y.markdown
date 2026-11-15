<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: abeacf72e82d7fc39efa2d850bb664600d8a0d0c7d88c006258dc04592113c56 -->

# 大顶堆插入元素

将新元素 7 追加到数组末尾（索引 12），沿父节点路径依次与索引 5 的 5、索引 2 的 6 交换，比较根节点 9 后停止上浮。

## 问题与输入

初始大顶堆包含 12 个元素，按层序存为数组 \[9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2\]，索引从 0 到 11；右上角标题标明本次操作为“节点 7 入堆”。注意初始堆的索引 4 处已有一个值为 7 的节点，本次入堆并上浮的是新追加的另一个 7。

树和数组表示同一份存储，数组按层序排列，索引从0开始。非根位置i的父索引为⌊(i−1)/2⌋，左右子索引为2i+1、2i+2，越界表示该子节点不存在。相等数值用当前位置索引区分。

## 结构与关系

入堆先将新元素追加到层序数组末尾以保持完全二叉树形状，再沿父节点路径自底向上上浮修复：仅当当前节点值大于父节点值时才与父节点交换；一旦不大于父节点或已到达根节点，立即停止上浮。本例新插入的 7 经索引 12 → 5 → 2 共交换两次。

<a id="source-143"></a>

## 第 1 步：准备插入新的7

待入堆的新元素 7 尚在堆外。注意原堆索引 4 处已有一个值为 7 的节点（索引 1 节点 8 的右子节点），它与本次待插入的新 7 是两个不同元素。

<details><summary>本步完整状态</summary><p>当前堆存储共 12 项（索引 0 至 11），堆顶索引 0 为 9；原有的 7 位于索引 4，待插入的新 7 尚在堆外。完整数组见当前状态表；树按层序对应数组索引，非根索引 i 的父索引为 ⌊(i−1)/2⌋，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>6</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>5</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-144"></a>

## 第 2 步：将7追加到末尾

将新 7 追加到数组末尾索引 12，在树中挂为索引 5（值为 5）的右子节点。完全二叉树结构已就绪，但 7 &gt; 5，需向上修复。

<details><summary>本步完整状态</summary><p>当前堆存储增至 13 项（索引 0 至 12），堆顶索引 0 为 9；本次新插入的 7 位于末尾索引 12（父节点为索引 5 的 5），原有的 7 仍在索引 4。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>6</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>5</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>7</td><td>本次新插入的7</td></tr></tbody></table></details>

<a id="source-145"></a>

## 第 3 步：比较索引12与5

将索引 12 的新 7 与其父节点（索引 5 的 5）比较：7 &gt; 5，违反大顶堆父节点不小于子节点的条件，需要向上交换。本状态仅展示比较，尚未交换。

<details><summary>本步完整状态</summary><p>当前堆存储共 13 项（索引 0 至 12），堆顶索引 0 为 9；正比较索引 12 的新 7 与父节点索引 5 的 5（尚未交换），原有的 7 仍在索引 4。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>6</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>5</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>7</td><td>本次新插入的7</td></tr></tbody></table></details>

<a id="source-146"></a>

## 第 4 步：交换索引12与5

执行第一次上浮交换：索引 12 的新 7 与索引 5 的 5 互换位置，新 7 上浮至索引 5，原值 5 下移至索引 12（原有的 7 仍在索引 4）。随后继续向新 7 的上一层父节点检查。

<details><summary>本步完整状态</summary><p>当前堆存储共 13 项（索引 0 至 12），堆顶索引 0 为 9；第一次交换后，新 7 位于索引 5，被换下的 5 位于索引 12，原有的 7 仍在索引 4。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>6</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>7</td><td>本次新插入的7</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>5</td><td>—</td></tr></tbody></table></details>

<a id="source-147"></a>

## 第 5 步：比较索引5与2

新 7 现位于索引 5，其父节点为索引 2 的 6。比较得 7 &gt; 6，仍不满足大顶堆条件，需继续上浮；本状态仅比较，尚未交换。

<details><summary>本步完整状态</summary><p>当前堆存储共 13 项（索引 0 至 12），堆顶索引 0 为 9；正比较索引 5 的新 7 与父节点索引 2 的 6（尚未交换），原有的 7 仍在索引 4。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>6</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>7</td><td>本次新插入的7</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>5</td><td>—</td></tr></tbody></table></details>

<a id="source-148"></a>

## 第 6 步：交换索引5与2

执行第二次上浮交换：索引 5 的新 7 与索引 2 的 6 互换位置，新 7 上浮至索引 2，原值 6 下移至索引 5。接下来继续与根节点比较。

<details><summary>本步完整状态</summary><p>当前堆存储共 13 项（索引 0 至 12），堆顶索引 0 为 9；第二次交换后，新 7 位于索引 2，被换下的 6 位于索引 5，原有的 7 仍在索引 4。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>本次新插入的7</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>5</td><td>—</td></tr></tbody></table></details>

<a id="source-149"></a>

## 第 7 步：比较索引2与根

新 7 现位于索引 2，其父节点为根节点（索引 0 的 9）。比较得父节点 9 &gt; 7，已满足大顶堆父节点不小于子节点的条件，无须再交换；原有索引 4 的 7 全程未移动。

<details><summary>本步完整状态</summary><p>当前堆存储共 13 项（索引 0 至 12），堆顶索引 0 为 9；正比较索引 2 的新 7 与根节点索引 0 的 9（9 &gt; 7，满足堆序），原有的 7 仍在索引 4。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>本次新插入的7</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>5</td><td>—</td></tr></tbody></table></details>

<a id="source-150"></a>

## 第 8 步：停止上浮

由于根节点 9 大于索引 2 的新 7，无须交换，新 7 的上浮过程在此终止；位于左子树索引 4 的原有 7 全程保持不动。

<details><summary>本步完整状态</summary><p>当前堆存储共 13 项（索引 0 至 12），堆顶索引 0 为 9；新 7 定位于索引 2 并停止上浮，原有的 7 仍在索引 4。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>本次新插入的7</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>5</td><td>—</td></tr></tbody></table></details>

<a id="source-151"></a>

## 第 9 步：插入完成

移除比较高亮，全堆 13 个元素已恢复大顶堆性质：新 7 经 12 → 5 → 2 两次交换后留在索引 2，原有 7 仍在索引 4，入堆操作结束。

<details><summary>本步完整状态</summary><p>入堆完成，当前堆存储共 13 项（索引 0 至 12），堆顶索引 0 为 9；新 7 最终位于索引 2，原有的 7 位于索引 4，末尾索引 12 为 5。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>—</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>本次新插入的7</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>原有的7</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>5</td><td>—</td></tr></tbody></table></details>

## 结果

入堆完成后，大顶堆共有 13 个元素，层序数组更新为 \[9, 8, 7, 6, 7, 6, 2, 1, 4, 3, 6, 2, 5\]。新插入的 7 从索引 12 经索引 5 上浮至索引 2（共交换两次），原有的索引 4 节点 7 未发生移动，堆顶仍为 9。
