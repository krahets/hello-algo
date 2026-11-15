<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 99cc329e0f6522821e7ae8a93f128b0b8ba57f534e548dac3af3b1152128d94e -->

# 二分查找最左插入点

在含重复值的有序数组中，遇到 6 仍向左缩小区间，最终返回最左插入索引 2。

## 问题与输入

给定升序数组 \[1, 3, 6, 6, 6, 6, 6, 10, 12, 15\]，索引为 0 至 9，查找目标值 target = 6 的插入点。值 6 连续占据索引 2 至 6；题目要求返回新 6 应插入的索引，使它排在所有已有 6 的最左侧（本算法仅计算并返回插入点索引，不在原数组中实际执行插入搬移）。

指针 i、j 表示双闭搜索区间 \[i, j\] 的左、右边界，中点索引按 m = (i + j) / 2 向下取整计算。当 nums\[m\] &lt; target 时执行 i = m + 1 向右逼近；当 nums\[m\] &gt; target 或 nums\[m\] == target 时均执行 j = m − 1 向左收缩，使指针 j 持续逼近小于 target 的最右元素、指针 i 持续逼近首个大于等于 target 的位置。

## 结构与关系

每轮先计算中点，再移动一个边界。边界刚更新时，图中的 m 仍是上一次的中点，可能留在新区间之外；只有再次计算中点时才更新 m。

找到等于目标值的元素仍须继续向左查找，才能确定所有重复值之前的位置。整个过程只计算插入索引，原数组不变。

<table><caption>固定输入：目标值为 6</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>3</td></tr><tr><th scope="row">2</th><td>6</td></tr><tr><th scope="row">3</th><td>6</td></tr><tr><th scope="row">4</th><td>6</td></tr><tr><th scope="row">5</th><td>6</td></tr><tr><th scope="row">6</th><td>6</td></tr><tr><th scope="row">7</th><td>10</td></tr><tr><th scope="row">8</th><td>12</td></tr><tr><th scope="row">9</th><td>15</td></tr></tbody></table>

<a id="source-226"></a>

## 第 1 步：初始化搜索区间

令左边界 i = 0、右边界 j = 9，双闭搜索区间 \[0, 9\] 覆盖全部 10 个元素。

<details><summary>本步完整状态</summary><p>初始状态：当前 i = 0，j = 9，双闭搜索区间为 [0, 9]，尚未计算中点 m。目标值 target = 6，十元素升序数组见固定输入表。</p><table><caption>当前指针</caption><thead><tr><th scope="col">指针</th><th scope="col">索引</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">i</th><td>0</td><td>左边界；循环结束时返回它</td></tr><tr><th scope="row">j</th><td>9</td><td>右边界</td></tr></tbody></table></details>

<a id="source-227"></a>

## 第 2 步：计算中点 4

对闭区间 \[0, 9\] 计算首轮中点 m = (0 + 9) // 2 = 4，中点元素 nums\[4\] = 6，等于目标值 6。

<details><summary>本步完整状态</summary><p>第 1 轮取中点：当前 i = 0，j = 9，闭区间为 [0, 9]，本轮中点 m = 4（对应 nums[4] = 6，等于目标值 6）。</p><table><caption>当前指针</caption><thead><tr><th scope="col">指针</th><th scope="col">索引</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">i</th><td>0</td><td>左边界；循环结束时返回它</td></tr><tr><th scope="row">j</th><td>9</td><td>右边界</td></tr><tr><th scope="row">m</th><td>4</td><td>本轮中点</td></tr></tbody></table></details>

<a id="source-228"></a>

## 第 3 步：遇到 6，右边界左移

因 nums\[4\] = 6 等于目标值 6，为继续排查左侧是否还有 6 以定位最左插入点，仍执行 j = m − 1 将右边界左移至 3；图中旧中点 m = 4 暂未重算，留在新区间 \[0, 3\] 右侧之外。

<details><summary>本步完整状态</summary><p>第 1 轮收缩区间后：当前 i = 0，j = 3，闭区间缩为 [0, 3]；图中显示的 m = 4 是尚未重算的上一轮旧中点，位于新区间外。</p><table><caption>当前指针</caption><thead><tr><th scope="col">指针</th><th scope="col">索引</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">i</th><td>0</td><td>左边界；循环结束时返回它</td></tr><tr><th scope="row">j</th><td>3</td><td>右边界</td></tr><tr><th scope="row">m</th><td>4</td><td>旧中点，尚未重算</td></tr></tbody></table></details>

<a id="source-229"></a>

