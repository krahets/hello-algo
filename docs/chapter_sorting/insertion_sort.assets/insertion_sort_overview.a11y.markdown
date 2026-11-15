<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: bac88fef234cbdc9921fc1ffff3aa2951d9faae5b9c0caefeccfdea0e62e0f25 -->

# 插入排序逐轮过程

从初始已排序区间 \[0, 0\] 出发，五轮依次将基准元素 1、3、1、5、2 插入左侧有序前缀，最终得到 \[1, 1, 2, 3, 4, 5\]。

## 问题与输入

初始数组为 nums = \[4, 1, 3, 1, 5, 2\]，索引从 0 到 5。仅含首元素 4 的单元素区间天然有序，因此初始“已排序区间”为 \[0, 0\]。

每轮选取有序前缀右侧紧邻的元素作为 base，把大于 base 的元素向右移动，再将 base 写入空出的位置。

## 结构与关系

每轮将下一个元素插入左侧有序前缀，使前缀增加一项。有序前缀只保证内部顺序，后续较小元素插入时，其中的元素仍可能右移。

第三轮插入第二个 1 时，遇到相等的第一个 1 就停止右移，保留二者原有顺序。第四轮的 5 无须移动，但有序前缀仍扩大；第五轮再插入 2，完成排序。

<table><caption>插入排序逐轮状态</caption><thead><tr><th scope="col">时点</th><th scope="col">数组</th><th scope="col">已排序区间</th><th scope="col">下一轮基准值</th></tr></thead><tbody><tr><th scope="row">初始</th><td>[4, 1, 3, 1, 5, 2]</td><td>[0, 0]</td><td>1</td></tr><tr><th scope="row">第 1 轮后</th><td>[1, 4, 3, 1, 5, 2]</td><td>[0, 1]</td><td>3</td></tr><tr><th scope="row">第 2 轮后</th><td>[1, 3, 4, 1, 5, 2]</td><td>[0, 2]</td><td>1</td></tr><tr><th scope="row">第 3 轮后</th><td>[1, 1, 3, 4, 5, 2]</td><td>[0, 3]</td><td>5</td></tr><tr><th scope="row">第 4 轮后</th><td>[1, 1, 3, 4, 5, 2]</td><td>[0, 4]</td><td>2</td></tr><tr><th scope="row">第 5 轮后</th><td>[1, 1, 2, 3, 4, 5]</td><td>[0, 5]</td><td>无，已完成</td></tr></tbody></table>

<a id="source-262"></a>

从单元素有序前缀 \[0, 0\]（值为 4）开始，五轮依次取出右侧紧邻的基准元素 1、3、1、5、2 插入左侧有序前缀；前缀有序仅表示前缀内部相对升序，后续更小元素插入时前缀内较大元素仍会右移。逐轮数组见状态表。

## 结果

经过五轮插入，已排序区间从 \[0, 0\] 逐轮扩展至 \[0, 5\]，最终得到有序且保持相等元素原有顺序的数组 \[1, 1, 2, 3, 4, 5\]。

## 插入排序逐轮过程：动画

从初始已排序区间 \[0, 0\] 出发，五轮依次将基准元素 1、3、1、5、2 插入左侧有序前缀，最终得到 \[1, 1, 2, 3, 4, 5\]。

初始数组为 nums = \[4, 1, 3, 1, 5, 2\]，索引从 0 到 5。仅含首元素 4 的单元素区间天然有序，因此初始“已排序区间”为 \[0, 0\]。

每轮选取有序前缀右侧紧邻的元素作为 base，把大于 base 的元素向右移动，再将 base 写入空出的位置。

每轮将下一个元素插入左侧有序前缀，使前缀增加一项。有序前缀只保证内部顺序，后续较小元素插入时，其中的元素仍可能右移。

第三轮插入第二个 1 时，遇到相等的第一个 1 就停止右移，保留二者原有顺序。第四轮的 5 无须移动，但有序前缀仍扩大；第五轮再插入 2，完成排序。

### 第 1 步：从单元素前缀开始

初始时索引 0 的首元素 4 单独构成有序前缀 \[0, 0\]；下一轮将选取索引 1 的 1 作为基准元素插入前缀。

<details><summary>本步完整状态</summary><p>六元素插入排序尚未开始：索引 0 的 4 构成有序前缀 [0,0]，下一轮基准元素为索引 1 的 1。当前数组见表。</p><table><caption>初始数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">当前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>4</td><td>有序前缀</td></tr><tr><th scope="row">1</th><td>1</td><td>下一轮基准元素</td></tr><tr><th scope="row">2</th><td>3</td><td>尚未处理</td></tr><tr><th scope="row">3</th><td>1</td><td>尚未处理</td></tr><tr><th scope="row">4</th><td>5</td><td>尚未处理</td></tr><tr><th scope="row">5</th><td>2</td><td>尚未处理</td></tr></tbody></table></details>

### 第 2 步：将 1 插入 4 前面

