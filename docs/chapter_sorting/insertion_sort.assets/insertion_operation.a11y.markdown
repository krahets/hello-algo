<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 1275863e9052ff40453db6c68514e996bf1971dbc6a19631260f91b9a32de940 -->

# 插入一个元素：暂存、右移与写回

先保存末尾的 3，再把 5、4 各向右复制一格，最后将 3 写入索引 3。

## 问题与输入

输入数组为 nums = \[1, 1, 2, 4, 5, 3\]（索引 0 至 5），其中左侧前五个元素 \[1, 1, 2, 4, 5\] 已排好序，任务是“将元素 3 插入到 nums 已排序区间的正确位置”（即元素 2 与 4 之间的索引 3）。

## 结构与关系

先将末尾的 3 暂存到 base，防止右移时被覆盖。依次把大于 3 的元素 5、4 向右复制一格；这些赋值会暂时留下两个 5 或两个 4。

比较到索引 2 的值 2 时停止右移，将 base 写入索引 3。左侧数组是固定输入快照，右侧四行展示实际数组的连续变化。

<table><caption>单次插入的数组变化</caption><thead><tr><th scope="col">动作</th><th scope="col">数组</th><th scope="col">base</th></tr></thead><tbody><tr><th scope="row">暂存末尾的 3</th><td>[1, 1, 2, 4, 5, 3]</td><td>3</td></tr><tr><th scope="row">把 5 复制到索引 5</th><td>[1, 1, 2, 4, 5, 5]</td><td>3</td></tr><tr><th scope="row">把 4 复制到索引 4</th><td>[1, 1, 2, 4, 4, 5]</td><td>3</td></tr><tr><th scope="row">将 3 写入索引 3</th><td>[1, 1, 2, 3, 4, 5]</td><td>3</td></tr></tbody></table>

<a id="source-261"></a>

将末尾索引 5 的元素 3 插入左侧有序前缀 \[1, 1, 2, 4, 5\]：先将 3 暂存到 base，再把大于 3 的 5 和 4 依次向右复制一格（中途短暂出现两个 5、两个 4），最后将 base 写回索引 3。四步详情见表格。

## 结果

通过 1 次暂存（base = 3）、2 次向右复制赋值（nums\[5\] = nums\[4\]、nums\[4\] = nums\[3\]）与 1 次写回（nums\[3\] = base），将末尾的 3 准确插入到索引 3，使整列六个元素恢复为升序数组 \[1, 1, 2, 3, 4, 5\]。

## 插入一个元素：暂存、右移与写回：动画

先保存末尾的 3，再把 5、4 各向右复制一格，最后将 3 写入索引 3。

输入数组为 nums = \[1, 1, 2, 4, 5, 3\]（索引 0 至 5），其中左侧前五个元素 \[1, 1, 2, 4, 5\] 已排好序，任务是“将元素 3 插入到 nums 已排序区间的正确位置”（即元素 2 与 4 之间的索引 3）。

先将末尾的 3 暂存到 base，防止右移时被覆盖。依次把大于 3 的元素 5、4 向右复制一格；这些赋值会暂时留下两个 5 或两个 4。

比较到索引 2 的值 2 时停止右移，将 base 写入索引 3。左侧数组是固定输入快照，右侧四行展示实际数组的连续变化。

### 第 1 步：暂存末尾的 3

先将末尾索引 5 的待插入元素 3 保存到变量 base = 3，防止后续右移覆盖时丢失数据；此时数组内容尚未改变。

<details><summary>本步完整状态</summary><p>把末尾的 3 插入左侧有序前缀：base 已保存为 3，六元素数组尚未改变。当前数组见表。</p><table><caption>当前数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>1</td></tr><tr><th scope="row">2</th><td>2</td></tr><tr><th scope="row">3</th><td>4</td></tr><tr><th scope="row">4</th><td>5</td></tr><tr><th scope="row">5</th><td>3</td></tr></tbody></table></details>

### 第 2 步：把 5 复制到索引 5

比较索引 4 的 5，因 5 大于 base（3），执行赋值 nums\[5\] = nums\[4\] 将 5 向右复制到索引 5，数组中暂时出现两个 5；原末尾的 3 已保存在 base 中并未丢失。

<details><summary>本步完整状态</summary><p>待插入值保存在 base=3。已把索引 4 的 5 复制到索引 5，两处暂时都是 5；当前数组见表。</p><table><caption>当前数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>1</td></tr><tr><th scope="row">2</th><td>2</td></tr><tr><th scope="row">3</th><td>4</td></tr><tr><th scope="row">4</th><td>5</td></tr><tr><th scope="row">5</th><td>5</td></tr></tbody></table></details>

### 第 3 步：把 4 复制到索引 4

继续向左比较索引 3 的 4，因 4 也大于 base（3），执行赋值 nums\[4\] = nums\[3\] 将 4 向右复制到索引 4，覆盖原先多余的 5，数组中暂时出现两个 4；base 仍为 3。

<details><summary>本步完整状态</summary><p>待插入值仍保存在 base=3。已把索引 3 的 4 复制到索引 4，两处暂时都是 4；当前数组见表。</p><table><caption>当前数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>1</td></tr><tr><th scope="row">2</th><td>2</td></tr><tr><th scope="row">3</th><td>4</td></tr><tr><th scope="row">4</th><td>4</td></tr><tr><th scope="row">5</th><td>5</td></tr></tbody></table></details>

### 第 4 步：将 3 写入索引 3

继续向左比较索引 2 的 2，因 2 不大于 base（3）而停止右移，执行 nums\[3\] = base 将暂存的 3 写入索引 3，消去重复的 4，完成本次插入。

<details><summary>本步完整状态</summary><p>已将 base 中的 3 写入索引 3，完成本次插入。六元素数组全部升序；原有两个 1 保持不变，右移产生的临时重复值已消除。</p><table><caption>当前数组</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>1</td></tr><tr><th scope="row">2</th><td>2</td></tr><tr><th scope="row">3</th><td>3</td></tr><tr><th scope="row">4</th><td>4</td></tr><tr><th scope="row">5</th><td>5</td></tr></tbody></table></details>

### 结果

通过 1 次暂存（base = 3）、2 次向右复制赋值（nums\[5\] = nums\[4\]、nums\[4\] = nums\[3\]）与 1 次写回（nums\[3\] = base），将末尾的 3 准确插入到索引 3，使整列六个元素恢复为升序数组 \[1, 1, 2, 3, 4, 5\]。
