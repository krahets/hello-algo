<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: b6e5fab7466215944d61b585cb27a60614a0f2ff1b1a69a3537211d2ff9ce1d6 -->

# 递归二分查找

在十个递增元素中递归查找 6，搜索区间依次由 \[0, 9\] 缩至 \[0, 3\]、\[2, 3\]，最终返回索引 2。

## 问题与输入

输入有序数组为 \[1, 3, 6, 8, 12, 15, 23, 26, 31, 35\]，索引从 0 到 9，查找目标元素为 6。子问题记号 f(i, j) 表示在双闭区间 \[i, j\] 内搜索目标，中点索引按 m = (i + j) / 2 向下取整计算。

## 结构与关系

首次比较中点值 12，大于目标 6，进入左半区间；接着比较中点值 3，小于目标，进入右半区间；第三次在索引 2 命中 6。

每次只进入一个候选子区间，已排除的位置仍留在原数组中。子问题直接返回找到的索引，无须合并。

<table><caption>固定有序输入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>3</td></tr><tr><th scope="row">2</th><td>6</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>12</td></tr><tr><th scope="row">5</th><td>15</td></tr><tr><th scope="row">6</th><td>23</td></tr><tr><th scope="row">7</th><td>26</td></tr><tr><th scope="row">8</th><td>31</td></tr><tr><th scope="row">9</th><td>35</td></tr></tbody></table>

<table><caption>三次递归调用</caption><thead><tr><th scope="col">调用（闭区间）</th><th scope="col">中点索引 m</th><th scope="col">中点值</th><th scope="col">比较</th><th scope="col">后续</th></tr></thead><tbody><tr><th scope="row">f(0,9)</th><td>4</td><td>12</td><td>12 &gt; 6</td><td>递归调用 f(0,3)</td></tr><tr><th scope="row">f(0,3)</th><td>1</td><td>3</td><td>3 &lt; 6</td><td>递归调用 f(2,3)</td></tr><tr><th scope="row">f(2,3)</th><td>2</td><td>6</td><td>6 = 6</td><td>返回索引 2</td></tr></tbody></table>

<a id="source-312"></a>

三次递归调用依次检查中点值 12、3、6。前两次比较排除不含目标的区间，第三次在索引 2 命中目标 6，直接返回索引。

## 结果

底部文字标出“最终求得元素 6 的索引为 2”。三次递归调用依次比较中点元素 12、3、6，前两次未命中时分别将候选区间由 10 项缩至 4 项、再缩至 2 项，第三次命中后直接返回，原数组内容始终保持不变。

## 递归二分查找：动画

在十个递增元素中递归查找 6，搜索区间依次由 \[0, 9\] 缩至 \[0, 3\]、\[2, 3\]，最终返回索引 2。

输入有序数组为 \[1, 3, 6, 8, 12, 15, 23, 26, 31, 35\]，索引从 0 到 9，查找目标元素为 6。子问题记号 f(i, j) 表示在双闭区间 \[i, j\] 内搜索目标，中点索引按 m = (i + j) / 2 向下取整计算。

首次比较中点值 12，大于目标 6，进入左半区间；接着比较中点值 3，小于目标，进入右半区间；第三次在索引 2 命中 6。

每次只进入一个候选子区间，已排除的位置仍留在原数组中。子问题直接返回找到的索引，无须合并。

<table><caption>固定有序输入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>3</td></tr><tr><th scope="row">2</th><td>6</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>12</td></tr><tr><th scope="row">5</th><td>15</td></tr><tr><th scope="row">6</th><td>23</td></tr><tr><th scope="row">7</th><td>26</td></tr><tr><th scope="row">8</th><td>31</td></tr><tr><th scope="row">9</th><td>35</td></tr></tbody></table>

### 第 1 步：检查中点值 12

在初始闭区间 \[0, 9\] 内计算中点 m = (0 + 9) // 2 = 4，中点值 nums\[4\] = 12。因为 12 &gt; 6，目标只能在左半部分，排除索引 4 至 9，递归调用 f(0, 3)。

<details><summary>本步完整状态</summary><p>当前调用为 f(0, 9)，查找目标为 6；中点索引 m = 4，中点值为 12（12 &gt; 6），下一步进入左子区间 f(0, 3)。输入数组见固定有序输入表。</p><table><caption>当前调用</caption><thead><tr><th scope="col">调用（闭区间）</th><th scope="col">中点索引 m</th><th scope="col">中点值</th><th scope="col">比较</th><th scope="col">后续</th></tr></thead><tbody><tr><th scope="row">f(0,9)</th><td>4</td><td>12</td><td>12 &gt; 6</td><td>递归调用 f(0,3)</td></tr></tbody></table></details>

### 第 2 步：检查中点值 3

在闭区间 \[0, 3\] 内计算中点 m = (0 + 3) // 2 = 1，中点值 nums\[1\] = 3。因为 3 &lt; 6，目标只能在右半部分，排除索引 0 和 1，递归调用 f(2, 3)。

<details><summary>本步完整状态</summary><p>当前调用为 f(0, 3)，查找目标为 6；中点索引 m = 1，中点值为 3（3 &lt; 6），下一步进入右子区间 f(2, 3)。输入数组见固定有序输入表。</p><table><caption>当前调用</caption><thead><tr><th scope="col">调用（闭区间）</th><th scope="col">中点索引 m</th><th scope="col">中点值</th><th scope="col">比较</th><th scope="col">后续</th></tr></thead><tbody><tr><th scope="row">f(0,3)</th><td>1</td><td>3</td><td>3 &lt; 6</td><td>递归调用 f(2,3)</td></tr></tbody></table></details>

### 第 3 步：命中目标值 6

在闭区间 \[2, 3\] 内计算中点 m = (2 + 3) // 2 = 2，中点值 nums\[2\] = 6，恰与目标值相等，命中目标并直接向上返回索引 2，无须合并操作。

<details><summary>本步完整状态</summary><p>当前调用为 f(2, 3)，查找目标为 6；中点索引 m = 2，中点值为 6（6 = 6），命中目标并直接返回索引 2。输入数组见固定有序输入表。</p><table><caption>当前调用</caption><thead><tr><th scope="col">调用（闭区间）</th><th scope="col">中点索引 m</th><th scope="col">中点值</th><th scope="col">比较</th><th scope="col">后续</th></tr></thead><tbody><tr><th scope="row">f(2,3)</th><td>2</td><td>6</td><td>6 = 6</td><td>返回索引 2</td></tr></tbody></table></details>

### 结果

底部文字标出“最终求得元素 6 的索引为 2”。三次递归调用依次比较中点元素 12、3、6，前两次未命中时分别将候选区间由 10 项缩至 4 项、再缩至 2 项，第三次命中后直接返回，原数组内容始终保持不变。
