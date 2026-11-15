<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 343cbda3aa4597df0aea12b8fb3575751fc1bb609179709a497d26026b6b1689 -->

# 线性查找

从索引 0 起自左向右逐个比较元素，在索引 2 处命中目标值 3 并返回索引 2。

## 问题与输入

输入数组 nums = \[1, 5, 3, 2, 4, 7, 6, 9, 10, 8\]，索引为 0 至 9（共 10 个元素），查找目标值 target = 3；指针 i 表示当前检查的索引。线性查找不要求数组预先有序。

<table><caption>输入数组</caption><thead><tr><th scope="col">索引</th><th scope="col">元素值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>5</td></tr><tr><th scope="row">2</th><td>3</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>4</td></tr><tr><th scope="row">5</th><td>7</td></tr><tr><th scope="row">6</th><td>6</td></tr><tr><th scope="row">7</th><td>9</td></tr><tr><th scope="row">8</th><td>10</td></tr><tr><th scope="row">9</th><td>8</td></tr></tbody></table>

<table><caption>比较过程</caption><thead><tr><th scope="col">当前索引i</th><th scope="col">nums[i]</th><th scope="col">与目标3比较</th><th scope="col">后续动作</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>不相等</td><td>继续</td></tr><tr><th scope="row">1</th><td>5</td><td>不相等</td><td>继续</td></tr><tr><th scope="row">2</th><td>3</td><td>相等</td><td>返回索引2</td></tr></tbody></table>

<a id="source-502"></a>

图中自上而下并列三排相同的数组，展示同一次查找依次经历的三个时刻：第一排从 i = 0 开始，nums\[0\] = 1 不等于目标 3，指针 i 右移继续遍历；第二排检查 i = 1，nums\[1\] = 5 仍不等于 3，指针继续右移；第三排检查 i = 2，nums\[2\] = 3 等于目标 3，立即返回当前索引 2 并结束查找，后面 7 个元素不再检查。

## 结果

依次比较索引 0、1、2 三个位置后命中目标，返回位置索引 2（而非元素值 3）。后续索引 3 至 9 的七个元素无须继续检查，数组内容始终保持不变。

## 线性查找：动画

从索引 0 起自左向右逐个比较元素，在索引 2 处命中目标值 3 并返回索引 2。

输入数组 nums = \[1, 5, 3, 2, 4, 7, 6, 9, 10, 8\]，索引为 0 至 9（共 10 个元素），查找目标值 target = 3；指针 i 表示当前检查的索引。线性查找不要求数组预先有序。

动画在同一排十元素数组上移动指针 i，数组元素始终保持不变：若当前元素 nums\[i\] 不等于 target，则 i 加 1 继续检查下一项；若相等，则立即返回索引 i 并停止查找。

### 第 1 步：检查索引 0

指针位于起点 i = 0，当前元素 nums\[0\] = 1 不等于目标 3，将 i 右移继续检查索引 1。

<details><summary>本步完整状态</summary><p>目标 target = 3，数组 nums = [1, 5, 3, 2, 4, 7, 6, 9, 10, 8]，索引为 0 至 9。当前检查 i = 0，当前值 1 不等于 3，尚未找到，应继续向右查找。</p></details>

### 第 2 步：检查索引 1

指针移至 i = 1，当前元素 nums\[1\] = 5 仍不等于目标 3，将 i 右移继续检查索引 2。

<details><summary>本步完整状态</summary><p>目标 target = 3，数组 nums = [1, 5, 3, 2, 4, 7, 6, 9, 10, 8]，索引为 0 至 9。索引 0（值 1）已检查未匹配；当前检查 i = 1，当前值 5 不等于 3，尚未找到，应继续向右查找。</p></details>

### 第 3 步：检查索引 2

指针移至 i = 2，当前元素 nums\[2\] = 3 等于目标 3，命中目标，立即返回位置索引 2（而非元素值 3）并停止查找。

<details><summary>本步完整状态</summary><p>目标 target = 3，数组 nums = [1, 5, 3, 2, 4, 7, 6, 9, 10, 8]，索引为 0 至 9。前两项（索引 0、1）均不相等；当前检查 i = 2，当前值 3 等于目标 3，命中并返回索引 2，后续索引 3 至 9 不再检查。</p></details>

### 结果

依次比较索引 0、1、2 三个位置后命中目标，返回位置索引 2（而非元素值 3）。后续索引 3 至 9 的七个元素无须继续检查，数组内容始终保持不变。
