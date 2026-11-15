<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 6a59f8cba503103dee0c62441466919401683f8715d64ac81eb8636014650dc3 -->

# 用不递减的选择索引避免重复组合

限制下一轮只从当前索引 i 及之后选取（start = i），剪去回头选更早索引的反序重复分支。

## 问题与输入

候选数组为 choices = \[3, 4, 5\]（索引 0、1、2），各元素允许重复选取，且子集不区分元素顺序。本图仅展开前两轮选择来对比选数顺序与重复子集的关系，未展开第三轮及目标和判断。

## 结构与关系

组合不区分元素先后：先选较大索引再回头选较小索引，必定与先选较小索引再选较大索引的路径重复。因此选了 4 后不再回头选 3，选了 5 后不再回头选 3 或 4。

由于本题允许同一元素重复选取（如 \[3, 3, …\]、\[4, 4, …\]、\[5, 5, …\]），当本轮选中索引 i 时，下一轮起始位置必须设为 start = i 而非 i + 1，以保留再次选择当前元素的分支。图中末尾的省略号仅表示尚有后续选择，不表示已达到目标和。

<table><caption>九个两元素前缀及三对重复</caption><thead><tr><th scope="col">两元素前缀</th><th scope="col">处理</th><th scope="col">反序配对前缀</th><th scope="col">原因</th></tr></thead><tbody><tr><th scope="row">[3,3,…]</th><td>保留</td><td>无另一顺序的配对</td><td>索引不递减</td></tr><tr><th scope="row">[3,4,…]</th><td>保留</td><td>[4,3,…]</td><td>索引不递减</td></tr><tr><th scope="row">[3,5,…]</th><td>保留</td><td>[5,3,…]</td><td>索引不递减</td></tr><tr><th scope="row">[4,3,…]</th><td>跳过更早索引</td><td>[3,4,…]</td><td>与保留前缀产生重复组合</td></tr><tr><th scope="row">[4,4,…]</th><td>保留</td><td>无另一顺序的配对</td><td>索引不递减</td></tr><tr><th scope="row">[4,5,…]</th><td>保留</td><td>[5,4,…]</td><td>索引不递减</td></tr><tr><th scope="row">[5,3,…]</th><td>跳过更早索引</td><td>[3,5,…]</td><td>与保留前缀产生重复组合</td></tr><tr><th scope="row">[5,4,…]</th><td>跳过更早索引</td><td>[4,5,…]</td><td>与保留前缀产生重复组合</td></tr><tr><th scope="row">[5,5,…]</th><td>保留</td><td>无另一顺序的配对</td><td>索引不递减</td></tr></tbody></table>

<a id="source-359"></a>

通过要求选择索引不递减，每对反序组合只保留先选较小索引的一支，同时保留重复取同一元素的分支。

## 结果

在递归中用起始索引 start 约束下一轮只从当前索引 i 及之后选取（即传入 start=i），既能保留同一元素的重复选取，又能彻底避免顺序不同的重复子集。
