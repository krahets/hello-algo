<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: af3fc927196647b2d9a5c6b5adae1825520d8f32cacd76150719cd0d604b03cc -->

# 用小顶堆寻找 Top-k

保留至多k个候选，用其中最小值与后续元素比较，淘汰较小候选，得到最大的k个值。

## 问题与输入

输入 nums=\[1,7,6,3,2\]，k=3，目标是找出最大的三个元素。指针i是输入索引；heap是小顶堆的层序数组，索引0为堆顶，存放堆内最小值。

先将前k个输入依次入堆。之后每次把当前值与堆顶比较：当前值更大，才先弹出堆顶再加入当前值；否则跳过。替换中的弹出状态暂时只有k−1项，不代表算法已完成这一轮。

## 结构与关系

堆顶是候选中最小的值。新值超过它时，淘汰堆顶不会丢掉已处理范围内最大的k个值；替换完成后仍保留k个候选。查看堆顶只需O(1)，入堆或出堆调整为O(log k)。

<table><caption>输入数组与索引</caption><thead><tr><th scope="col">输入索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>7</td></tr><tr><th scope="row">2</th><td>6</td></tr><tr><th scope="row">3</th><td>3</td></tr><tr><th scope="row">4</th><td>2</td></tr></tbody></table>

<a id="source-164"></a>

## 第 1 步：将1加入空堆

初始化阶段（前 k=3 个元素直接入堆）：读取输入索引 i=0 的元素 1 加入空堆，成为首个候选。

<details><summary>本步完整状态</summary><p>输入 nums=[1,7,6,3,2]，k=3。当前指针 i=0（值 1）；小顶堆现有 1 项 [1]，堆顶索引 0 为 1。完整候选与来源索引见当前状态表；堆数组按层序表示，根在索引 0，左右子节点在索引 1、2（若存在）。</p><table><caption>当前小顶堆候选</caption><thead><tr><th scope="col">堆数组索引</th><th scope="col">值</th><th scope="col">来自输入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>0</td></tr></tbody></table></details>

<a id="source-165"></a>

## 第 2 步：将7入堆

读取输入索引 i=1 的元素 7 入堆，挂在堆索引 1；父节点堆顶为 1（1 &lt; 7），满足小顶堆条件，无须上浮。

<details><summary>本步完整状态</summary><p>输入 nums=[1,7,6,3,2]，k=3。当前指针 i=1（值 7）；小顶堆现有 2 项 [1, 7]，堆顶索引 0 为 1。完整候选与来源索引见当前状态表；堆数组按层序表示，根在索引 0，左右子节点在索引 1、2（若存在）。</p><table><caption>当前小顶堆候选</caption><thead><tr><th scope="col">堆数组索引</th><th scope="col">值</th><th scope="col">来自输入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>0</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr></tbody></table></details>

<a id="source-166"></a>

## 第 3 步：将6入堆，初始候选齐备

读取输入索引 i=2 的元素 6 入堆，挂在堆索引 2；堆顶仍为最小候选 1。至此输入前 k=3 项已全部入堆，接下来遍历后续元素并与堆顶比较。

<details><summary>本步完整状态</summary><p>输入 nums=[1,7,6,3,2]，k=3。当前指针 i=2（值 6）；小顶堆已满 3 项 [1, 7, 6]，堆顶索引 0 为最小候选 1。完整候选与来源索引见当前状态表；堆数组按层序表示，根在索引 0，左右子节点在索引 1、2（若存在）。</p><table><caption>当前小顶堆候选</caption><thead><tr><th scope="col">堆数组索引</th><th scope="col">值</th><th scope="col">来自输入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>0</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr><tr><th scope="row">2</th><td>6</td><td>2</td></tr></tbody></table></details>

<a id="source-167"></a>

## 第 4 步：比较当前3与堆顶1

指针移至输入索引 i=3，当前元素 3 大于堆顶最小候选 1，说明 1 不属于前三大元素，需弹出 1 并换入 3。本状态仅比较，小顶堆仍为 3 项 \[1, 7, 6\]。

<details><summary>本步完整状态</summary><p>输入 nums=[1,7,6,3,2]，k=3。当前指针 i=3（值 3），正与堆顶 1 比较（3 &gt; 1，待替换）；小顶堆仍为 3 项 [1, 7, 6]，堆顶索引 0 为 1。完整候选与来源索引见当前状态表；堆数组按层序表示，根在索引 0，左右子节点在索引 1、2（若存在）。</p><table><caption>当前小顶堆候选</caption><thead><tr><th scope="col">堆数组索引</th><th scope="col">值</th><th scope="col">来自输入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>0</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr><tr><th scope="row">2</th><td>6</td><td>2</td></tr></tbody></table></details>

<a id="source-168"></a>

## 第 5 步：弹出旧堆顶1

替换分两步进行：先弹出旧堆顶 1，堆内剩余两项重新调整为 \[6, 7\]，6 成为暂时的堆顶。此时堆中暂时只有 k−1=2 个候选，并非漏掉结果，而是替换的中间状态；当前元素 3 紧接着在下一状态入堆，完成后即恢复 3 项。