第 1 轮选取索引 1 的 1，将前缀中大于它的 4 向右移到索引 1，再把 1 写入索引 0，有序前缀扩为 \[0, 1\]。

<details><summary>本步完整状态</summary><p>六元素插入排序已完成一轮，有序前缀为 [0,1]，下一轮基准元素为索引 2 的 3。当前数组见表。</p><table><caption>本轮后的数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">当前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>有序前缀</td></tr><tr><th scope="row">1</th><td>4</td><td>有序前缀</td></tr><tr><th scope="row">2</th><td>3</td><td>下一轮基准元素</td></tr><tr><th scope="row">3</th><td>1</td><td>尚未处理</td></tr><tr><th scope="row">4</th><td>5</td><td>尚未处理</td></tr><tr><th scope="row">5</th><td>2</td><td>尚未处理</td></tr></tbody></table></details>

### 第 3 步：将 3 插入 1 与 4 之间

第 2 轮选取索引 2 的 3，仅将前缀中大于 3 的 4 右移到索引 2，再把 3 插入索引 1（位于 1 与 4 之间），有序前缀扩为 \[0, 2\]。

<details><summary>本步完整状态</summary><p>六元素插入排序已完成两轮，有序前缀为 [0,2]，下一轮基准元素为索引 3 的第二个 1。当前数组见表。</p><table><caption>本轮后的数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">当前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>有序前缀</td></tr><tr><th scope="row">1</th><td>3</td><td>有序前缀</td></tr><tr><th scope="row">2</th><td>4</td><td>有序前缀</td></tr><tr><th scope="row">3</th><td>1</td><td>下一轮基准元素</td></tr><tr><th scope="row">4</th><td>5</td><td>尚未处理</td></tr><tr><th scope="row">5</th><td>2</td><td>尚未处理</td></tr></tbody></table></details>

### 第 4 步：将第二个 1 插入第一个 1 后面

第 3 轮选取索引 3 的第二个 1，将前缀中大于 1 的 4 和 3 依次右移；比较到索引 0 相等的第一个 1 时立即停止右移，把第二个 1 插在其后的索引 1，保持相等元素的稳定先后顺序。

<details><summary>本步完整状态</summary><p>六元素插入排序已完成三轮，有序前缀为 [0,3]，两个 1 保持原相对顺序；下一轮基准元素为索引 4 的 5。</p><table><caption>本轮后的数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">当前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>有序前缀</td></tr><tr><th scope="row">1</th><td>1</td><td>有序前缀</td></tr><tr><th scope="row">2</th><td>3</td><td>有序前缀</td></tr><tr><th scope="row">3</th><td>4</td><td>有序前缀</td></tr><tr><th scope="row">4</th><td>5</td><td>下一轮基准元素</td></tr><tr><th scope="row">5</th><td>2</td><td>尚未处理</td></tr></tbody></table></details>

### 第 5 步：将 5 并入有序前缀

第 4 轮选取索引 4 的 5，因 5 大于有序前缀 \[1, 1, 3, 4\] 中的最大元素 4，无须右移任何元素，5 直接原地并入前缀，有序前缀扩为 \[0, 4\]。

<details><summary>本步完整状态</summary><p>六元素插入排序已完成四轮，本轮没有移动元素；有序前缀仍扩大为 [0,4]，下一轮基准元素为索引 5 的 2。</p><table><caption>本轮后的数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">当前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>有序前缀</td></tr><tr><th scope="row">1</th><td>1</td><td>有序前缀</td></tr><tr><th scope="row">2</th><td>3</td><td>有序前缀</td></tr><tr><th scope="row">3</th><td>4</td><td>有序前缀</td></tr><tr><th scope="row">4</th><td>5</td><td>有序前缀</td></tr><tr><th scope="row">5</th><td>2</td><td>下一轮基准元素</td></tr></tbody></table></details>

### 第 6 步：将 2 插入两个 1 后面

第 5 轮选取末尾索引 5 的 2，将前缀中大于 2 的 5、4、3 依次右移一格，再把 2 插入两个 1 之后的索引 2，有序前缀覆盖 \[0, 5\]，排序完成。

<details><summary>本步完整状态</summary><p>六元素插入排序已完成五轮：3、4、5 各向右移动一位，2 已插入索引 2，有序前缀覆盖 [0,5]，排序完成。</p><table><caption>本轮后的数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th><th scope="col">当前作用</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>有序前缀</td></tr><tr><th scope="row">1</th><td>1</td><td>有序前缀</td></tr><tr><th scope="row">2</th><td>2</td><td>有序前缀</td></tr><tr><th scope="row">3</th><td>3</td><td>有序前缀</td></tr><tr><th scope="row">4</th><td>4</td><td>有序前缀</td></tr><tr><th scope="row">5</th><td>5</td><td>有序前缀</td></tr></tbody></table></details>

### 结果

经过五轮插入，已排序区间从 \[0, 0\] 逐轮扩展至 \[0, 5\]，最终得到有序且保持相等元素原有顺序的数组 \[1, 1, 2, 3, 4, 5\]。
