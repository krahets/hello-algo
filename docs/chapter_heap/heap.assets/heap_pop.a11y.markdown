<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 0aecec1c725d969af6bddde68fcbda601637099a9eafe60d516a977bfab64b0d -->

# 大顶堆弹出堆顶

先交换堆顶 9 与堆底 5，弹出末尾的 9，再让新根 5 依次与较大子节点 8、7、6 交换下沉，恢复大顶堆性质。

## 问题与输入

初始大顶堆包含 13 个元素，按层序存为数组 \[9, 8, 7, 6, 7, 6, 2, 1, 4, 3, 6, 2, 5\]。根节点（索引 0）为全堆最大值 9，最右叶节点（索引 12）为堆底元素 5。大顶堆要求任意父节点的值不小于其子节点的值。

树和数组表示同一份存储，数组按层序排列，索引从0开始。非根位置i的父索引为⌊(i−1)/2⌋，左右子索引为2i+1、2i+2，越界表示该子节点不存在。相等数值用当前位置索引区分。

## 结构与关系

出堆时先将堆顶（索引 0）与末尾元素（索引 12）交换，再从数组末尾删除原堆顶，从而避免直接删除首项引起后续元素整体前移。随后从根节点开始自顶向下堆化：每步在当前节点及其左、右子节点中选出最大值；若子节点更大，则与较大的那个子节点交换——只有将较大的子节点换作父节点，才能保证上移后的新父节点同时不小于另一个子节点。当当前节点已不小于子节点或到达叶节点时停止下沉。

<a id="source-152"></a>

## 第 1 步：定位堆顶9与堆底5

待弹出的最大值 9 位于堆顶索引 0，最右叶节点 5 位于数组末尾索引 12。准备先将首尾两项交换，再从末尾移除 9。

<details><summary>本步完整状态</summary><p>当前堆存储共 13 项（索引 0 至 12），堆顶索引 0 为待弹出的 9，末尾索引 12 为待换到根部的 5，尚未交换与删除。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>9</td><td>待弹出的9</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>5</td><td>本次下沉的5</td></tr></tbody></table></details>

<a id="source-153"></a>

## 第 2 步：交换首尾元素

将索引 0 的 9 与索引 12 的 5 交换位置：5 移至根节点索引 0，9 移至数组末尾索引 12。注意此状态仍保留 13 个元素，末尾的 9 尚未弹出删除，下一状态才执行删除。

<details><summary>本步完整状态</summary><p>当前堆存储仍为 13 项（索引 0 至 12）：首尾交换后根索引 0 变为 5，原堆顶 9 位于末尾索引 12（尚未删除）。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr><tr><th scope="row">12</th><td>9</td><td>待弹出的9</td></tr></tbody></table></details>

<a id="source-154"></a>

## 第 3 步：从末尾删除9

从数组末尾（原索引 12）删除 9 并保存为出堆返回值，堆长度缩减为 12 项（索引 0 至 11）。移除最右叶节点后仍保持完全二叉树的结构性质，但根索引 0 的 5 小于子节点，需要自顶向下下沉修复。

<details><summary>本步完整状态</summary><p>原堆顶 9 已从末尾删除；当前堆存储缩为 12 项（索引 0 至 11），根索引 0 为待下沉的 5。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-155"></a>

## 第 4 步：比较根5与子节点

比较根索引 0 的 5 与其左子节点（索引 1 的 8）、右子节点（索引 2 的 7）：三者中最大的是索引 1 的 8，需将 5 与较大子节点 8 交换。本状态仅比较，尚未交换。

<details><summary>本步完整状态</summary><p>当前堆存储共 12 项（索引 0 至 11）；正比较根索引 0 的 5 与左子索引 1 的 8、右子索引 2 的 7（最大为索引 1 的 8，尚未交换）。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">1</th><td>8</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-156"></a>

## 第 5 步：交换索引0与1

执行第一次下沉交换：索引 0 的 5 与索引 1 的较大子节点 8 互换，8 升为新堆顶（且大于右子索引 2 的 7），5 下沉至索引 1。随后继续检查索引 1 的子节点。

<details><summary>本步完整状态</summary><p>当前堆存储共 12 项（索引 0 至 11），堆顶索引 0 已更新为 8；第一次下沉后 5 位于索引 1（其左、右子为索引 3 的 6 和索引 4 的 7）。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>8</td><td>—</td></tr><tr><th scope="row">1</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-157"></a>

## 第 6 步：比较索引1的子节点

