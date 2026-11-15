<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: ceac51edd1954d27012d4fbfb25b0acd5fd3982a2168a3a29da029fc6eb83554 -->

# 冒泡排序逐轮过程

对 \[4, 1, 3, 1, 5, 2\] 连续执行五轮冒泡，依次将 5、4、3、2、1 送到未排序区间最右端，使未排序区间从 \[0, 5\] 缩减至 \[0, 0\]。

## 问题与输入

初始数组为 nums = \[4, 1, 3, 1, 5, 2\]，索引为 0 至 5。每轮冒泡都在当前“未排序区间”内从左至右比较并交换相邻元素，将该区间内的最大元素交换到区间最右端。

## 结构与关系

每轮从左向右比较相邻元素，把剩余区间的最大值送到最右端。右侧已固定的后缀逐轮扩大，后续轮次不再处理它。

第三轮结束时数值已经升序，但本例使用没有提前停止标志的基本版本，仍执行第四、第五轮。最后只剩一个最小元素，无须再比较。

<table><caption>冒泡排序逐轮状态</caption><thead><tr><th scope="col">时点</th><th scope="col">数组</th><th scope="col">本轮就位的最大值</th><th scope="col">剩余区间</th></tr></thead><tbody><tr><th scope="row">初始</th><td>[4, 1, 3, 1, 5, 2]</td><td>无</td><td>[0, 5]</td></tr><tr><th scope="row">第 1 轮后</th><td>[1, 3, 1, 4, 2, 5]</td><td>5</td><td>[0, 4]</td></tr><tr><th scope="row">第 2 轮后</th><td>[1, 1, 3, 2, 4, 5]</td><td>4</td><td>[0, 3]</td></tr><tr><th scope="row">第 3 轮后</th><td>[1, 1, 2, 3, 4, 5]</td><td>3</td><td>[0, 2]</td></tr><tr><th scope="row">第 4 轮后</th><td>[1, 1, 2, 3, 4, 5]</td><td>2</td><td>[0, 1]</td></tr><tr><th scope="row">第 5 轮后</th><td>[1, 1, 2, 3, 4, 5]</td><td>1</td><td>[0, 0]</td></tr></tbody></table>

<a id="source-260"></a>

对 6 元素数组 \[4, 1, 3, 1, 5, 2\] 连续执行五轮基本冒泡：前 3 轮通过相邻交换依次将 5、4、3 送到右侧就位；第 3 轮后数组虽已升序，但基本版本未设提前停止标志，仍继续执行无交换的第 4、第 5 轮。逐轮完整状态见表格。

## 结果

经过五轮冒泡，前五大的元素 5、4、3、2、1 自右向左依次就位，索引 0 仅剩的最小元素 1 自然处于正确位置，得到最终有序数组 \[1, 1, 2, 3, 4, 5\]。

## 冒泡排序逐轮过程：动画

对 \[4, 1, 3, 1, 5, 2\] 连续执行五轮冒泡，依次将 5、4、3、2、1 送到未排序区间最右端，使未排序区间从 \[0, 5\] 缩减至 \[0, 0\]。

初始数组为 nums = \[4, 1, 3, 1, 5, 2\]，索引为 0 至 5。每轮冒泡都在当前“未排序区间”内从左至右比较并交换相邻元素，将该区间内的最大元素交换到区间最右端。

每轮从左向右比较相邻元素，把剩余区间的最大值送到最右端。右侧已固定的后缀逐轮扩大，后续轮次不再处理它。

第三轮结束时数值已经升序，但本例使用没有提前停止标志的基本版本，仍执行第四、第五轮。最后只剩一个最小元素，无须再比较。

### 第 1 步：尚未开始冒泡

尚未开始比较，索引 0 至 5 的全部六个元素 \[4, 1, 3, 1, 5, 2\] 均在首轮未排序区间 \[0, 5\] 内。

<details><summary>本步完整状态</summary><p>六元素冒泡排序尚未开始，待处理区间为 [0,5]，右侧尚无已固定元素。当前数组见表。</p><table><caption>初始数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">当前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>4</td><td>尚未处理</td></tr><tr><th scope="row">1</th><td>1</td><td>尚未处理</td></tr><tr><th scope="row">2</th><td>3</td><td>尚未处理</td></tr><tr><th scope="row">3</th><td>1</td><td>尚未处理</td></tr><tr><th scope="row">4</th><td>5</td><td>尚未处理</td></tr><tr><th scope="row">5</th><td>2</td><td>尚未处理</td></tr></tbody></table></details>

### 第 2 步：最大值 5 就位

第 1 轮在 \[0, 5\] 内从左向右比较并交换，将最大元素 5 送到右端索引 5 就位；下一轮只处理剩余区间 \[0, 4\]。

