<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: c81afd4e4d2292cdb30a2df900742cb51d26e8542df057fde45f9684ed7be312 -->

# 仅按和越界剪枝仍会生成重复组合

从累计和 0 出发累加 3、4、5，超过 9 的分支被剪除，但仍同时输出重复组合 \[4, 5\] 与 \[5, 4\]。

## 问题与输入

给定正整数候选数组 choices = \[3, 4, 5\] 与目标和 target = 9，允许同一元素重复选取，且结果子集（组合）不区分元素顺序。

## 结构与关系

圆节点表示当前前缀的累计和（根为 0），每轮从全部候选 3、4、5 中尝试累加：新和超过 9（图中 &gt;9 虚线剪枝，不构成新圆节点）则跳过；恰好等于 9 则记录结果并返回。

仅检查总和是否超过 9 并未限制选数先后顺序，\[4, 5\] 与 \[5, 4\] 都会达到累计和 9 并输出，从而产生重复组合。

<table><caption>累计和搜索树</caption><thead><tr><th scope="col">当前前缀</th><th scope="col">累计和</th><th scope="col">下一轮选择或终止原因</th></tr></thead><tbody><tr><th scope="row">[]</th><td>0</td><td>+3→3；+4→4；+5→5</td></tr><tr><th scope="row">[3]</th><td>3</td><td>+3→6；+4→7；+5→8</td></tr><tr><th scope="row">[4]</th><td>4</td><td>+3→7；+4→8；+5→9，记录 [4,5]</td></tr><tr><th scope="row">[5]</th><td>5</td><td>+3→8；+4→9，记录 [5,4]；+5 越界</td></tr><tr><th scope="row">[3, 3]</th><td>6</td><td>+3→9，记录 [3,3,3]；+4、+5 越界</td></tr><tr><th scope="row">[3, 4]</th><td>7</td><td>+3、+4、+5 全部越界</td></tr><tr><th scope="row">[3, 5]</th><td>8</td><td>+3、+4、+5 全部越界</td></tr><tr><th scope="row">[4, 3]</th><td>7</td><td>+3、+4、+5 全部越界</td></tr><tr><th scope="row">[4, 4]</th><td>8</td><td>+3、+4、+5 全部越界</td></tr><tr><th scope="row">[4, 5]</th><td>9</td><td>记录结果并返回</td></tr><tr><th scope="row">[5, 3]</th><td>8</td><td>+3、+4、+5 全部越界</td></tr><tr><th scope="row">[5, 4]</th><td>9</td><td>记录结果并返回</td></tr><tr><th scope="row">[3, 3, 3]</th><td>9</td><td>记录结果并返回</td></tr></tbody></table>

<a id="source-358"></a>

越界剪枝及时截断了和大于 9 的分支，但因每轮仍从头枚举全部候选，未能消除反序重复组合。

## 结果

越界剪枝虽能及时终止累计和超过 9 的分支，但搜索仍输出 \[3, 3, 3\]、\[4, 5\]、\[5, 4\] 三个结果，其中 \[4, 5\] 与 \[5, 4\] 是顺序不同但元素相同的重复组合。