索引 1 的 5 有左子节点（索引 3 的 6）和右子节点（索引 4 的 7）。比较 5、6、7，最大的是索引 4 的 7，应与索引 4 交换（根右侧索引 2 的另一个 7 不在当前子树路径上）。本状态尚未交换。

<details><summary>本步完整状态</summary><p>当前堆存储共 12 项（索引 0 至 11），堆顶索引 0 为 8；5 位于索引 1，正与其左子索引 3 的 6、右子索引 4 的 7 比较（最大为索引 4 的 7，尚未交换）。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>8</td><td>—</td></tr><tr><th scope="row">1</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>7</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-158"></a>

## 第 7 步：交换索引1与4

执行第二次下沉交换：索引 1 的 5 与索引 4 的 7 互换，7 上移至索引 1，5 下沉至索引 4。此时索引 4 的左、右子节点分别为索引 9 的 3 和索引 10 的 6。

<details><summary>本步完整状态</summary><p>当前堆存储共 12 项（索引 0 至 11），堆顶索引 0 为 8；第二次下沉后，索引 1 为 7，5 位于索引 4（其左、右子为索引 9 的 3 和索引 10 的 6）。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>8</td><td>—</td></tr><tr><th scope="row">1</th><td>7</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-159"></a>

## 第 8 步：比较索引4的子节点

比较索引 4 的 5 与其左子节点（索引 9 的 3）、右子节点（索引 10 的 6）：三者中最大的是索引 10 的 6，仍需继续下沉。本状态仅比较，尚未交换。

<details><summary>本步完整状态</summary><p>当前堆存储共 12 项（索引 0 至 11），堆顶索引 0 为 8；5 位于索引 4，正与其左子索引 9 的 3、右子索引 10 的 6 比较（最大为索引 10 的 6，尚未交换）。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>8</td><td>—</td></tr><tr><th scope="row">1</th><td>7</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>6</td><td>—</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-160"></a>

## 第 9 步：交换索引4与10

执行第三次下沉交换：索引 4 的 5 与索引 10 的 6 互换，6 上移至索引 4，5 下沉至叶节点索引 10。索引 10 的左、右子索引（21、22）均越界，已无子节点，下沉过程停止。

<details><summary>本步完整状态</summary><p>当前堆存储共 12 项（索引 0 至 11），堆顶索引 0 为 8；第三次下沉后，索引 4 为 6，5 到达叶节点索引 10（无子节点）。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>8</td><td>—</td></tr><tr><th scope="row">1</th><td>7</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>6</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

<a id="source-161"></a>

## 第 10 步：出堆完成

移除高亮，剩余 12 个元素已全部恢复大顶堆性质：堆顶索引 0 为 8，元素 5 经 0 → 1 → 4 → 10 三次下沉停在索引 10，整个出堆操作返回先前删除的最大值 9。

<details><summary>本步完整状态</summary><p>出堆完成，返回值为 9；当前堆存储共 12 项（索引 0 至 11），新堆顶索引 0 为 8，下沉元素 5 最终位于索引 10。完整数组见当前状态表；树按层序对应数组索引，左右子索引为 2i+1、2i+2（越界即无子节点）。</p><table><caption>当前堆的完整层序存储</caption><thead><tr><th scope="col">数组索引</th><th scope="col">值</th><th scope="col">本次操作中的身份</th></tr></thead><tbody><tr><th scope="row">0</th><td>8</td><td>—</td></tr><tr><th scope="row">1</th><td>7</td><td>—</td></tr><tr><th scope="row">2</th><td>7</td><td>—</td></tr><tr><th scope="row">3</th><td>6</td><td>—</td></tr><tr><th scope="row">4</th><td>6</td><td>—</td></tr><tr><th scope="row">5</th><td>6</td><td>—</td></tr><tr><th scope="row">6</th><td>2</td><td>—</td></tr><tr><th scope="row">7</th><td>1</td><td>—</td></tr><tr><th scope="row">8</th><td>4</td><td>—</td></tr><tr><th scope="row">9</th><td>3</td><td>—</td></tr><tr><th scope="row">10</th><td>5</td><td>本次下沉的5</td></tr><tr><th scope="row">11</th><td>2</td><td>—</td></tr></tbody></table></details>

## 结果

出堆操作返回原堆顶最大值 9。剩余 12 个元素的层序数组恢复为 \[8, 7, 7, 6, 6, 6, 2, 1, 4, 3, 5, 2\]，新堆顶为 8。元素 5 从根索引 0 依次经索引 1、4 下沉至叶节点索引 10，共执行三次向下交换后重新满足大顶堆条件。
