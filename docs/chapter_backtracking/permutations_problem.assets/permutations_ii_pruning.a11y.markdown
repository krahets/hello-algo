<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: ada547c2823935b1c470aa59fca4590020c0e3a3278216de7fe9f561557e7cbb -->

# 同轮剪掉相等元素分支

在同一轮选择中对相等数值 1 只尝试一次，提前剪去重复的搜索子树。

## 问题与输入

输入为 choices = \[1, 1̂, 2\]，索引依次为 0、1、2；1̂ 仅区分第二个 1 的身份，实际数值仍为 1。

## 结构与关系

含相等元素的全排列需同时遵守两条约束：同一路径不能重复选用同一输入索引（selected）；同一轮不能重复尝试相等数值（duplicated）。

每个递归调用独立创建 duplicated，只管当前这一轮循环，回溯只撤销 selected 与 state。因此同一轮跳过第二个 1（1̂）后，进入下一轮递归调用时仍可选用尚未使用的另一个 1 的索引，使结果依然包含两个 1。

<table><caption>各前缀的一轮选择</caption><thead><tr><th scope="col">当前前缀</th><th scope="col">保留的候选</th><th scope="col">因已用索引跳过</th><th scope="col">因同轮重复值跳过</th></tr></thead><tbody><tr><th scope="row">[]</th><td>1、2</td><td>无</td><td>1̂：本轮已尝试值 1</td></tr><tr><th scope="row">[1]</th><td>1̂、2</td><td>1：索引 0 已在路径中</td><td>无</td></tr><tr><th scope="row">[1,1̂]</th><td>2</td><td>1、1̂：对应索引都已使用</td><td>无</td></tr><tr><th scope="row">[1,2]</th><td>1̂</td><td>1、2：对应索引都已使用</td><td>无</td></tr><tr><th scope="row">[2]</th><td>1</td><td>2：索引 2 已在路径中</td><td>1̂：本轮已尝试值 1</td></tr><tr><th scope="row">[2,1]</th><td>1̂</td><td>2、1：对应索引都已使用</td><td>无</td></tr></tbody></table>

<table><caption>三个唯一排列</caption><thead><tr><th scope="col">结果序号</th><th scope="col">区分两个 1 的身份写法</th><th scope="col">实际数值结果</th></tr></thead><tbody><tr><th scope="row">1</th><td>[1,1̂,2]</td><td>[1,1,2]</td></tr><tr><th scope="row">2</th><td>[1,2,1̂]</td><td>[1,2,1]</td></tr><tr><th scope="row">3</th><td>[2,1,1̂]</td><td>[2,1,1]</td></tr></tbody></table>

<a id="source-356"></a>

图中标出根 \[\] 下跳过 \[1̂\] 与前缀 \[2\] 下跳过 \[2, 1̂\] 两处同轮重复值剪枝，而不同轮次仍可先后选用两个不同索引的 1。

## 结果

通过在同轮跳过相等候选，搜索树提前剪去重复子树，直接留下 \[1, 1, 2\]、\[1, 2, 1\]、\[2, 1, 1\] 三个唯一排列。
