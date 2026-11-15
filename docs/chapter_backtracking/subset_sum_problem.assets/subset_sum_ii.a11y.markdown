<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: bd2fa2a3edc57a1924299e45a1ed95cb43b43f67c8389501212d0276385e3770 -->

# 子集和 II 的四种剪枝

对有序数组 \[4, 4̂, 5\] 搜索和为 9 的子集，综合四种剪枝条件后只保留唯一解 \[4, 5\]。

## 问题与输入

输入数组已排序为 choices = \[4, 4̂, 5\]（索引依次为 0、1、2，4̂ 的数值仍为 4，仅区分第二个 4 的身份），目标 target = 9。圆圈内的数字表示减法后的剩余 target（余额）。

## 结构与关系

每个索引最多用一次，子集不区分顺序。选中索引 i 后，下一轮从 start = i + 1 开始，同时实现两项规则：既不回头选更早索引（剪枝二），也不重用当前索引（剪枝三）。

根处跳过第二个 4 是同一轮值去重（剪枝四）；进入 \[4\] 后是新的一轮（start = 1），另一个 4（4̂）的索引尚未使用，仍可选它。前缀 \[4, 4̂\] 余额为 1，向后只剩 5；它超过余额（剪枝一），直接结束循环。

图中四种剪刀对应表一的四类排除情形，代码并不会实际递归进入被剪分支；其中 \[4, 4̂\] 下再选首个 4 在图中标为反序（剪枝二），它同时也已用过。

<table><caption>四种剪枝的含义</caption><thead><tr><th scope="col">图例</th><th scope="col">排除情形</th></tr></thead><tbody><tr><th scope="row">剪枝一（红）</th><td>选入后元素和超过9，即剩余 target 为负</td></tr><tr><th scope="row">剪枝二（蓝）</th><td>回到较早索引，产生不同顺序的重复组合</td></tr><tr><th scope="row">剪枝三（紫）</th><td>再次使用已选的同一个数组索引</td></tr><tr><th scope="row">剪枝四（青）</th><td>同一轮再次尝试数值相同的候选</td></tr></tbody></table>

<table><caption>图中各前缀的候选与处置</caption><thead><tr><th scope="col">当前前缀</th><th scope="col">剩余目标</th><th scope="col">候选</th><th scope="col">结果或剪枝原因</th></tr></thead><tbody><tr><th scope="row">[]</th><td>9</td><td>4</td><td>保留，余额 5</td></tr><tr><th scope="row">[]</th><td>9</td><td>4̂</td><td>同轮重复值，剪枝四</td></tr><tr><th scope="row">[]</th><td>9</td><td>5</td><td>保留，余额 4</td></tr><tr><th scope="row">[4]</th><td>5</td><td>4</td><td>重用当前索引，剪枝三</td></tr><tr><th scope="row">[4]</th><td>5</td><td>4̂</td><td>不同索引，可选，余额 1</td></tr><tr><th scope="row">[4]</th><td>5</td><td>5</td><td>余额 0，记录 [4,5]</td></tr><tr><th scope="row">[4,4̂]</th><td>1</td><td>4</td><td>回到更早索引，图示剪枝二</td></tr><tr><th scope="row">[4,4̂]</th><td>1</td><td>4̂</td><td>重用当前索引，剪枝三</td></tr><tr><th scope="row">[4,4̂]</th><td>1</td><td>5</td><td>超过余额，剪枝一</td></tr><tr><th scope="row">[5]</th><td>4</td><td>4、4̂</td><td>回到更早索引，剪枝二</td></tr><tr><th scope="row">[5]</th><td>4</td><td>5</td><td>重用当前索引，剪枝三</td></tr></tbody></table>

<a id="source-362"></a>

根处跳过同轮的第二个 4，而前缀 \[4\] 后开启新一轮，仍可选不同索引的 4̂；唯一成功路径是先选 4 再选 5。

## 结果

四种剪枝共同作用后，唯一使剩余 target 归零的路径是 \[4, 5\]。同轮去重剪掉了根处的 4̂，但不妨碍在前缀 \[4\] 后的新一轮选用不同索引的 4̂。
