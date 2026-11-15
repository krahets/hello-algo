<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: be7b4c318198e3597f1cdb76fde929ed8eed1979cc24b4f52f15a8ac9e0f7152 -->

# 全排列中剪掉已选元素

沿 1 → 3 → 2 的选择路径，用 selected 剪去当前排列前缀中已使用过的元素索引。

## 问题与输入

输入为 choices = \[1, 2, 3\]（索引 0、1、2），无相等元素，每个元素在同一排列中只能使用一次。state 保存当前排列前缀，布尔数组 selected 按输入索引记录该元素在当前路径中是否已被选用。

## 结构与关系

selected 仅限制当前递归路径内不重复选用同一索引：向下递归时跳过已标记索引，回溯返回时则会撤销该标记，因此选过 1 不会永久禁用 1，它在其他排列分支中仍可再次使用。

本图只完整展开 1 → 3 → 2 一条路径，剪掉的 \[1, 1\]、\[1, 3, 1\]、\[1, 3, 3\] 均重复使用了当前路径中的已用索引；其余 \[2\]、\[3\]、\[1, 2\] 三条合法分支仅以省略号收起。

<table><caption>突出路径上的选择限制</caption><thead><tr><th scope="col">当前前缀</th><th scope="col">已用索引（对应值）</th><th scope="col">仍可选择</th><th scope="col">图中继续的选择</th></tr></thead><tbody><tr><th scope="row">[]</th><td>无</td><td>1、2、3</td><td>1</td></tr><tr><th scope="row">[1]</th><td>0（值 1）</td><td>2、3</td><td>3</td></tr><tr><th scope="row">[1,3]</th><td>0（值 1）、2（值 3）</td><td>2</td><td>2</td></tr></tbody></table>

<table><caption>被收起的合法分支</caption><thead><tr><th scope="col">前缀</th><th scope="col">图中状态</th></tr></thead><tbody><tr><th scope="row">[2]</th><td>后续未展开</td></tr><tr><th scope="row">[3]</th><td>后续未展开</td></tr><tr><th scope="row">[1,2]</th><td>后续未展开</td></tr></tbody></table>

<a id="source-354"></a>

沿突出路径依次排除已使用的索引 0（值 1）与索引 2（值 3），第 3 轮只剩索引 1 的元素 2 可填入。

## 结果

图中突出路径最终生成排列 \[1, 3, 2\]。剪枝仅禁止同一元素在同一条路径中重复出现，回溯撤销标记后不影响其他分支继续选用该元素。