<details><summary>本步完整状态</summary><p>输入 nums=[1,7,6,3,2]，k=3。当前指针 i=3（值 3 尚待入堆）；旧堆顶 1 已弹出，小顶堆处于暂时 k−1=2 项的替换中间态 [6, 7]，堆顶索引 0 暂为 6。完整候选与来源索引见当前状态表；堆数组按层序表示，根在索引 0，左右子节点在索引 1、2（若存在）。</p><table><caption>当前小顶堆候选</caption><thead><tr><th scope="col">堆数组索引</th><th scope="col">值</th><th scope="col">来自输入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>6</td><td>2</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr></tbody></table></details>

<a id="source-169"></a>

## 第 6 步：将3入堆

将输入索引 i=3 的元素 3 加入小顶堆并上浮至根部，堆数组变为 \[3, 7, 6\]，3 成为新堆顶。此时已恢复 k=3 个候选，保存着前 4 个输入中的最大三个值。

<details><summary>本步完整状态</summary><p>输入 nums=[1,7,6,3,2]，k=3。当前指针 i=3（值 3 已入堆）；小顶堆恢复 3 项 [3, 7, 6]，新堆顶索引 0 为 3。完整候选与来源索引见当前状态表；堆数组按层序表示，根在索引 0，左右子节点在索引 1、2（若存在）。</p><table><caption>当前小顶堆候选</caption><thead><tr><th scope="col">堆数组索引</th><th scope="col">值</th><th scope="col">来自输入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td><td>3</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr><tr><th scope="row">2</th><td>6</td><td>2</td></tr></tbody></table></details>

<a id="source-170"></a>

## 第 7 步：比较当前2与堆顶3

指针移至末尾输入索引 i=4，当前元素 2 小于堆顶最小候选 3，无法淘汰堆内任何候选。本状态仅展示比较。

<details><summary>本步完整状态</summary><p>输入 nums=[1,7,6,3,2]，k=3。当前指针 i=4（值 2），正与堆顶 3 比较（2 &lt; 3，不满足替换条件）；小顶堆仍为 3 项 [3, 7, 6]，堆顶索引 0 为 3。完整候选与来源索引见当前状态表；堆数组按层序表示，根在索引 0，左右子节点在索引 1、2（若存在）。</p><table><caption>当前小顶堆候选</caption><thead><tr><th scope="col">堆数组索引</th><th scope="col">值</th><th scope="col">来自输入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td><td>3</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr><tr><th scope="row">2</th><td>6</td><td>2</td></tr></tbody></table></details>

<a id="source-171"></a>

## 第 8 步：跳过2

由于 2 小于堆顶 3，直接跳过该元素，不执行出堆或入堆操作，堆内三个候选 \[3, 7, 6\] 保持不变。至此全部输入元素遍历完毕。

<details><summary>本步完整状态</summary><p>输入 nums=[1,7,6,3,2]，k=3。当前指针 i=4（值 2 被跳过）；小顶堆保持 3 项 [3, 7, 6]，堆顶索引 0 为 3。完整候选与来源索引见当前状态表；堆数组按层序表示，根在索引 0，左右子节点在索引 1、2（若存在）。</p><table><caption>当前小顶堆候选</caption><thead><tr><th scope="col">堆数组索引</th><th scope="col">值</th><th scope="col">来自输入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td><td>3</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr><tr><th scope="row">2</th><td>6</td><td>2</td></tr></tbody></table></details>

<a id="source-172"></a>

## 第 9 步：返回三个候选

遍历结束，直接返回小顶堆层序数组 \[3, 7, 6\]（堆索引 0 为输入索引 3 的 3，堆索引 1 为输入索引 1 的 7，堆索引 2 为输入索引 2 的 6）。该结果只要求满足小顶堆父节点不大于子节点的堆序性质，左、右子节点 7 和 6 无须按升序排列。

<details><summary>本步完整状态</summary><p>输入 nums=[1,7,6,3,2]，k=3。遍历已结束，无当前指针；返回最终小顶堆 [3, 7, 6]（共 3 项，堆顶索引 0 为 3，索引 1 为 7，索引 2 为 6，呈小顶堆序而非升序）。完整候选与来源索引见当前状态表；堆数组按层序表示，根在索引 0，左右子节点在索引 1、2（若存在）。</p><table><caption>当前小顶堆候选</caption><thead><tr><th scope="col">堆数组索引</th><th scope="col">值</th><th scope="col">来自输入索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td><td>3</td></tr><tr><th scope="row">1</th><td>7</td><td>1</td></tr><tr><th scope="row">2</th><td>6</td><td>2</td></tr></tbody></table></details>

## 结果

遍历完成后直接返回小顶堆数组 heap = \[3, 7, 6\]，即原数组中最大的三个元素（堆数组仅满足小顶堆父子关系，左、右子节点 7 和 6 无须按升序排列）。堆容量不超过 k，空间复杂度为 O(k)，总时间复杂度为 O(n log k)。
