<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 16ef151392363f103f951825e776839c4c89f91afa275a3adc0e2576de13280f -->

# 无相等元素全排列的递归选择树

从空前缀出发，每轮从 \[1, 2, 3\] 中选一个未用元素追加到 state，三轮生成 6 个全排列。

## 问题与输入

输入候选数组 choices = \[1, 2, 3\]，三个元素互不相同，且同一排列中每个元素只能使用一次。根节点画为三个空白槽位，表示尚未填入任何元素的空前缀 \[\]，空白槽位本身不是元素值。

## 结构与关系

从空前缀开始，每轮追加一个尚未使用的元素；图将所有递归分支同时展开，实际回溯代码在叶节点复制保存 state 后，会弹出末尾元素并撤销 selected 标记以尝试兄弟分支。

<table><caption>按前缀查找后续选择</caption><thead><tr><th scope="col">当前前缀</th><th scope="col">可选元素</th><th scope="col">下一层前缀或叶结果</th></tr></thead><tbody><tr><th scope="row">[]</th><td>1、2、3</td><td>[1]；[2]；[3]</td></tr><tr><th scope="row">[1]</th><td>2、3</td><td>[1, 2]；[1, 3]</td></tr><tr><th scope="row">[2]</th><td>1、3</td><td>[2, 1]；[2, 3]</td></tr><tr><th scope="row">[3]</th><td>1、2</td><td>[3, 1]；[3, 2]</td></tr><tr><th scope="row">[1, 2]</th><td>3</td><td>[1, 2, 3]</td></tr><tr><th scope="row">[1, 3]</th><td>2</td><td>[1, 3, 2]</td></tr><tr><th scope="row">[2, 1]</th><td>3</td><td>[2, 1, 3]</td></tr><tr><th scope="row">[2, 3]</th><td>1</td><td>[2, 3, 1]</td></tr><tr><th scope="row">[3, 1]</th><td>2</td><td>[3, 1, 2]</td></tr><tr><th scope="row">[3, 2]</th><td>1</td><td>[3, 2, 1]</td></tr></tbody></table>

<table><caption>全部六个排列</caption><thead><tr><th scope="col">结果序号</th><th scope="col">完整排列</th></tr></thead><tbody><tr><th scope="row">1</th><td>[1, 2, 3]</td></tr><tr><th scope="row">2</th><td>[1, 3, 2]</td></tr><tr><th scope="row">3</th><td>[2, 1, 3]</td></tr><tr><th scope="row">4</th><td>[2, 3, 1]</td></tr><tr><th scope="row">5</th><td>[3, 1, 2]</td></tr><tr><th scope="row">6</th><td>[3, 2, 1]</td></tr></tbody></table>

<a id="source-353"></a>

每条从根到叶的路径依次选完三个不同元素，中途节点表示已填好的排列前缀。

## 结果

第一、二、三轮每个节点的可选元素个数依次为 3、2、1，共生成 3 × 2 × 1 = 6 个叶节点，对应 \[1, 2, 3\] 的全部 6 个全排列。
