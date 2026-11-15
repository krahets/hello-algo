<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 14afae526f40968ebc9535af75b845a5381035078cacbe1354e3be8be4bfd181 -->

# 循环数组实现双向队列

移动队首索引并维护有效长度，实现不搬移中间元素的双端操作。

## 问题与输入

初始有效队列按队首到队尾为 \[3, 2, 5\]。front 为队首元素索引，size 为有效长度；队尾下次写入索引按 rear = (front + size) % capacity 计算。图中简写为 rear = front + size，未展示跨边界环绕、具体容量及数值下标。

## 结构与关系

入队前须有空位，出队前须非空。队尾入队先按当前 front 与 size 算出 rear 并写入，再令 size 加 1；队首入队先令 front = (front - 1 + capacity) % capacity 左移一格并写入，再令 size 加 1。队尾出队读取尾元素后仅需令 size 减 1；队首出队读取首元素后令 front 前进一格、size 减 1。

有效元素分布在 (front + i) % capacity（i 从 0 到 size - 1）。中间元素 3、2、5 始终留在原槽位无须搬移；出队后槽位画为虚线仅表示退出有效范围，不代表代码将该槽清零。

<a id="source-76"></a>

## 第 1 步：初始双向队列

初始状态下 front 指向队首元素 3，有效长度 size = 3；rear 按当前 front + size 计算，指向队尾 5 右侧的首个空槽。

<details><summary>本步完整状态</summary><p>当前有效队列按队首到队尾为 [3, 2, 5]，front 指向 3，size = 3，rear 指向 5 右侧首个空槽；本图无跨边界环绕，未标具体容量与下标。</p></details>

<a id="source-77"></a>

## 第 2 步：队尾加入4

先按入队前的 front 和 size = 3 算出写入位置 rear，在该槽写入 4，随后将 size 更新为 4。注意图中 rear 箭头仍停留在本次写入 4 的槽位（即本次写入地址）；若按更新后的 size = 4 重新计算 front + size，新的尾后空槽位置应在 4 右侧一格。

<details><summary>本步完整状态</summary><p>执行 push_last(4) 后，当前有效队列为 [3, 2, 5, 4]，front 指向 3，size = 4。图中 rear 箭头指示本次写入 4 的地址；若按新 size = 4 重新计算，尾后写入位置在 4 之后。本图无跨边界环绕，未标具体容量与下标。</p></details>

<a id="source-78"></a>

## 第 3 步：队首加入1

将 front 向左移动一格到 3 左侧的空槽并写入 1，再将 size 从 4 增至 5；原有元素 3、2、5、4 均留在原槽位不动。

<details><summary>本步完整状态</summary><p>执行 push_first(1) 后，当前有效队列为 [1, 3, 2, 5, 4]，front 指向新队首 1，size = 5。本图无跨边界环绕，未标具体容量与下标。</p></details>

<a id="source-79"></a>

## 第 4 步：队尾取出4

读取并返回队尾元素 4，将 size 从 5 减为 4；front 仍指向 1，原存放 4 的槽位直接退出有效范围（画为虚线），其余元素无须搬移。

<details><summary>本步完整状态</summary><p>执行 pop_last() 后，当前有效队列为 [1, 3, 2, 5]，front 指向 1，size = 4，本次返回 4；原 4 所在槽位退出有效范围。本图无跨边界环绕，未标具体容量与下标。</p></details>

<a id="source-80"></a>

## 第 5 步：队首取出1

读取并返回队首元素 1，将 front 向右推进一格重新指向 3，同时将 size 从 4 减为 3；原存放 1 的槽位退出有效范围。

<details><summary>本步完整状态</summary><p>执行 pop_first() 后，当前有效队列恢复为 [3, 2, 5]，front 重新指向 3，size = 3，本次返回 1；原 1 所在槽位退出有效范围。本图无跨边界环绕，未标具体容量与下标。</p></details>

## 结果

连续四次操作后，front 重新指向 3，size 恢复为 3，有效队列恢复为 \[3, 2, 5\]；两端入队和出队均为 O(1)。