## 第 4 步：计算中点 1

对新区间 \[0, 3\] 重新计算中点 m = (0 + 3) // 2 = 1，中点元素 nums\[1\] = 3，小于目标值 6。

<details><summary>本步完整状态</summary><p>第 2 轮取中点：当前 i = 0，j = 3，闭区间为 [0, 3]，重算后本轮中点更新为 m = 1（对应 nums[1] = 3，小于目标值 6）。</p><table><caption>当前指针</caption><thead><tr><th scope="col">指针</th><th scope="col">索引</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">i</th><td>0</td><td>左边界；循环结束时返回它</td></tr><tr><th scope="row">j</th><td>3</td><td>右边界</td></tr><tr><th scope="row">m</th><td>1</td><td>本轮中点</td></tr></tbody></table></details>

<a id="source-230"></a>

## 第 5 步：遇到 3，左边界右移

因 nums\[1\] = 3 小于目标值 6，最左插入点必在右侧，执行 i = m + 1 将左边界右移至 2；图中旧中点 m = 1 暂未重算，留在新区间 \[2, 3\] 左侧之外。

<details><summary>本步完整状态</summary><p>第 2 轮收缩区间后：当前 i = 2，j = 3，闭区间缩为 [2, 3]；图中显示的 m = 1 是尚未重算的上一轮旧中点，位于新区间外。</p><table><caption>当前指针</caption><thead><tr><th scope="col">指针</th><th scope="col">索引</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">i</th><td>2</td><td>左边界；循环结束时返回它</td></tr><tr><th scope="row">j</th><td>3</td><td>右边界</td></tr><tr><th scope="row">m</th><td>1</td><td>旧中点，尚未重算</td></tr></tbody></table></details>

<a id="source-231"></a>

## 第 6 步：计算中点 2

对区间 \[2, 3\] 重新计算中点 m = (2 + 3) // 2 = 2，中点元素 nums\[2\] = 6，再次等于目标值 6。

<details><summary>本步完整状态</summary><p>第 3 轮取中点：当前 i = 2，j = 3，闭区间为 [2, 3]，重算后本轮中点更新为 m = 2（对应 nums[2] = 6，等于目标值 6）。</p><table><caption>当前指针</caption><thead><tr><th scope="col">指针</th><th scope="col">索引</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">i</th><td>2</td><td>左边界；循环结束时返回它</td></tr><tr><th scope="row">j</th><td>3</td><td>右边界</td></tr><tr><th scope="row">m</th><td>2</td><td>本轮中点</td></tr></tbody></table></details>

<a id="source-232"></a>

## 第 7 步：再次遇到 6，区间变空

因 nums\[2\] = 6 等于目标值 6，继续执行 j = m − 1 得 j = 1；此时 i = 2 大于 j = 1，双闭搜索区间变为空区间，满足循环终止条件。

<details><summary>本步完整状态</summary><p>第 3 轮收缩区间后：当前 i = 2，j = 1（i &gt; j，双闭区间为空），图中 m = 2 为尚未清除的旧中点，搜索循环即将结束。</p><table><caption>当前指针</caption><thead><tr><th scope="col">指针</th><th scope="col">索引</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">i</th><td>2</td><td>左边界；循环结束时返回它</td></tr><tr><th scope="row">j</th><td>1</td><td>右边界</td></tr><tr><th scope="row">m</th><td>2</td><td>旧中点，尚未重算</td></tr></tbody></table></details>

<a id="source-233"></a>

## 第 8 步：返回最左插入索引 2

循环因区间为空而结束，返回左边界索引 i = 2，即新 6 应排在所有已有五个 6 最左侧的位置；本算法只计算并返回插入索引，未对原数组执行实际插入或元素搬移。

<details><summary>本步完整状态</summary><p>搜索结束：图中仅保留返回指针 i = 2（j、m 不再显示），表示目标值 6 的最左插入点索引为 2；原十元素数组保持不变，未执行实际插入。</p><table><caption>当前指针</caption><thead><tr><th scope="col">指针</th><th scope="col">索引</th><th scope="col">含义</th></tr></thead><tbody><tr><th scope="row">i</th><td>2</td><td>左边界；循环结束时返回它</td></tr></tbody></table></details>

## 结果

八幅分步画面对应三轮折半比较：依次检查中点 m = 4（值为 6）、m = 1（值为 3）、m = 2（值为 6）。最终当 i = 2、j = 1 时双闭区间为空，跳出循环并返回 i = 2，即所有重复 6 最左侧的插入位置。
