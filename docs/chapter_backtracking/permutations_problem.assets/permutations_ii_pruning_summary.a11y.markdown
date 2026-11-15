<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 5ab2453d9c7f27b7d3102282bb153c2cbac60b2cfe6387738e186ce0d4d7976e -->

# 两种排列剪枝分别限制索引与数值

并列对照路径索引不重复（selected）与同轮数值不重复（duplicated）两类剪枝条件。

## 问题与输入

输入为 choices = \[1, 1̂, 2\]（索引 0、1、2，1̂ 仅区分第二个 1 的身份，数值仍为 1）。selected 沿当前路径记录已用索引并在回溯时恢复；duplicated 在每次递归调用内部独立创建，记录本轮已尝试的数值。

## 结构与关系

路径索引剪枝（图中黑剪刀）禁止在同一条排列路径中重复选用已用索引；同轮相等值剪枝（图中红剪刀）禁止在同一层循环中再次尝试本轮已选过的数值。

由于 duplicated 的作用域仅限当前这一轮递归调用，第 1 轮在根处跳过 1̂ 不会阻止下一轮递归调用继续选择尚未使用的索引 1（1̂），所以最终结果仍可包含两个 1。

<table><caption>各前缀的一轮选择</caption><thead><tr><th scope="col">当前前缀</th><th scope="col">保留的候选</th><th scope="col">因已用索引跳过</th><th scope="col">因同轮重复值跳过</th></tr></thead><tbody><tr><th scope="row">[]</th><td>1、2</td><td>无</td><td>1̂：本轮已尝试值 1</td></tr><tr><th scope="row">[1]</th><td>1̂、2</td><td>1：索引 0 已在路径中</td><td>无</td></tr><tr><th scope="row">[1,1̂]</th><td>2</td><td>1、1̂：对应索引都已使用</td><td>无</td></tr><tr><th scope="row">[1,2]</th><td>1̂</td><td>1、2：对应索引都已使用</td><td>无</td></tr><tr><th scope="row">[2]</th><td>1</td><td>2：索引 2 已在路径中</td><td>1̂：本轮已尝试值 1</td></tr><tr><th scope="row">[2,1]</th><td>1̂</td><td>2、1：对应索引都已使用</td><td>无</td></tr></tbody></table>

<table><caption>三个唯一排列</caption><thead><tr><th scope="col">结果序号</th><th scope="col">区分两个 1 的身份写法</th><th scope="col">实际数值结果</th></tr></thead><tbody><tr><th scope="row">1</th><td>[1,1̂,2]</td><td>[1,1,2]</td></tr><tr><th scope="row">2</th><td>[1,2,1̂]</td><td>[1,2,1]</td></tr><tr><th scope="row">3</th><td>[2,1,1̂]</td><td>[2,1,1]</td></tr></tbody></table>

<a id="source-357"></a>

根 \[\] 与前缀 \[2\] 处跳过 1̂ 属于同轮重复值剪枝（红剪刀），其余跳过当前路径已含元素的分支均属于路径索引剪枝（黑剪刀）。

## 结果

两种剪枝各司其职、不可互相替代：selected 保证每个输入索引在一条路径中只用一次，duplicated 保证同一轮不因相等数值产生重复分支，最终输出 \[1, 1̂, 2\]、\[1, 2, 1̂\]、\[2, 1, 1̂\]。