<details><summary>本步完整状态</summary><p>六元素冒泡排序已完成一轮：最大值 5 固定在索引 5，剩余区间为 [0,4]。当前数组见表。</p><table><caption>本轮后的数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">当前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>本轮后仍在剩余区间</td></tr><tr><th scope="row">1</th><td>3</td><td>本轮后仍在剩余区间</td></tr><tr><th scope="row">2</th><td>1</td><td>本轮后仍在剩余区间</td></tr><tr><th scope="row">3</th><td>4</td><td>本轮后仍在剩余区间</td></tr><tr><th scope="row">4</th><td>2</td><td>本轮后仍在剩余区间</td></tr><tr><th scope="row">5</th><td>5</td><td>已固定</td></tr></tbody></table></details>

### 第 3 步：最大值 4 就位

第 2 轮在 \[0, 4\] 内比较并交换，将该区间最大值 4 送到索引 4 就位；右侧已固定后缀扩为 \[4, 5\]。

<details><summary>本步完整状态</summary><p>六元素冒泡排序已完成两轮：索引 4、5 已固定，剩余区间为 [0,3]。当前数组见表。</p><table><caption>本轮后的数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">当前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>本轮后仍在剩余区间</td></tr><tr><th scope="row">1</th><td>1</td><td>本轮后仍在剩余区间</td></tr><tr><th scope="row">2</th><td>3</td><td>本轮后仍在剩余区间</td></tr><tr><th scope="row">3</th><td>2</td><td>本轮后仍在剩余区间</td></tr><tr><th scope="row">4</th><td>4</td><td>已固定</td></tr><tr><th scope="row">5</th><td>5</td><td>已固定</td></tr></tbody></table></details>

### 第 4 步：最大值 3 就位

第 3 轮在 \[0, 3\] 内将 3 交换到索引 3 就位，此时整列 \[1, 1, 2, 3, 4, 5\] 已呈升序；因基本版本未设提前停止标志，后续仍继续检查剩余区间 \[0, 2\]。

<details><summary>本步完整状态</summary><p>六元素冒泡排序已完成三轮：索引 3 至 5 已固定，剩余区间为 [0,2]。数组已升序，但基本版本仍继续后续轮次。</p><table><caption>本轮后的数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">当前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>本轮后仍在剩余区间</td></tr><tr><th scope="row">1</th><td>1</td><td>本轮后仍在剩余区间</td></tr><tr><th scope="row">2</th><td>2</td><td>本轮后仍在剩余区间</td></tr><tr><th scope="row">3</th><td>3</td><td>已固定</td></tr><tr><th scope="row">4</th><td>4</td><td>已固定</td></tr><tr><th scope="row">5</th><td>5</td><td>已固定</td></tr></tbody></table></details>

### 第 5 步：无须交换，确认 2 就位

第 4 轮遍历剩余区间 \[0, 2\]，相邻元素均已满足升序故未发生任何交换，确认索引 2 的 2 就位；剩余区间缩为 \[0, 1\]。

<details><summary>本步完整状态</summary><p>六元素冒泡排序已完成四轮，本轮无交换：索引 2 至 5 已固定，剩余区间为 [0,1]。当前数组见表。</p><table><caption>本轮后的数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">当前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>本轮后仍在剩余区间</td></tr><tr><th scope="row">1</th><td>1</td><td>本轮后仍在剩余区间</td></tr><tr><th scope="row">2</th><td>2</td><td>已固定</td></tr><tr><th scope="row">3</th><td>3</td><td>已固定</td></tr><tr><th scope="row">4</th><td>4</td><td>已固定</td></tr><tr><th scope="row">5</th><td>5</td><td>已固定</td></tr></tbody></table></details>

### 第 6 步：无须交换，完成排序

第 5 轮检查 \[0, 1\] 中的两个 1，同样无须交换，索引 1 的 1 确认就位；剩余区间 \[0, 0\] 只剩一个最小元素 1，无须再比较，五轮冒泡全部完成。

<details><summary>本步完整状态</summary><p>六元素冒泡排序已完成五轮，本轮无交换。剩余区间 [0,0] 只有一个最小元素，无须再比较，排序完成。</p><table><caption>本轮后的数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">当前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>仅剩一个元素，无须再排</td></tr><tr><th scope="row">1</th><td>1</td><td>已固定</td></tr><tr><th scope="row">2</th><td>2</td><td>已固定</td></tr><tr><th scope="row">3</th><td>3</td><td>已固定</td></tr><tr><th scope="row">4</th><td>4</td><td>已固定</td></tr><tr><th scope="row">5</th><td>5</td><td>已固定</td></tr></tbody></table></details>

### 结果

经过五轮冒泡，前五大的元素 5、4、3、2、1 自右向左依次就位，索引 0 仅剩的最小元素 1 自然处于正确位置，得到最终有序数组 \[1, 1, 2, 3, 4, 5\]。
